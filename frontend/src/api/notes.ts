import { api } from './client';

export interface UserNote {
  id: number;
  user_id: number;
  term_id: number;
  memo: string | null;
  tags: string[];
  created_at: string;
  updated_at: string;
  term_name?: string;
  term_name_ja?: string;
}

export interface HistoryEntry {
  termId: number;
  name: string;
  name_ja: string;
  viewedAt: string;
}

export interface Recommendation {
  term: { id: number; name: string; name_ja: string; engineer_analogy: string; formal_definition: string };
  reason: string;
}

export async function saveNote(userId: number, termId: number, memo: string, tags: string[]) {
  const res = await api.post<{ note: UserNote }>(`/users/${userId}/notes`, { termId, memo, tags });
  return res.data.note;
}

export async function getNotes(userId: number, q?: string, tag?: string) {
  const params: Record<string, string> = {};
  if (q) params.q = q;
  if (tag) params.tag = tag;
  const res = await api.get<{ notes: UserNote[] }>(`/users/${userId}/notes`, { params });
  return res.data.notes;
}

export async function getHistory(userId: number) {
  const res = await api.get<{ history: HistoryEntry[] }>(`/users/${userId}/history`);
  return res.data.history;
}

export async function recordView(userId: number, termId: number) {
  await api.post(`/users/${userId}/history`, { termId });
}

export async function getRecommendations(userId: number) {
  const res = await api.get<{ recommendations: Recommendation[]; message?: string }>(`/users/${userId}/recommendations`);
  return res.data;
}
