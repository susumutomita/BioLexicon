ALTER TABLE user_notes ADD COLUMN IF NOT EXISTS memo_tsv tsvector;

CREATE INDEX IF NOT EXISTS idx_user_notes_tsv ON user_notes USING gin(memo_tsv);

CREATE OR REPLACE FUNCTION update_notes_tsv() RETURNS trigger AS $$
BEGIN
  NEW.memo_tsv := to_tsvector('english', COALESCE(NEW.memo, ''));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_notes_tsv ON user_notes;
CREATE TRIGGER trg_notes_tsv
  BEFORE INSERT OR UPDATE ON user_notes
  FOR EACH ROW EXECUTE FUNCTION update_notes_tsv();
