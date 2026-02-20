import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { query } from './connection.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const SEEDS_DIR = path.resolve(__dirname, '../../seeds');

export async function runSeeds() {
  await query(`
    CREATE TABLE IF NOT EXISTS _seeds (
      id SERIAL PRIMARY KEY,
      name TEXT NOT NULL UNIQUE,
      applied_at TIMESTAMP NOT NULL DEFAULT NOW()
    )
  `);

  const applied = await query<{ name: string }>('SELECT name FROM _seeds ORDER BY name');
  const appliedSet = new Set(applied.rows.map((r) => r.name));

  const files = fs.readdirSync(SEEDS_DIR).filter((f) => f.endsWith('.sql')).sort();

  for (const file of files) {
    if (appliedSet.has(file)) continue;
    const sql = fs.readFileSync(path.join(SEEDS_DIR, file), 'utf-8');
    console.log(`Running seed: ${file}`);
    await query(sql);
    await query('INSERT INTO _seeds (name) VALUES ($1)', [file]);
  }

  console.log('Seeds complete.');
}

if (process.argv[1] && process.argv[1].includes('seed')) {
  runSeeds()
    .then(() => process.exit(0))
    .catch((err) => { console.error(err); process.exit(1); });
}
