CREATE TABLE IF NOT EXISTS term_relations (
  id SERIAL PRIMARY KEY,
  source_term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  target_term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  relation_type TEXT NOT NULL,
  description TEXT
);

CREATE INDEX IF NOT EXISTS idx_term_relations_source ON term_relations(source_term_id);
CREATE INDEX IF NOT EXISTS idx_term_relations_target ON term_relations(target_term_id);
