import { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { getGraph, GraphElements } from '../api/graph';

interface ConceptGraphProps {
  rootTermId: number;
  initialDepth?: number;
}

export function ConceptGraph({ rootTermId, initialDepth = 2 }: ConceptGraphProps) {
  const containerRef = useRef<HTMLDivElement>(null);
  const cyRef = useRef<any>(null);
  const navigate = useNavigate();
  const [depth, setDepth] = useState(initialDepth);
  const [elements, setElements] = useState<GraphElements | null>(null);
  const [error, setError] = useState('');
  const [webglSupported, setWebglSupported] = useState(true);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    try {
      const canvas = document.createElement('canvas');
      const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
      if (!gl) setWebglSupported(false);
    } catch {
      setWebglSupported(false);
    }
  }, []);

  useEffect(() => {
    setLoading(true);
    getGraph(rootTermId, depth)
      .then(setElements)
      .catch(() => setError('Failed to load graph'))
      .finally(() => setLoading(false));
  }, [rootTermId, depth]);

  useEffect(() => {
    if (!elements || !containerRef.current || !webglSupported) return;

    let cy: any;
    import('cytoscape').then((cytoscapeModule) => {
      const cytoscape = cytoscapeModule.default;
      return import('cytoscape-dagre').then((dagreModule) => {
        cytoscape.use(dagreModule.default);
        return cytoscape;
      }).catch(() => cytoscape);
    }).then((cytoscape) => {
      if (cyRef.current) cyRef.current.destroy();
      cy = cytoscape({
        container: containerRef.current,
        elements: [...elements.nodes, ...elements.edges],
        style: [
          {
            selector: 'node',
            style: {
              'background-color': '#4a90d9',
              'label': 'data(label)',
              'color': '#333',
              'font-size': '12px',
              'text-valign': 'bottom',
              'text-margin-y': 5,
              'width': 30,
              'height': 30,
            },
          },
          {
            selector: `node[id = "${rootTermId}"]`,
            style: { 'background-color': '#e74c3c', 'width': 40, 'height': 40 },
          },
          {
            selector: 'edge',
            style: {
              'width': 2,
              'line-color': '#ccc',
              'target-arrow-color': '#ccc',
              'target-arrow-shape': 'triangle',
              'curve-style': 'bezier',
              'label': 'data(label)',
              'font-size': '10px',
              'text-rotation': 'autorotate',
              'color': '#666',
            },
          },
          {
            selector: '.highlighted',
            style: { 'background-color': '#f39c12', 'line-color': '#f39c12', 'target-arrow-color': '#f39c12' },
          },
        ],
        layout: { name: 'dagre', rankDir: 'TB', nodeSep: 50, rankSep: 80 } as any,
      });

      cy.on('tap', 'node', (evt: any) => {
        const nodeId = evt.target.id();
        // Highlight neighbors
        cy.elements().removeClass('highlighted');
        evt.target.neighborhood().addClass('highlighted');
        evt.target.addClass('highlighted');
        // Navigate on double-tap via timeout
        if (Number(nodeId) !== rootTermId) {
          navigate(`/terms/${nodeId}`);
        }
      });

      cyRef.current = cy;
    });

    return () => { if (cyRef.current) cyRef.current.destroy(); };
  }, [elements, webglSupported]);

  const handleReset = () => {
    if (cyRef.current) cyRef.current.fit();
  };

  if (loading) return <div>Loading graph...</div>;
  if (error) return <div style={{ color: 'red' }}>{error} <button onClick={() => setError('')}>Retry</button></div>;

  // Fallback: list view when WebGL not supported
  if (!webglSupported && elements) {
    return (
      <div>
        <p>Graph visualization not available (WebGL not supported). Showing list view:</p>
        <ul>
          {elements.nodes.map((n) => (
            <li key={n.data.id}>
              <a href={`/terms/${n.data.id}`}>{n.data.label}</a> ({n.data.label_ja})
            </li>
          ))}
        </ul>
      </div>
    );
  }

  return (
    <div>
      <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginBottom: 8 }}>
        <label>Depth: <input type="range" min={1} max={5} value={depth} onChange={(e) => setDepth(Number(e.target.value))} /> {depth}</label>
        <button onClick={handleReset}>Reset View</button>
      </div>
      <div ref={containerRef} style={{ width: '100%', height: 500, border: '1px solid #ddd', borderRadius: 8 }} />
    </div>
  );
}
