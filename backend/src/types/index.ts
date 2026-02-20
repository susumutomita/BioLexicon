export interface Term {
  id: number;
  name: string;
  name_ja: string;
  engineer_analogy: string;
  formal_definition: string;
  context: string | null;
  synonyms: string[];
}

export interface TermRelation {
  id: number;
  source_term_id: number;
  target_term_id: number;
  relation_type: string;
  description: string | null;
}

export interface User {
  id: number;
  email: string;
  api_key: string;
  password_hash: string;
  failed_login_attempts: number;
  locked_until: Date | null;
  created_at: Date;
}

export interface UserNote {
  id: number;
  user_id: number;
  term_id: number;
  memo: string | null;
  tags: string[];
  created_at: Date;
  updated_at: Date;
}

export interface ViewHistory {
  id: number;
  user_id: number;
  term_id: number;
  viewed_at: Date;
}

export interface GraphNode {
  data: { id: string; label: string; label_ja: string };
}

export interface GraphEdge {
  data: { id: string; source: string; target: string; label: string; relation_type: string };
}

export interface GraphData {
  nodes: GraphNode[];
  edges: GraphEdge[];
}
