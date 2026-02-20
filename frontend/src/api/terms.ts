import { api } from './client';

export interface Term {
  id: number;
  name: string;
  name_ja: string;
  engineer_analogy: string;
  formal_definition: string;
  context: string | null;
  synonyms: string[];
}

export interface RelatedTerm {
  term: Term;
  relation_type: string;
  description: string;
}

export async function searchTerms(q: string, lang: string = 'en') {
  const res = await api.get<{ terms: Term[] }>('/terms', { params: { q, lang } });
  return res.data.terms;
}

export async function getTermById(id: number) {
  const res = await api.get<{ term: Term; relatedTerms: RelatedTerm[] }>(`/terms/${id}`);
  return res.data;
}
