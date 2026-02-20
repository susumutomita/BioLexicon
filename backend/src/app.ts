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

export default app;
