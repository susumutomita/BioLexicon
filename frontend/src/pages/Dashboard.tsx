import { useState, useEffect } from 'react';
import { Link, Navigate } from 'react-router-dom';
import { Layout } from '../components/Layout';
import { AuthForm } from '../components/AuthForm';
import { useAuth } from '../context/AuthContext';
import { getHistory, getRecommendations, HistoryEntry, Recommendation } from '../api/notes';

export function Dashboard() {
  const { user, isAuthenticated } = useAuth();
  const [history, setHistory] = useState<HistoryEntry[]>([]);
  const [recommendations, setRecommendations] = useState<Recommendation[]>([]);
  const [recMessage, setRecMessage] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (!isAuthenticated || !user) return;
    setLoading(true);
    Promise.all([
      getHistory(user.id).catch(() => []),
      getRecommendations(user.id).catch(() => ({ recommendations: [], message: '' })),
    ]).then(([hist, recs]) => {
      setHistory(hist as HistoryEntry[]);
      const recData = recs as { recommendations: Recommendation[]; message?: string };
      setRecommendations(recData.recommendations);
      setRecMessage(recData.message || '');
    }).finally(() => setLoading(false));
  }, [isAuthenticated, user]);

  if (!isAuthenticated) {
    return (
      <Layout>
        <h1>Dashboard</h1>
        <p style={{ color: '#888', marginBottom: 24 }}>Please login to view your dashboard.</p>
        <AuthForm />
      </Layout>
    );
  }

  return (
    <Layout>
      <h1>Dashboard</h1>

      {loading ? <p>Loading...</p> : (
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 32 }}>
          <section>
            <h2>View History</h2>
            {history.length === 0 ? (
              <p style={{ color: '#888' }}>No history yet. Start exploring terms!</p>
            ) : (
              <div>
                {history.map((h, i) => (
                  <div key={i} style={{ padding: 8, borderBottom: '1px solid #f0f0f0' }}>
                    <Link to={`/terms/${h.termId}`} style={{ color: '#2c3e50', fontWeight: 500 }}>
                      {h.name}
                    </Link>
                    <span style={{ color: '#888', marginLeft: 8 }}>({h.name_ja})</span>
                    <span style={{ color: '#aaa', fontSize: 12, marginLeft: 12 }}>{new Date(h.viewedAt).toLocaleDateString()}</span>
                  </div>
                ))}
              </div>
            )}
            <div style={{ marginTop: 16, padding: 12, background: '#f9f9f9', borderRadius: 8 }}>
              <strong>Progress</strong>: {history.length} terms viewed
            </div>
          </section>

          <section>
            <h2>Recommended Next</h2>
            {recMessage && <p style={{ color: '#888' }}>{recMessage}</p>}
            {recommendations.length > 0 && (
              <div>
                {recommendations.map((r, i) => (
                  <div key={i} style={{ padding: 12, borderBottom: '1px solid #f0f0f0' }}>
                    <Link to={`/terms/${r.term.id}`} style={{ color: '#2c3e50', fontWeight: 600 }}>
                      {r.term.name}
                    </Link>
                    <span style={{ color: '#888', marginLeft: 8 }}>({r.term.name_ja})</span>
                    <p style={{ margin: '4px 0 0', color: '#666', fontSize: 13 }}>{r.reason}</p>
                  </div>
                ))}
              </div>
            )}
          </section>
        </div>
      )}
    </Layout>
  );
}
