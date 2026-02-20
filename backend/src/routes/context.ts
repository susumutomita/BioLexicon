import { Hono } from 'hono';
import { z } from 'zod';
import { query } from '../db/connection.js';

export const contextRoutes = new Hono();

const MAX_TEXT_LENGTH = 2000;

const contextBodySchema = z.object({
  text: z.string().min(1, 'Text is required').max(MAX_TEXT_LENGTH),
});

// In-memory term cache
interface CachedTerm {
  id: number;
  name: string;
  name_ja: string;
  synonyms: string[];
}

let termCache: CachedTerm[] = [];
let cacheLastUpdated = 0;
const CACHE_TTL_MS = 60_000; // 60 seconds

async function getTermCache(): Promise<CachedTerm[]> {
  const now = Date.now();
  if (now - cacheLastUpdated > CACHE_TTL_MS || termCache.length === 0) {
    const result = await query<CachedTerm>(
      'SELECT id, name, name_ja, synonyms FROM terms',
    );
    termCache = result.rows;
    cacheLastUpdated = now;
  }
  return termCache;
}

function escapeRegex(str: string): string {
  return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function findPositions(text: string, pattern: string): { start: number; end: number }[] {
  if (!pattern || pattern.trim().length === 0) return [];

  const escaped = escapeRegex(pattern);
  // Word boundary for ASCII terms, looser matching for CJK
  const hasCJK = /[\u3000-\u9FFF\uF900-\uFAFF]/.test(pattern);
  const regexStr = hasCJK ? escaped : `\\b${escaped}\\b`;

  let regex: RegExp;
  try {
    regex = new RegExp(regexStr, 'gi');
  } catch {
    return [];
  }

  const positions: { start: number; end: number }[] = [];
  let match: RegExpExecArray | null;
  while ((match = regex.exec(text)) !== null) {
    positions.push({ start: match.index, end: match.index + match[0].length });
  }

  return positions;
}

contextRoutes.post('/', async (c) => {
  let body: unknown;
  try {
    body = await c.req.json();
  } catch {
    return c.json({ error: 'Invalid JSON body' }, 400);
  }

  let truncated = false;
  let rawText = (body as any)?.text;

  if (typeof rawText !== 'string' || rawText.trim().length === 0) {
    return c.json({ error: 'Text is required' }, 400);
  }

  if (rawText.length > MAX_TEXT_LENGTH) {
    rawText = rawText.slice(0, MAX_TEXT_LENGTH);
    truncated = true;
  }

  const parsed = contextBodySchema.safeParse({ text: rawText });
  if (!parsed.success) {
    return c.json({ error: parsed.error.issues[0].message }, 400);
  }

  const { text } = parsed.data;
  const terms = await getTermCache();

  const matches: {
    termId: number;
    name: string;
    name_ja: string;
    positions: { start: number; end: number }[];
  }[] = [];

  for (const term of terms) {
    const allPositions: { start: number; end: number }[] = [];

    // Check name
    allPositions.push(...findPositions(text, term.name));

    // Check name_ja
    if (term.name_ja) {
      allPositions.push(...findPositions(text, term.name_ja));
    }

    // Check synonyms
    if (term.synonyms) {
      for (const syn of term.synonyms) {
        allPositions.push(...findPositions(text, syn));
      }
    }

    if (allPositions.length > 0) {
      // Deduplicate positions by start index
      const unique = allPositions
        .sort((a, b) => a.start - b.start)
        .filter(
          (pos, i, arr) => i === 0 || pos.start !== arr[i - 1].start,
        );

      matches.push({
        termId: term.id,
        name: term.name,
        name_ja: term.name_ja,
        positions: unique,
      });
    }
  }

  return c.json({ matches, truncated });
});
