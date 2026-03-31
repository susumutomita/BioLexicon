import { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { searchTerms, Term } from '../api/terms';

interface SearchBarProps {
  onSearch: (query: string, lang: string) => void;
  loading?: boolean;
}

export function SearchBar({ onSearch, loading }: SearchBarProps) {
  const [query, setQuery] = useState('');
  const [lang, setLang] = useState<'en' | 'ja'>('en');
  const [suggestions, setSuggestions] = useState<Term[]>([]);
  const [showDropdown, setShowDropdown] = useState(false);
  const [activeIndex, setActiveIndex] = useState(-1);
  const debounceRef = useRef<ReturnType<typeof setTimeout>>();
  const wrapperRef = useRef<HTMLDivElement>(null);
  const navigate = useNavigate();

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    if (query.trim().length === 0) {
      setSuggestions([]);
      setShowDropdown(false);
      return;
    }
    debounceRef.current = setTimeout(async () => {
      try {
        const terms = await searchTerms(query.trim(), lang);
        setSuggestions(terms.slice(0, 8));
        setShowDropdown(terms.length > 0);
        setActiveIndex(-1);
        onSearch(query.trim(), lang);
      } catch {
        setSuggestions([]);
      }
    }, 150);
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current); };
  }, [query, lang]);

  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (wrapperRef.current && !wrapperRef.current.contains(e.target as Node)) {
        setShowDropdown(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (!showDropdown || suggestions.length === 0) return;
    if (e.key === 'ArrowDown') {
      e.preventDefault();
      setActiveIndex((i) => (i < suggestions.length - 1 ? i + 1 : 0));
    } else if (e.key === 'ArrowUp') {
      e.preventDefault();
      setActiveIndex((i) => (i > 0 ? i - 1 : suggestions.length - 1));
    } else if (e.key === 'Enter' && activeIndex >= 0) {
      e.preventDefault();
      navigate(`/terms/${suggestions[activeIndex].id}`);
      setShowDropdown(false);
    } else if (e.key === 'Escape') {
      setShowDropdown(false);
    }
  };

  return (
    <div ref={wrapperRef} style={{ position: 'relative', display: 'flex', gap: 8, marginBottom: 16 }}>
      <div style={{ flex: 1, position: 'relative' }}>
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onFocus={() => { if (suggestions.length > 0) setShowDropdown(true); }}
          onKeyDown={handleKeyDown}
          placeholder={lang === 'en' ? 'Search biology terms...' : '生物学用語を検索...'}
          style={{ width: '100%', padding: '8px 12px', fontSize: 16, border: '1px solid #ccc', borderRadius: 4, boxSizing: 'border-box' }}
        />
        {showDropdown && suggestions.length > 0 && (
          <div style={{
            position: 'absolute', top: '100%', left: 0, right: 0, zIndex: 10,
            background: '#fff', border: '1px solid #ddd', borderTop: 'none',
            borderRadius: '0 0 4px 4px', boxShadow: '0 4px 12px rgba(0,0,0,0.1)',
            maxHeight: 360, overflowY: 'auto',
          }}>
            {suggestions.map((t, i) => (
              <div
                key={t.id}
                onMouseDown={() => { navigate(`/terms/${t.id}`); setShowDropdown(false); }}
                onMouseEnter={() => setActiveIndex(i)}
                style={{
                  padding: '10px 12px', cursor: 'pointer',
                  background: i === activeIndex ? '#f0f7ff' : '#fff',
                  borderBottom: i < suggestions.length - 1 ? '1px solid #f0f0f0' : 'none',
                }}
              >
                <strong style={{ fontSize: 14 }}>{t.name}</strong>
                <span style={{ color: '#888', marginLeft: 8, fontSize: 13 }}>{t.name_ja}</span>
                <p style={{ margin: '2px 0 0', color: '#777', fontSize: 12, lineHeight: 1.3 }}>
                  {t.engineer_analogy.slice(0, 100)}...
                </p>
              </div>
            ))}
          </div>
        )}
      </div>
      <select value={lang} onChange={(e) => setLang(e.target.value as 'en' | 'ja')} style={{ padding: '8px 12px', borderRadius: 4 }}>
        <option value="en">EN</option>
        <option value="ja">JA</option>
      </select>
      {loading && <span style={{ alignSelf: 'center', fontSize: 13, color: '#888' }}>...</span>}
    </div>
  );
}
