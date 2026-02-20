import { useState } from 'react';

interface NoteEditorProps {
  initialMemo?: string;
  initialTags?: string[];
  onSave: (memo: string, tags: string[]) => Promise<void>;
}

export function NoteEditor({ initialMemo = '', initialTags = [], onSave }: NoteEditorProps) {
  const [memo, setMemo] = useState(initialMemo);
  const [tagInput, setTagInput] = useState('');
  const [tags, setTags] = useState<string[]>(initialTags);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');

  const addTag = () => {
    const tag = tagInput.trim();
    if (!tag || tags.length >= 10 || tags.includes(tag)) return;
    setTags([...tags, tag]);
    setTagInput('');
  };

  const removeTag = (idx: number) => setTags(tags.filter((_, i) => i !== idx));

  const handleSave = async () => {
    if (memo.length > 5000) {
      setError('Memo must be 5000 characters or less');
      return;
    }
    setError('');
    setSaving(true);
    try {
      await onSave(memo, tags);
    } catch (e: any) {
      setError(e.response?.data?.error || 'Failed to save');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div style={{ border: '1px solid #ddd', borderRadius: 8, padding: 16 }}>
      <h3 style={{ margin: '0 0 8px' }}>My Notes</h3>
      <textarea
        value={memo}
        onChange={(e) => setMemo(e.target.value)}
        rows={6}
        style={{ width: '100%', padding: 8, fontSize: 14, borderRadius: 4, border: '1px solid #ccc', resize: 'vertical' }}
        placeholder="Write your notes..."
      />
      <div style={{ fontSize: 12, color: memo.length > 5000 ? 'red' : '#888', textAlign: 'right' }}>
        {memo.length} / 5000
      </div>
      <div style={{ display: 'flex', gap: 8, marginTop: 8 }}>
        <input
          value={tagInput}
          onChange={(e) => setTagInput(e.target.value)}
          onKeyDown={(e) => e.key === 'Enter' && (e.preventDefault(), addTag())}
          placeholder="Add tag..."
          style={{ flex: 1, padding: '4px 8px', borderRadius: 4, border: '1px solid #ccc' }}
        />
        <button onClick={addTag} disabled={tags.length >= 10}>Add</button>
      </div>
      <div style={{ display: 'flex', gap: 4, flexWrap: 'wrap', marginTop: 8 }}>
        {tags.map((t, i) => (
          <span key={i} style={{ background: '#e8f4fd', padding: '2px 8px', borderRadius: 12, fontSize: 13 }}>
            {t} <button onClick={() => removeTag(i)} style={{ border: 'none', background: 'none', cursor: 'pointer', color: '#666' }}>x</button>
          </span>
        ))}
      </div>
      {error && <div style={{ color: 'red', marginTop: 8 }}>{error}</div>}
      <button onClick={handleSave} disabled={saving} style={{ marginTop: 12, padding: '8px 24px', cursor: 'pointer' }}>
        {saving ? 'Saving...' : 'Save Note'}
      </button>
    </div>
  );
}
