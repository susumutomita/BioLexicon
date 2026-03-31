import pg from 'pg';

const { Pool } = pg;

// Strip channel_binding param which is unsupported by node-pg
const rawUrl = process.env.DATABASE_URL || 'postgres://biolexicon:biolexicon@localhost:5432/biolexicon';
const connectionString = rawUrl.replace(/[&?]channel_binding=[^&]*/g, '');
const isLocal = connectionString.includes('localhost') || connectionString.includes('127.0.0.1');

export const pool = new Pool({
  connectionString,
  ssl: isLocal ? undefined : { rejectUnauthorized: false },
  max: process.env.VERCEL ? 1 : 10,
});

export async function query<T extends pg.QueryResultRow = any>(
  text: string,
  params?: any[],
): Promise<pg.QueryResult<T>> {
  return pool.query<T>(text, params);
}
