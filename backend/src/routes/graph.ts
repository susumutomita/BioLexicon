import { Hono } from 'hono';
import { z } from 'zod';
import { query } from '../db/connection.js';
import type { GraphNode, GraphEdge } from '../types/index.js';

export const graphRoutes = new Hono();

const graphQuerySchema = z.object({
  rootTermId: z.coerce.number().int().positive(),
  depth: z.coerce.number().int().min(1).max(5).default(2),
});

graphRoutes.get('/', async (c) => {
  const rawRootTermId = c.req.query('rootTermId');
  const rawDepth = c.req.query('depth');

  const parsed = graphQuerySchema.safeParse({
    rootTermId: rawRootTermId,
    depth: rawDepth ?? 2,
  });

  if (!parsed.success) {
    return c.json({ error: parsed.error.issues[0].message }, 400);
  }

  const { rootTermId, depth } = parsed.data;

  // Verify root term exists
  const rootResult = await query(
    'SELECT id, name, name_ja FROM terms WHERE id = $1',
    [rootTermId],
  );

  if (rootResult.rows.length === 0) {
    return c.json({ error: 'Root term not found' }, 404);
  }

  // BFS traversal
  const visitedNodeIds = new Set<number>();
  const nodes: GraphNode[] = [];
  const edges: GraphEdge[] = [];
  const edgeIds = new Set<string>();
  let currentLevel = [rootTermId];

  for (let d = 0; d <= depth && currentLevel.length > 0; d++) {
    const unvisited = currentLevel.filter((id) => !visitedNodeIds.has(id));
    if (unvisited.length === 0) break;

    // Fetch node data for current level
    const nodeResult = await query(
      'SELECT id, name, name_ja FROM terms WHERE id = ANY($1)',
      [unvisited],
    );

    for (const row of nodeResult.rows) {
      if (!visitedNodeIds.has(row.id)) {
        visitedNodeIds.add(row.id);
        nodes.push({
          data: {
            id: String(row.id),
            label: row.name,
            label_ja: row.name_ja,
          },
        });
      }
    }

    if (d === depth) break;

    // Fetch edges from current level nodes
    const edgeResult = await query(
      `SELECT id, source_term_id, target_term_id, relation_type, description
       FROM term_relations
       WHERE source_term_id = ANY($1) OR target_term_id = ANY($1)`,
      [unvisited],
    );

    const nextLevel: number[] = [];

    for (const row of edgeResult.rows) {
      const edgeKey = `${row.source_term_id}-${row.target_term_id}-${row.relation_type}`;
      if (!edgeIds.has(edgeKey)) {
        edgeIds.add(edgeKey);
        edges.push({
          data: {
            id: String(row.id),
            source: String(row.source_term_id),
            target: String(row.target_term_id),
            label: row.description ?? row.relation_type,
            relation_type: row.relation_type,
          },
        });
      }

      // Collect next level nodes
      if (!visitedNodeIds.has(row.target_term_id)) {
        nextLevel.push(row.target_term_id);
      }
      if (!visitedNodeIds.has(row.source_term_id)) {
        nextLevel.push(row.source_term_id);
      }
    }

    currentLevel = [...new Set(nextLevel)];
  }

  return c.json({ elements: { nodes, edges } });
});
