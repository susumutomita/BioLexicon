import { serve } from '@hono/node-server';
import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { logger } from 'hono/logger';
import { pool } from './db/connection.js';
import { runMigrations } from './db/migrate.js';
import { runSeeds } from './db/seed.js';
import { apiKeyMiddleware } from './middlewares/apiKey.js';
import { errorHandler } from './middlewares/errorHandler.js';
import { termsRoutes } from './routes/terms.js';
import { graphRoutes } from './routes/graph.js';
import { contextRoutes } from './routes/context.js';
import { authRoutes } from './routes/auth.js';
import { notesRoutes } from './routes/notes.js';
import { recommendationsRoutes } from './routes/recommendations.js';

const app = new Hono();

app.use('*', logger());
app.use('*', cors());
app.use('*', errorHandler);

app.get('/health', (c) => c.json({ status: 'ok' }));

// Public auth routes (no API key needed)
app.route('/api/v1/auth', authRoutes);

// API-key protected routes
app.use('/api/v1/*', apiKeyMiddleware);
app.route('/api/v1/terms', termsRoutes);
app.route('/api/v1/graph', graphRoutes);
app.route('/api/v1/context-lookup', contextRoutes);
app.route('/api/v1/users', notesRoutes);
app.route('/api/v1/users', recommendationsRoutes);

const port = Number(process.env.PORT) || 3000;

async function start() {
  await runMigrations();
  await runSeeds();
  serve({ fetch: app.fetch, port }, (info) => {
    console.log(`BioLexicon API running on http://localhost:${info.port}`);
  });
}

start().catch((err) => {
  console.error('Failed to start server:', err);
  process.exit(1);
});
