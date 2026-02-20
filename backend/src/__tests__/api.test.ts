import { describe, it, expect, beforeAll } from 'vitest';

// Test against the actual running DB via DATABASE_URL
// Requires: DATABASE_URL=postgres://biolexicon:biolexicon@localhost:5434/biolexicon

const API_BASE = process.env.API_URL || 'http://localhost:3003';
const API_KEY = process.env.DEV_API_KEY || 'dev-api-key';

async function apiFetch(path: string, options: RequestInit = {}) {
  const headers: Record<string, string> = {
    'X-API-Key': API_KEY,
    'Content-Type': 'application/json',
    ...(options.headers as Record<string, string> || {}),
  };
  return fetch(`${API_BASE}${path}`, { ...options, headers });
}

describe('BioLexicon API Integration Tests', () => {
  // Test 1: Term partial match search
  describe('GET /api/v1/terms?q=cyc&lang=en', () => {
    it('should return cyclin-related terms within 1 second', async () => {
      const start = Date.now();
      const res = await apiFetch('/api/v1/terms?q=cyc&lang=en');
      const elapsed = Date.now() - start;

      expect(res.status).toBe(200);
      const data = await res.json() as any;
      expect(data.terms).toBeDefined();
      expect(data.terms.length).toBeGreaterThan(0);

      const names = data.terms.map((t: any) => t.name);
      expect(names.some((n: string) => n.includes('cycl'))).toBe(true);
      expect(elapsed).toBeLessThan(1000);
    });
  });

  // Test 2: Synonym search
  describe('GET /api/v1/terms?q=CDK', () => {
    it('should return cyclin-dependent kinase entry via synonym', async () => {
      const res = await apiFetch('/api/v1/terms?q=CDK&lang=en');
      expect(res.status).toBe(200);
      const data = await res.json() as any;
      expect(data.terms.length).toBeGreaterThan(0);

      const found = data.terms.some((t: any) =>
        t.name === 'cdk' || t.synonyms.some((s: string) => s.toLowerCase().includes('cdk')),
      );
      expect(found).toBe(true);
    });
  });

  // Test 3: Context lookup
  describe('POST /api/v1/context-lookup', () => {
    it('should detect biology terms in text within 5 seconds', async () => {
      const text = 'The cell cycle is regulated by cyclin-dependent kinases (CDKs) which phosphorylate target proteins. DNA replication occurs during S phase, followed by mitosis. The p53 tumor suppressor monitors DNA damage and can trigger apoptosis. Signal transduction pathways like MAPK cascade control cell growth and differentiation.';

      const start = Date.now();
      const res = await apiFetch('/api/v1/context-lookup', {
        method: 'POST',
        body: JSON.stringify({ text }),
      });
      const elapsed = Date.now() - start;

      expect(res.status).toBe(200);
      const data = await res.json() as any;
      expect(data.matches).toBeDefined();
      expect(data.matches.length).toBeGreaterThan(3);
      expect(data.truncated).toBe(false);
      expect(elapsed).toBeLessThan(5000);

      const matchNames = data.matches.map((m: any) => m.name);
      expect(matchNames).toContain('cell cycle');
      expect(matchNames).toContain('p53');
    });
  });

  // Test 4: Note save (requires auth)
  describe('Notes CRUD', () => {
    let token: string;

    beforeAll(async () => {
      // Register or login
      const regRes = await fetch(`${API_BASE}/api/v1/auth/register`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: `test-${Date.now()}@test.com`, password: 'testpass123' }),
      });
      const regData = await regRes.json() as any;

      const loginRes = await fetch(`${API_BASE}/api/v1/auth/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: regData.user.email, password: 'testpass123' }),
      });
      const loginData = await loginRes.json() as any;
      token = loginData.token;
    });

    it('should save and retrieve a note with 4000 chars and 3 tags', async () => {
      const memo = 'A'.repeat(4000);
      const tags = ['cell-biology', 'exam-prep', 'important'];

      // Get userId from token
      const payload = JSON.parse(Buffer.from(token.split('.')[1], 'base64').toString());

      const saveRes = await apiFetch(`/api/v1/users/${payload.userId}/notes`, {
        method: 'POST',
        headers: { Authorization: `Bearer ${token}` } as any,
        body: JSON.stringify({ termId: 26, memo, tags }),
      });

      expect(saveRes.status).toBe(201);
      const saveData = await saveRes.json() as any;
      expect(saveData.note).toBeDefined();
      expect(saveData.note.memo.length).toBe(4000);
      expect(saveData.note.tags).toEqual(tags);

      // Verify retrieval
      const getRes = await apiFetch(`/api/v1/users/${payload.userId}/notes`, {
        headers: { Authorization: `Bearer ${token}` } as any,
      });
      expect(getRes.status).toBe(200);
      const getData = await getRes.json() as any;
      expect(getData.notes.length).toBeGreaterThan(0);
    });
  });

  // Test 5: Recommendations
  describe('GET /api/v1/users/:userId/recommendations', () => {
    let token: string;
    let userId: number;

    beforeAll(async () => {
      const email = `rec-test-${Date.now()}@test.com`;
      await fetch(`${API_BASE}/api/v1/auth/register`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password: 'testpass123' }),
      });

      const loginRes = await fetch(`${API_BASE}/api/v1/auth/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password: 'testpass123' }),
      });
      const loginData = await loginRes.json() as any;
      token = loginData.token;
      userId = loginData.user.id;

      // Record 6 views
      for (const termId of [26, 38, 39, 40, 42, 31]) {
        await apiFetch(`/api/v1/users/${userId}/history`, {
          method: 'POST',
          headers: { Authorization: `Bearer ${token}` } as any,
          body: JSON.stringify({ termId }),
        });
      }
    });

    it('should return prerequisite-based recommendations with reasons', async () => {
      const res = await apiFetch(`/api/v1/users/${userId}/recommendations`, {
        headers: { Authorization: `Bearer ${token}` } as any,
      });

      expect(res.status).toBe(200);
      const data = await res.json() as any;
      expect(data.recommendations).toBeDefined();

      if (data.recommendations.length > 0) {
        expect(data.recommendations.length).toBeLessThanOrEqual(10);
        expect(data.recommendations[0].term).toBeDefined();
        expect(data.recommendations[0].reason).toBeDefined();
        expect(typeof data.recommendations[0].reason).toBe('string');
      }
    });
  });
});
