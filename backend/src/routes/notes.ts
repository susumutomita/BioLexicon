import { Hono } from 'hono';
import { z } from 'zod';
import { query } from '../db/connection.js';
import { jwtMiddleware, requireSameUser } from '../middlewares/auth.js';
import type { UserNote } from '../types/index.js';

export const notesRoutes = new Hono();

// All routes require authentication and same-user check
notesRoutes.use('/:userId/*', jwtMiddleware, requireSameUser);
notesRoutes.use('/:userId/notes', jwtMiddleware, requireSameUser);
notesRoutes.use('/:userId/history', jwtMiddleware, requireSameUser);

const createNoteSchema = z.object({
  termId: z.number().int().positive(),
  memo: z.string().max(5000, 'Memo must be at most 5000 characters'),
  tags: z.array(z.string()).max(10, 'Maximum 10 tags allowed').default([]),
});

const noteQuerySchema = z.object({
  q: z.string().optional(),
  tag: z.string().optional(),
});

const historyBodySchema = z.object({
  termId: z.number().int().positive(),
});

// POST /:userId/notes - Create or update a note
notesRoutes.post('/:userId/notes', async (c) => {
  const userId = Number(c.req.param('userId'));

  let body: unknown;
  try {
    body = await c.req.json();
  } catch {
    return c.json({ error: 'Invalid JSON body' }, 400);
  }

  const parsed = createNoteSchema.safeParse(body);
  if (!parsed.success) {
    return c.json({ error: parsed.error.issues[0].message }, 400);
  }

  const { termId, memo, tags } = parsed.data;

  // Verify term exists
  const termExists = await query('SELECT id FROM terms WHERE id = $1', [termId]);
  if (termExists.rows.length === 0) {
    return c.json({ error: 'Term not found' }, 404);
  }

  const result = await query<UserNote>(
    `INSERT INTO user_notes (user_id, term_id, memo, tags)
     VALUES ($1, $2, $3, $4)
     ON CONFLICT (user_id, term_id)
     DO UPDATE SET memo = EXCLUDED.memo, tags = EXCLUDED.tags, updated_at = NOW()
     RETURNING *`,
    [userId, termId, memo, tags],
  );

  return c.json({ note: result.rows[0] }, 201);
});

// GET /:userId/notes - List notes with optional search/filter
notesRoutes.get('/:userId/notes', async (c) => {
  const userId = Number(c.req.param('userId'));
  const rawQ = c.req.query('q');
  const rawTag = c.req.query('tag');

  const parsed = noteQuerySchema.safeParse({ q: rawQ, tag: rawTag });
  if (!parsed.success) {
    return c.json({ error: parsed.error.issues[0].message }, 400);
  }

  const { q, tag } = parsed.data;

  const conditions: string[] = ['un.user_id = $1'];
  const params: any[] = [userId];
  let paramIndex = 2;

  if (q) {
    conditions.push(`un.memo_tsv @@ plainto_tsquery('english', $${paramIndex})`);
    params.push(q);
    paramIndex++;
  }

  if (tag) {
    conditions.push(`$${paramIndex} = ANY(un.tags)`);
    params.push(tag);
    paramIndex++;
  }

  const whereClause = conditions.join(' AND ');

  const result = await query<UserNote>(
    `SELECT un.*
     FROM user_notes un
     WHERE ${whereClause}
     ORDER BY un.updated_at DESC`,
    params,
  );

  return c.json({ notes: result.rows });
});

// GET /:userId/history - Get view history
notesRoutes.get('/:userId/history', async (c) => {
  const userId = Number(c.req.param('userId'));

  const result = await query(
    `SELECT t.id AS "termId", t.name, t.name_ja, vh.viewed_at AS "viewedAt"
     FROM view_history vh
     JOIN terms t ON t.id = vh.term_id
     WHERE vh.user_id = $1
     ORDER BY vh.viewed_at DESC
     LIMIT 50`,
    [userId],
  );

  return c.json({ history: result.rows });
});

// POST /:userId/history - Record view history
notesRoutes.post('/:userId/history', async (c) => {
  const userId = Number(c.req.param('userId'));

  let body: unknown;
  try {
    body = await c.req.json();
  } catch {
    return c.json({ error: 'Invalid JSON body' }, 400);
  }

  const parsed = historyBodySchema.safeParse(body);
  if (!parsed.success) {
    return c.json({ error: parsed.error.issues[0].message }, 400);
  }

  const { termId } = parsed.data;

  // Verify term exists
  const termExists = await query('SELECT id FROM terms WHERE id = $1', [termId]);
  if (termExists.rows.length === 0) {
    return c.json({ error: 'Term not found' }, 404);
  }

  await query(
    'INSERT INTO view_history (user_id, term_id) VALUES ($1, $2)',
    [userId, termId],
  );

  return c.json({ success: true }, 201);
});
