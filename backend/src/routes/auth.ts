import { Hono } from 'hono';
import { z } from 'zod';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import crypto from 'node:crypto';
import { query } from '../db/connection.js';
import type { User } from '../types/index.js';

export const authRoutes = new Hono();

const JWT_SECRET = process.env.JWT_SECRET || 'dev-jwt-secret-change-in-prod';
const SALT_ROUNDS = 10;
const MAX_FAILED_ATTEMPTS = 10;
const LOCK_DURATION_MS = 15 * 60 * 1000; // 15 minutes

const registerSchema = z.object({
  email: z.string().email('Invalid email address'),
  password: z.string().min(8, 'Password must be at least 8 characters'),
});

const loginSchema = z.object({
  email: z.string().email('Invalid email address'),
  password: z.string().min(1, 'Password is required'),
});

authRoutes.post('/register', async (c) => {
  let body: unknown;
  try {
    body = await c.req.json();
  } catch {
    return c.json({ error: 'Invalid JSON body' }, 400);
  }

  const parsed = registerSchema.safeParse(body);
  if (!parsed.success) {
    return c.json({ error: parsed.error.issues[0].message }, 400);
  }

  const { email, password } = parsed.data;

  // Check if email already exists
  const existing = await query('SELECT id FROM users WHERE email = $1', [email]);
  if (existing.rows.length > 0) {
    return c.json({ error: 'Email already registered' }, 409);
  }

  const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);
  const apiKey = crypto.randomUUID();

  const result = await query<User>(
    `INSERT INTO users (email, password_hash, api_key)
     VALUES ($1, $2, $3)
     RETURNING id, email, api_key`,
    [email, passwordHash, apiKey],
  );

  const user = result.rows[0];
  return c.json({
    user: {
      id: user.id,
      email: user.email,
      api_key: user.api_key,
    },
  }, 201);
});

authRoutes.post('/login', async (c) => {
  let body: unknown;
  try {
    body = await c.req.json();
  } catch {
    return c.json({ error: 'Invalid JSON body' }, 400);
  }

  const parsed = loginSchema.safeParse(body);
  if (!parsed.success) {
    return c.json({ error: parsed.error.issues[0].message }, 400);
  }

  const { email, password } = parsed.data;

  const result = await query<User>(
    'SELECT * FROM users WHERE email = $1',
    [email],
  );

  if (result.rows.length === 0) {
    return c.json({ error: 'Invalid email or password' }, 401);
  }

  const user = result.rows[0];

  // Check if account is locked
  if (
    user.failed_login_attempts >= MAX_FAILED_ATTEMPTS &&
    user.locked_until &&
    new Date(user.locked_until) > new Date()
  ) {
    return c.json({ error: 'Account is temporarily locked. Please try again later.' }, 429);
  }

  const passwordValid = await bcrypt.compare(password, user.password_hash);

  if (!passwordValid) {
    const newAttempts = user.failed_login_attempts + 1;
    if (newAttempts >= MAX_FAILED_ATTEMPTS) {
      const lockUntil = new Date(Date.now() + LOCK_DURATION_MS);
      await query(
        `UPDATE users
         SET failed_login_attempts = $1, locked_until = $2
         WHERE id = $3`,
        [newAttempts, lockUntil.toISOString(), user.id],
      );
    } else {
      await query(
        'UPDATE users SET failed_login_attempts = $1 WHERE id = $2',
        [newAttempts, user.id],
      );
    }
    return c.json({ error: 'Invalid email or password' }, 401);
  }

  // Successful login: reset failed attempts
  await query(
    'UPDATE users SET failed_login_attempts = 0, locked_until = NULL WHERE id = $1',
    [user.id],
  );

  const token = jwt.sign(
    { userId: user.id, email: user.email },
    JWT_SECRET,
    { expiresIn: '24h' },
  );

  return c.json({
    token,
    user: {
      id: user.id,
      email: user.email,
    },
  });
});
