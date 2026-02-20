import { useState, useEffect, useRef } from 'react';

interface SearchBarProps {
  onSearch: (query: string, lang: string) => void;
  loading?: boolean;
}

export function SearchBar({ onSearch, loading }: SearchBarProps) {
  const [query, setQuery] = useState('');
  const [lang, setLang] = useState<'en' | 'ja'>('en');
  const debounceRef = useRef<ReturnType<typeof setTimeout>>();

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    if (query.trim().length === 0) return;
    debounceRef.current = setTimeout(() => {
      onSearch(query.trim(), lang);
    }, 300);
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current); };
  }, [query, lang]);

  return (
    <div style={{ display: 'flex', gap: 8, marginBottom: 16 }}>
      <input
        type="text"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        placeholder={lang === 'en' ? 'Search biology terms...' : '生物学用語を検索...'}
        style={{ flex: 1, padding: '8px 12px', fontSize: 16, border: '1px solid #ccc', borderRadius: 4 }}
      />
      <select value={lang} onChange={(e) => setLang(e.target.value as 'en' | 'ja')} style={{ padding: '8px 12px', borderRadius: 4 }}>
        <option value="en">EN</option>
        <option value="ja">JA</option>
      </select>
      {loading && <span style={{ alignSelf: 'center' }}>Loading...</span>}
    </div>
  );
}
