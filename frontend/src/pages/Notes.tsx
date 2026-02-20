import { useState, useEffect } from 'react';
import { Link, Navigate } from 'react-router-dom';
import { Layout } from '../components/Layout';
import { useAuth } from '../context/AuthContext';
import { getNotes, UserNote } from '../api/notes';
import { contextLookup, ContextMatch } from '../api/context';

export function Notes() {
  const { user, isAuthenticated } = useAuth();
  const [notes, setNotes] = useState<UserNote[]>([]);
  const [search, setSearch] = useState('');
  const [tagFilter, setTagFilter] = useState('');
  const [loading, setLoading] = useState(false);
  const [importText, setImportText] = useState('');
  const [importMatches, setImportMatches] = useState<ContextMatch[]>([]);
  const [importing, setImporting] = useState(false);

  if (!isAuthenticated) return <Navigate to="/" />;

  const fetchNotes = async () => {
    if (!user) return;
    setLoading(true);
    try {
      const data = await getNotes(user.id, search || undefined, tagFilter || undefined);
      setNotes(data);
    } catch {
      setNotes([]);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => { fetchNotes(); }, [search, tagFilter]);

  const handleImport = async () => {
    if (!importText.trim()) return;
    setImporting(true);
    try {
      const data = await contextLookup(importText);
      setImportMatches(data.matches);
    } catch {
      setImportMatches([]);
    } finally {
      setImporting(false);
    }
  };

  const allTags = [...new Set(notes.flatMap((n) => n.tags))];

  return (
    <Layout>
      <h1>My Notes</h1>

      <div style={{ display: 'flex', gap: 12, marginBottom: 24 }}>
        <input
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search notes..."
          style={{ flex: 1, padding: 8, borderRadius: 4, border: '1px solid #ccc' }}
        />
        <select value={tagFilter} onChange={(e) => setTagFilter(e.target.value)} style={{ padding: 8, borderRadius: 4 }}>
          <option value="">All tags</option>
          {allTags.map((t) => <option key={t} value={t}>{t}</option>)}
        </select>
      </div>

      {loading ? <p>Loading...</p> : notes.length === 0 ? (
        <p style={{ color: '#888' }}>No notes yet. Visit term pages to add notes.</p>
      ) : (
        <div>
          {notes.map((n) => (
            <div key={n.id} style={{ padding: 16, borderBottom: '1px solid #eee' }}>
              <Link to={`/terms/${n.term_id}`} style={{ fontWeight: 'bold', color: '#2c3e50' }}>
                {n.term_name || `Term #${n.term_id}`}
              </Link>
              {n.term_name_ja && <span style={{ color: '#888', marginLeft: 8 }}>({n.term_name_ja})</span>}
              <p style={{ margin: '8px 0', color: '#555', fontSize: 14 }}>{n.memo?.slice(0, 200)}{(n.memo?.length || 0) > 200 ? '...' : ''}</p>
              <div style={{ display: 'flex', gap: 4, flexWrap: 'wrap' }}>
                {n.tags.map((t, i) => (
                  <span key={i} style={{ background: '#e8f4fd', padding: '2px 8px', borderRadius: 12, fontSize: 12 }}>{t}</span>
                ))}
              </div>
              <span style={{ fontSize: 11, color: '#aaa' }}>Updated: {new Date(n.updated_at).toLocaleDateString()}</span>
            </div>
          ))}
        </div>
      )}

      <section style={{ marginTop: 40 }}>
        <h2>Markdown Import</h2>
        <p style={{ color: '#666', fontSize: 14 }}>Paste Markdown content to detect and match biology terms.</p>
        <textarea
          value={importText}
          onChange={(e) => setImportText(e.target.value)}
          rows={8}
          style={{ width: '100%', padding: 8, border: '1px solid #ccc', borderRadius: 4, fontFamily: 'monospace', resize: 'vertical' }}
          placeholder="Paste markdown notes here..."
        />
        <button onClick={handleImport} disabled={importing || !importText.trim()} style={{ marginTop: 8, padding: '8px 24px', cursor: 'pointer' }}>
          {importing ? 'Analyzing...' : 'Detect Terms'}
        </button>
        {importMatches.length > 0 && (
          <div style={{ marginTop: 16 }}>
            <h3>Matched Terms ({importMatches.length})</h3>
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
              {importMatches.map((m) => (
                <Link key={m.termId} to={`/terms/${m.termId}`}
                  style={{ padding: '4px 12px', background: '#e8f4fd', borderRadius: 16, textDecoration: 'none', color: '#2c3e50', fontSize: 14 }}>
                  {m.name} ({m.name_ja})
                </Link>
              ))}
            </div>
          </div>
        )}
      </section>
    </Layout>
  );
}
