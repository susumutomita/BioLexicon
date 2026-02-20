import { serve } from '@hono/node-server';
import app from './app.js';
import { runMigrations } from './db/migrate.js';
import { runSeeds } from './db/seed.js';

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
