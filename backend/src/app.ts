import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { logger } from 'hono/logger';
import { apiKeyMiddleware } from './middlewares/apiKey.js';
import { errorHandler } from './middlewares/errorHandler.js';
import { termsRoutes } from './routes/terms.js';
import { graphRoutes } from './routes/graph.js';
import { contextRoutes } from './routes/context.js';
import { authRoutes } from './routes/auth.js';
import { notesRoutes } from './routes/notes.js';
import { recommendationsRoutes } from './routes/recommendations.js';
import { query } from './db/connection.js';
import { runMigrations } from './db/migrate.js';
import { runSeeds } from './db/seed.js';

const app = new Hono();

// Auto-initialize DB on first request if tables are missing
let dbReady = false;
async function ensureDb() {
  if (dbReady) return;
  try {
    const check = await query(
      "SELECT EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'terms') AS e"
    );
    if (!check.rows[0].e) {
      console.log('[ensureDb] tables missing – running migrations + seeds');
      await runMigrations();
      await runSeeds();
    } else {
      const count = await query('SELECT COUNT(*) AS n FROM terms');
      if (Number(count.rows[0].n) === 0) {
        console.log('[ensureDb] terms empty – running seeds');
        await runSeeds();
      }
    }
    dbReady = true;
  } catch (err) {
    console.error('[ensureDb] failed:', err);
  }
}

app.use('*', logger());
app.use('*', cors());
app.use('*', errorHandler);

app.get('/health', async (c) => {
  await ensureDb();
  try {
    const r = await query('SELECT COUNT(*) AS n FROM terms');
    return c.json({ status: 'ok', terms: Number(r.rows[0].n) });
  } catch (e: any) {
    return c.json({ status: 'error', message: e.message }, 500);
  }
});

// Public auth routes (no API key needed)
app.route('/api/v1/auth', authRoutes);

// Ensure DB before API calls
app.use('/api/v1/*', async (_, next) => { await ensureDb(); return next(); });

// API-key protected routes
app.use('/api/v1/*', apiKeyMiddleware);
app.route('/api/v1/terms', termsRoutes);
app.route('/api/v1/graph', graphRoutes);
app.route('/api/v1/context-lookup', contextRoutes);
app.route('/api/v1/users', notesRoutes);
app.route('/api/v1/users', recommendationsRoutes);

export default app;
