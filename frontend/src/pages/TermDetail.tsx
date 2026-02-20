import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Layout } from '../components/Layout';
import { ConceptGraph } from '../components/ConceptGraph';
import { NoteEditor } from '../components/NoteEditor';
import { getTermById, Term, RelatedTerm } from '../api/terms';
import { saveNote, getNotes, recordView, UserNote } from '../api/notes';
import { useAuth } from '../context/AuthContext';

export function TermDetail() {
  const { id } = useParams<{ id: string }>();
  const termId = Number(id);
  const { user, isAuthenticated } = useAuth();
  const [term, setTerm] = useState<Term | null>(null);
  const [related, setRelated] = useState<RelatedTerm[]>([]);
  const [note, setNote] = useState<UserNote | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    setLoading(true);
    getTermById(termId)
      .then((data) => {
        setTerm(data.term);
        setRelated(data.relatedTerms);
      })
      .catch(() => setError('Term not found'))
      .finally(() => setLoading(false));

    // Record view
    if (isAuthenticated && user) {
      recordView(user.id, termId).catch(() => {});
    }
  }, [termId]);

  useEffect(() => {
    if (isAuthenticated && user) {
      getNotes(user.id).then((notes) => {
        const existing = notes.find((n) => n.term_id === termId);
        if (existing) setNote(existing);
      }).catch(() => {});
    }
  }, [termId, isAuthenticated]);

  if (loading) return <Layout><p>Loading...</p></Layout>;
  if (error || !term) return <Layout><p style={{ color: 'red' }}>{error || 'Term not found'}</p></Layout>;

  const handleSaveNote = async (memo: string, tags: string[]) => {
    if (!user) return;
    const saved = await saveNote(user.id, termId, memo, tags);
    setNote(saved);
  };

  return (
    <Layout>
      <div style={{ marginBottom: 16 }}>
        <Link to="/" style={{ color: '#4a90d9' }}>← Back to Search</Link>
      </div>

      <h1>{term.name} <span style={{ color: '#888', fontSize: 20 }}>({term.name_ja})</span></h1>

      {term.synonyms.length > 0 && (
        <p style={{ color: '#888', fontSize: 14 }}>Synonyms: {term.synonyms.join(', ')}</p>
      )}

      <section style={{ marginTop: 24 }}>
        <h2>Engineer Analogy</h2>
        <div style={{ background: '#f0f7ff', padding: 16, borderRadius: 8, borderLeft: '4px solid #4a90d9' }}>
          {term.engineer_analogy}
        </div>
      </section>

      <section style={{ marginTop: 24 }}>
        <h2>Formal Definition</h2>
        <p>{term.formal_definition}</p>
      </section>

      {term.context && (
        <section style={{ marginTop: 24 }}>
          <h2>Context</h2>
          <p style={{ color: '#555' }}>{term.context}</p>
        </section>
      )}

      {related.length > 0 && (
        <section style={{ marginTop: 24 }}>
          <h2>Related Terms</h2>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
            {related.map((r, i) => (
              <Link key={i} to={`/terms/${r.term.id}`}
                style={{ padding: '4px 12px', background: '#f5f5f5', borderRadius: 16, textDecoration: 'none', color: '#2c3e50', fontSize: 14 }}>
                {r.term.name} <span style={{ color: '#aaa', fontSize: 12 }}>({r.relation_type})</span>
              </Link>
            ))}
          </div>
        </section>
      )}

      <section style={{ marginTop: 32 }}>
        <h2>Concept Graph</h2>
        <ConceptGraph rootTermId={termId} />
      </section>

      <section style={{ marginTop: 32 }}>
        {isAuthenticated ? (
          <NoteEditor
            initialMemo={note?.memo || ''}
            initialTags={note?.tags || []}
            onSave={handleSaveNote}
          />
        ) : (
          <p style={{ color: '#888', fontStyle: 'italic' }}>Login to add personal notes for this term.</p>
        )}
      </section>
    </Layout>
  );
}
