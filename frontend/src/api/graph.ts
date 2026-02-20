import { api } from './client';

export interface GraphElements {
  nodes: { data: { id: string; label: string; label_ja: string } }[];
  edges: { data: { id: string; source: string; target: string; label: string; relation_type: string } }[];
}

export async function getGraph(rootTermId: number, depth: number = 2) {
  const res = await api.get<{ elements: GraphElements }>('/graph', {
    params: { rootTermId, depth },
  });
  return res.data.elements;
}
