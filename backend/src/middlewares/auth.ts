import { Context, Next } from 'hono';
import jwt from 'jsonwebtoken';

const JWT_SECRET = process.env.JWT_SECRET || 'dev-jwt-secret-change-in-prod';

export interface JwtPayload {
  userId: number;
  email: string;
}

export async function jwtMiddleware(c: Context, next: Next) {
  const authHeader = c.req.header('Authorization');
  if (!authHeader?.startsWith('Bearer ')) {
    return c.json({ error: 'Bearer token required' }, 401);
  }

  try {
    const token = authHeader.slice(7);
    const payload = jwt.verify(token, JWT_SECRET) as JwtPayload;
    c.set('userId', payload.userId);
    c.set('email', payload.email);
    await next();
  } catch {
    return c.json({ error: 'Invalid or expired token' }, 401);
  }
}

export async function requireSameUser(c: Context, next: Next) {
  const tokenUserId = c.get('userId') as number;
  const paramUserId = Number(c.req.param('userId'));
  if (tokenUserId !== paramUserId) {
    return c.json({ error: 'Forbidden' }, 403);
  }
  await next();
}
