import { Hono } from 'hono';
import { z } from 'zod';
import { query } from '../db/connection.js';
import type { Term } from '../types/index.js';

export const termsRoutes = new Hono();

const searchSchema = z.object({
  q: z.string().min(1, 'Search query is required'),
  lang: z.enum(['en', 'ja']).default('en'),
});

termsRoutes.get('/', async (c) => {
  const rawQ = c.req.query('q') ?? '';
  const rawLang = c.req.query('lang') ?? 'en';

  const parsed = searchSchema.safeParse({ q: rawQ, lang: rawLang });
  if (!parsed.success) {
    return c.json({ error: parsed.error.issues[0].message }, 400);
  }

  const { q, lang } = parsed.data;

  // Reject queries that are only special characters / whitespace
  if (!/[a-zA-Z0-9\u3000-\u9FFF\uF900-\uFAFF]/.test(q)) {
    return c.json({ error: 'Search query must contain at least one alphanumeric or CJK character' }, 400);
  }

  const sanitized = q.replace(/%/g, '\\%').replace(/_/g, '\\_');
  const prefixPattern = `${sanitized}%`;
  const containsPattern = `%${sanitized}%`;

  let result;
  if (lang === 'ja') {
    result = await query<Term>(
      `SELECT DISTINCT t.* FROM terms t
       WHERE t.name_ja ILIKE $1
          OR t.name_ja ILIKE $2
          OR t.name ILIKE $1
          OR $3 ILIKE ANY(SELECT '%' || unnest(t.synonyms) || '%')
       ORDER BY t.name
       LIMIT 50`,
      [prefixPattern, containsPattern, q],
    );
  } else {
    result = await query<Term>(
      `SELECT DISTINCT t.* FROM terms t
       WHERE t.name ILIKE $1
          OR t.name ILIKE $2
          OR $3 = ANY(t.synonyms)
          OR EXISTS (
            SELECT 1 FROM unnest(t.synonyms) AS syn
            WHERE syn ILIKE $1 OR syn ILIKE $2
          )
       ORDER BY t.name
       LIMIT 50`,
      [prefixPattern, containsPattern, q],
    );
  }

  return c.json({ terms: result.rows });
});

termsRoutes.get('/:id', async (c) => {
  const id = Number(c.req.param('id'));
  if (Number.isNaN(id)) {
    return c.json({ error: 'Invalid term ID' }, 400);
  }

  const termResult = await query<Term>(
    'SELECT * FROM terms WHERE id = $1',
    [id],
  );

  if (termResult.rows.length === 0) {
    return c.json({ error: 'Term not found' }, 404);
  }

  const term = termResult.rows[0];

  const relatedResult = await query(
    `SELECT t.*, tr.relation_type, tr.description AS relation_description
     FROM term_relations tr
     JOIN terms t ON (
       (tr.source_term_id = $1 AND t.id = tr.target_term_id)
       OR (tr.target_term_id = $1 AND t.id = tr.source_term_id)
     )
     WHERE tr.source_term_id = $1 OR tr.target_term_id = $1`,
    [id],
  );

  const relatedTerms = relatedResult.rows.map((row) => {
    const { relation_type, relation_description, ...termData } = row;
    return {
      term: termData as Term,
      relation_type: relation_type as string,
      description: (relation_description ?? '') as string,
    };
  });

  return c.json({ term, relatedTerms });
});
