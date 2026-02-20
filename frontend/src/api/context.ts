import { api } from './client';

export interface ContextMatch {
  termId: number;
  name: string;
  name_ja: string;
  positions: { start: number; end: number }[];
}

export async function contextLookup(text: string) {
  const res = await api.post<{ matches: ContextMatch[]; truncated: boolean }>('/context-lookup', { text });
  return res.data;
}
