import { useState } from 'react';
import { Link } from 'react-router-dom';
import { Layout } from '../components/Layout';
import { SearchBar } from '../components/SearchBar';
import { searchTerms, Term } from '../api/terms';
import { contextLookup, ContextMatch } from '../api/context';

const EXAMPLE_TERMS = [
  { q: 'DNA', lang: 'en' },
  { q: 'cell membrane', lang: 'en' },
  { q: 'ribosome', lang: 'en' },
  { q: 'mitochondria', lang: 'en' },
  { q: 'apoptosis', lang: 'en' },
  { q: 'transcription', lang: 'en' },
  { q: 'enzyme', lang: 'en' },
  { q: 'genome', lang: 'en' },
  { q: '細胞', lang: 'ja' },
  { q: '遺伝子', lang: 'ja' },
  { q: '免疫', lang: 'ja' },
  { q: 'タンパク質', lang: 'ja' },
];

export function Home() {
  const [results, setResults] = useState<Term[]>([]);
  const [loading, setLoading] = useState(false);
  const [searched, setSearched] = useState(false);
  const [contextText, setContextText] = useState('');
  const [contextMatches, setContextMatches] = useState<ContextMatch[]>([]);
  const [contextLoading, setContextLoading] = useState(false);
  const [contextTruncated, setContextTruncated] = useState(false);

  const handleSearch = async (q: string, lang: string) => {
    setLoading(true);
    setSearched(true);
    try {
      const terms = await searchTerms(q, lang);
      setResults(terms);
    } catch {
      setResults([]);
    } finally {
      setLoading(false);
    }
  };

  const handleExampleClick = (q: string, lang: string) => {
    handleSearch(q, lang);
  };

  const handleContextLookup = async () => {
    if (!contextText.trim()) return;
    setContextLoading(true);
    try {
      const data = await contextLookup(contextText);
      setContextMatches(data.matches);
      setContextTruncated(data.truncated);
    } catch {
      setContextMatches([]);
    } finally {
      setContextLoading(false);
    }
  };

  return (
    <Layout>
      <h1 style={{ marginBottom: 8 }}>BioLexicon</h1>
      <p style={{ color: '#666', marginBottom: 24 }}>Biology term dictionary for software engineers</p>

      <SearchBar onSearch={handleSearch} loading={loading} />

      {!searched && (
        <div style={{ marginBottom: 32 }}>
          <p style={{ color: '#888', fontSize: 14, marginBottom: 12 }}>Try searching for:</p>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
            {EXAMPLE_TERMS.map((ex) => (
              <button
                key={ex.q}
                onClick={() => handleExampleClick(ex.q, ex.lang)}
                style={{
                  padding: '6px 14px', background: '#f5f5f5', border: '1px solid #e0e0e0',
                  borderRadius: 20, cursor: 'pointer', fontSize: 13, color: '#444',
                  transition: 'background 0.15s',
                }}
                onMouseEnter={(e) => { e.currentTarget.style.background = '#e8f4fd'; }}
                onMouseLeave={(e) => { e.currentTarget.style.background = '#f5f5f5'; }}
              >
                {ex.q}
              </button>
            ))}
          </div>
        </div>
      )}

      {searched && results.length === 0 && !loading && (
        <p style={{ color: '#888' }}>No terms found. Try a different search query.</p>
      )}

      {results.length > 0 && (
        <div style={{ marginBottom: 32 }}>
          {results.map((t) => (
            <Link key={t.id} to={`/terms/${t.id}`} style={{ textDecoration: 'none', color: 'inherit', display: 'block' }}>
              <div style={{ padding: 12, borderBottom: '1px solid #eee' }}>
                <strong>{t.name}</strong> <span style={{ color: '#888' }}>({t.name_ja})</span>
                <p style={{ margin: '4px 0 0', color: '#555', fontSize: 14 }}>{t.engineer_analogy.slice(0, 150)}...</p>
              </div>
            </Link>
          ))}
        </div>
      )}

      <h2 style={{ marginTop: 32 }}>Context Lookup</h2>
      <p style={{ color: '#666', fontSize: 14 }}>Paste text from a paper to detect biology terms (max 2000 chars)</p>
      <textarea
        value={contextText}
        onChange={(e) => setContextText(e.target.value)}
        rows={6}
        style={{ width: '100%', padding: 8, fontSize: 14, border: '1px solid #ccc', borderRadius: 4, resize: 'vertical', boxSizing: 'border-box' }}
        placeholder="Paste text from a biology paper..."
      />
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: 8 }}>
        <span style={{ fontSize: 12, color: contextText.length > 2000 ? 'red' : '#888' }}>{contextText.length} / 2000</span>
        <button onClick={handleContextLookup} disabled={contextLoading || !contextText.trim()} style={{ padding: '8px 24px', cursor: 'pointer' }}>
          {contextLoading ? 'Analyzing...' : 'Detect Terms'}
        </button>
      </div>
      {contextTruncated && <p style={{ color: 'orange', fontSize: 13 }}>Text was truncated to 2000 characters.</p>}
      {contextMatches.length > 0 && (
        <div style={{ marginTop: 16 }}>
          <h3>Detected Terms ({contextMatches.length})</h3>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
            {contextMatches.map((m) => (
              <Link key={m.termId} to={`/terms/${m.termId}`}
                style={{ padding: '4px 12px', background: '#e8f4fd', borderRadius: 16, textDecoration: 'none', color: '#2c3e50', fontSize: 14 }}>
                {m.name} <span style={{ color: '#888' }}>({m.name_ja})</span>
              </Link>
            ))}
          </div>
        </div>
      )}
    </Layout>
  );
}
