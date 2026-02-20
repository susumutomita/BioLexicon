import { ReactNode } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

export function Layout({ children }: { children: ReactNode }) {
  const { user, logout, isAuthenticated } = useAuth();

  return (
    <div style={{ maxWidth: 1100, margin: '0 auto', padding: '0 20px' }}>
      <header style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '16px 0', borderBottom: '1px solid #eee' }}>
        <Link to="/" style={{ textDecoration: 'none', color: '#2c3e50', fontSize: 24, fontWeight: 'bold' }}>
          BioLexicon
        </Link>
        <nav style={{ display: 'flex', gap: 16, alignItems: 'center' }}>
          <Link to="/" style={{ textDecoration: 'none', color: '#555' }}>Search</Link>
          {isAuthenticated && (
            <>
              <Link to="/notes" style={{ textDecoration: 'none', color: '#555' }}>Notes</Link>
              <Link to="/dashboard" style={{ textDecoration: 'none', color: '#555' }}>Dashboard</Link>
              <span style={{ color: '#888', fontSize: 13 }}>{user?.email}</span>
              <button onClick={logout} style={{ padding: '4px 12px', cursor: 'pointer' }}>Logout</button>
            </>
          )}
        </nav>
      </header>
      <main style={{ padding: '24px 0' }}>
        {children}
      </main>
    </div>
  );
}
