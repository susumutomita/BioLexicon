import { Hono } from 'hono';
import { query } from '../db/connection.js';
import { jwtMiddleware, requireSameUser } from '../middlewares/auth.js';
import type { Term } from '../types/index.js';

export const recommendationsRoutes = new Hono();

// Require authentication and same-user check
recommendationsRoutes.use('/:userId/*', jwtMiddleware, requireSameUser);
recommendationsRoutes.use('/:userId/recommendations', jwtMiddleware, requireSameUser);

const MIN_VIEWS_FOR_RECOMMENDATIONS = 5;
const MAX_RECOMMENDATIONS = 10;

recommendationsRoutes.get('/:userId/recommendations', async (c) => {
  const userId = Number(c.req.param('userId'));

  // Get user's viewed term IDs
  const viewedResult = await query<{ term_id: number }>(
    'SELECT DISTINCT term_id FROM view_history WHERE user_id = $1',
    [userId],
  );

  const viewedTermIds = viewedResult.rows.map((row) => row.term_id);

  if (viewedTermIds.length < MIN_VIEWS_FOR_RECOMMENDATIONS) {
    return c.json({
      recommendations: [],
      message: 'もう少し用語を調べると推薦が始まります',
    });
  }

  // Find prerequisite terms:
  // Terms that are the TARGET of "prerequisite" relations FROM viewed terms,
  // but NOT yet viewed by the user.
  //
  // Relation semantics: source_term_id --prerequisite--> target_term_id
  // means target_term_id is a prerequisite for source_term_id.
  // So if user viewed source, they should know target (the prerequisite).
  const prereqResult = await query(
    `SELECT DISTINCT
       t.*,
       tr.source_term_id,
       src.name AS source_name
     FROM term_relations tr
     JOIN terms t ON t.id = tr.target_term_id
     JOIN terms src ON src.id = tr.source_term_id
     WHERE tr.relation_type = 'prerequisite'
       AND tr.source_term_id = ANY($1)
       AND tr.target_term_id != ALL($1)
     LIMIT $2`,
    [viewedTermIds, MAX_RECOMMENDATIONS],
  );

  if (prereqResult.rows.length === 0) {
    return c.json({
      recommendations: [],
      message: '基礎はカバー済み。応用トピックを探索しましょう',
    });
  }

  const recommendations = prereqResult.rows.map((row) => {
    const { source_term_id, source_name, ...termData } = row;
    return {
      term: termData as Term,
      reason: `Understanding ${source_name} requires knowledge of ${termData.name}`,
    };
  });

  return c.json({ recommendations });
});
