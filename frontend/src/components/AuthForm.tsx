import { useState } from 'react';
import { useAuth } from '../context/AuthContext';
import * as authApi from '../api/auth';

export function AuthForm() {
  const { login } = useAuth();
  const [mode, setMode] = useState<'login' | 'register'>('login');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      if (mode === 'register') {
        const user = await authApi.register(email, password);
        // Auto-login after register
        const data = await authApi.login(email, password);
        login(data.token, data.user);
      } else {
        const data = await authApi.login(email, password);
        login(data.token, data.user);
      }
    } catch (e: any) {
      setError(e.response?.data?.error || 'Authentication failed');
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} style={{ maxWidth: 400, margin: '0 auto', padding: 24, border: '1px solid #ddd', borderRadius: 8 }}>
      <h2>{mode === 'login' ? 'Login' : 'Register'}</h2>
      <div style={{ marginBottom: 12 }}>
        <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Email" required
          style={{ width: '100%', padding: 8, fontSize: 14, borderRadius: 4, border: '1px solid #ccc' }} />
      </div>
      <div style={{ marginBottom: 12 }}>
        <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Password (min 8 chars)" required minLength={8}
          style={{ width: '100%', padding: 8, fontSize: 14, borderRadius: 4, border: '1px solid #ccc' }} />
      </div>
      {error && <div style={{ color: 'red', marginBottom: 12 }}>{error}</div>}
      <button type="submit" disabled={loading} style={{ width: '100%', padding: 10, cursor: 'pointer', fontSize: 16 }}>
        {loading ? '...' : mode === 'login' ? 'Login' : 'Register'}
      </button>
      <p style={{ textAlign: 'center', marginTop: 12 }}>
        <button type="button" onClick={() => setMode(mode === 'login' ? 'register' : 'login')}
          style={{ background: 'none', border: 'none', color: '#4a90d9', cursor: 'pointer' }}>
          {mode === 'login' ? 'Need an account? Register' : 'Have an account? Login'}
        </button>
      </p>
    </form>
  );
}
