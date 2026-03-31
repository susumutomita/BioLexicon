CREATE TABLE IF NOT EXISTS terms (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  name_ja TEXT NOT NULL,
  engineer_analogy TEXT NOT NULL,
  formal_definition TEXT NOT NULL,
  context TEXT,
  synonyms TEXT[] DEFAULT '{}'
);

CREATE INDEX IF NOT EXISTS idx_terms_name ON terms USING btree (name);
CREATE INDEX IF NOT EXISTS idx_terms_name_ja ON terms USING btree (name_ja);
CREATE INDEX IF NOT EXISTS idx_terms_synonyms ON terms USING gin (synonyms);
CREATE INDEX IF NOT EXISTS idx_terms_name_trgm ON terms USING btree (lower(name) text_pattern_ops);
