import { Context, Next } from 'hono';
import { query } from '../db/connection.js';

const DEV_API_KEY = process.env.DEV_API_KEY || 'dev-api-key';

export async function apiKeyMiddleware(c: Context, next: Next) {
  // Skip for auth routes
  if (c.req.path.startsWith('/api/v1/auth')) {
    return next();
  }

  const apiKey = c.req.header('X-API-Key');
  if (!apiKey) {
    return c.json({ error: 'X-API-Key header is required' }, 401);
  }

  // Accept dev key or valid user key
  if (apiKey === DEV_API_KEY) {
    return next();
  }

  const result = await query('SELECT id FROM users WHERE api_key = $1', [apiKey]);
  if (result.rows.length === 0) {
    return c.json({ error: 'Invalid API key' }, 401);
  }

  return next();
}
