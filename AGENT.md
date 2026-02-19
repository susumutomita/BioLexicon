# AGENT.md — 生物の基礎を学ぶ

> This file configures AI coding agents (Claude Code, Cursor, Copilot, etc.) for this project.
> Read this file first before making any changes.

## Project Overview

バイオインフォマティクス等の業務で生物学知識が必要なソフトウェアエンジニアが、論文・資料中の専門用語を理解できず毎日作業が中断する。単発のネット検索では概念間の依存関係（例: サイクリン→CDK→チェックポイント）が把握できず、芋づる式に調べ物が膨張し、1回の中断が長時間化する。自作ノートで対処を試みるもカバー範囲が限定的で、慢性的な非効率が解消されていない。

**Target User**: バイオインフォマティクス・創薬・ヘルステック等の領域で働くソフトウェアエンジニア（生物学の正規教育を受けていない）。業務で論文・技術資料を日常的に読む必要があり、生物学用語の構造的理解を短時間で獲得したい。週に確保できる学習時間は限られている（5〜10時間程度）。

## Core Features

- **エンジニア向け生物学用語辞典**: 生物学用語をエンジニアの思考モデル（オブジェクト指向、状態遷移、イベント駆動等）に翻訳した定義文・比喩付きで提供する検索可能な辞典。各用語にはコンテキスト（どの論文分野で頻出か）を付与。
- **概念ネットワークグラフ**: 用語間の依存関係・因果関係をインタラクティブなグラフ（ノード＝用語、エッジ＝関係種別）で可視化。細胞周期のような相互依存概念群を一画面で俯瞰できる。
- **個人ナレッジベース（マイノート）**: ユーザーが調べた用語を自動で履歴保存し、個人メモ・タグを付与してナレッジベースとして蓄積できる機能。既存のMarkdown/Notionノートからのインポートにも対応。
- **コンテキスト検索（論文用語ルックアップ）**: ユーザーが論文テキストの一部（最大2000文字）を貼り付けると、文中の生物学専門用語を自動検出し、辞典の該当エントリへのリンクを一括表示する。
- **学習パス推薦**: ユーザーの閲覧履歴と未理解用語の依存関係グラフから、次に学ぶべき前提用語・概念を優先順位付きで推薦するリスト。

## Non-Goals

- 生物学の網羅的な教科書・講義コンテンツの提供（あくまでリファレンス辞典＋ナレッジベース）
- エンジニア以外の一般学習者向けUI・コンテンツの用意
- 論文の全文翻訳機能
- モバイルネイティブアプリの開発（Webレスポンシブで対応）
- ユーザー間のSNS的なコミュニケーション機能

## Implementation Spec

# BioLexicon — Implementation Spec

## Tech Stack
- Frontend: React + TypeScript + Vite + Cytoscape.js (グラフ描画)
- Backend: Node.js + Hono + TypeScript
- Database: PostgreSQL
- Auth: JWT (簡易APIキー認証 + OAuth2風トークン認証)
- Infra: Docker Compose

## API Endpoints (top 5 only)
| Method | Path | Description |
|--------|------|-------------|
| GET | /api/v1/terms?q=&lang= | 用語検索（前方一致・部分一致・英日・同義語対応） |
| GET | /api/v1/graph?rootTermId=&depth= | 指定用語起点の概念ネットワークグラフデータ取得 |
| POST | /api/v1/context-lookup | テキスト貼付→生物学用語自動検出・辞典マッチング |
| POST | /api/v1/users/:userId/notes | マイノート作成・更新（メモ+タグ） |
| GET | /api/v1/users/:userId/recommendations | 閲覧履歴ベースの学習パス推薦取得 |

## Database Schema
sql
CREATE TABLE terms (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  name_ja TEXT NOT NULL,
  engineer_analogy TEXT NOT NULL,
  formal_definition TEXT NOT NULL,
  context TEXT,
  synonyms TEXT[]
);

CREATE TABLE term_relations (
  id SERIAL PRIMARY KEY,
  source_term_id INTEGER NOT NULL,
  target_term_id INTEGER NOT NULL,
  relation_type TEXT NOT NULL,
  description TEXT
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL,
  api_key TEXT NOT NULL,
  password_hash TEXT NOT NULL
);

CREATE TABLE user_notes (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  term_id INTEGER NOT NULL,
  memo TEXT,
  tags TEXT[],
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);


※ 閲覧履歴は `user_notes` とは別に `view_history` テーブルを追加（user_id, term_id, viewed_at の3列）。4テーブル制限のため本スキーマ外でマイグレーション時に作成。

## Screens (max 4)
| Screen | Path | Description |
|--------|------|-------------|
| 用語検索・ホーム | / | 検索バー + コンテキスト検索テキストエリア + 結果一覧 |
| 用語詳細 | /terms/:id | 比喩・定義・頻出コンテキスト・概念グラフ(Cytoscape)・メモ追加 |
| マイノート | /notes | 保存済みメモ一覧・全文検索・Markdownインポート |
| ダッシュボード | /dashboard | 閲覧履歴・学習パス推薦リスト・学習進捗 |

## Key Test Cases (max 5)
| Test | Given | When | Then |
|------|-------|------|------|
| 用語部分一致検索 | DBに"cyclin"登録済 | q="cyc"&lang=enで検索 | cyclinを含む結果が1秒以内に返る |
| 同義語検索 | CDK=cyclin-dependent kinase登録済 | q="CDK"で検索 | cyclin-dependent kinaseエントリがヒット |
| コンテキスト検索 | 細胞周期関連用語200件登録済 | 英語論文抜粋500文字をPOST | 文中の登録済み用語が検出されtermId付きで返る |
| マイノート保存 | 認証済みユーザー | term_id指定+メモ4000字+タグ3個でPOST | DBに永続化されGETで取得可能 |
| 学習推薦生成 | 閲覧履歴6件蓄積済 | recommendations GET | 未閲覧の前提用語が理由付きで最大10件返る |

## Implementation Constraints
- Real DB/API connections only. No mock data, no hardcoded arrays.
- Backend-first: implement API before UI.
- Show "Not implemented" for unfinished features.
- All API endpoints must be callable by external services (API-first design).
- 初期シードデータ: 細胞生物学用語200件+リレーション50件以上をSQLシードで投入。
- コンテキスト検索の用語検出はDB内用語リストとのサーバーサイド文字列マッチング（正規表現ベース）で実装。外部AI APIに依存しない。
- 概念グラフはCytoscape.jsで描画。WebGL非対応時はリスト表示にフォールバック。
- Docker Composeでapi・db・frontendの3サービスを起動可能にする。
- 全APIにX-API-Keyヘッダー認証を実装。ユーザー固有データAPIはJWT Bearer Token必須。

## Rules

### MUST (Required)

- **Backend-first**: Implement API endpoints before building UI
- **Real data only**: All data must come from real DB/API connections
- **API-first**: All endpoints must be callable by external services
- **Test coverage**: Write tests for all new code paths
- **Show "Not implemented"**: Display clearly for unfinished features

### NEVER (Prohibited)

- **NEVER use hardcoded/mock data** as a substitute for real DB or API calls
- **NEVER fabricate** sample data, metrics, or statistics — use only real values
- **NEVER silently skip errors** — always handle and surface them to the user
- **NEVER change the meaning** of domain-specific terms by paraphrasing them
- **NEVER commit secrets** (API keys, tokens, passwords) to the repository
- **NEVER implement UI before the backend** that supports it
- **NEVER mark a task as complete** if tests are failing or features are partial

## Workflow

1. Read `Plan.md` to understand current progress and next steps
2. Pick the next unchecked task from Plan.md
3. Implement with real data connections (no mocks)
4. Run tests and verify
5. Update Plan.md with progress

## File Structure

| File | Purpose |
|------|---------|
| `PRD.md` | Product requirements and acceptance criteria |
| `spec.json` | Structured implementation specification |
| `Plan.md` | Step-by-step execution plan with progress tracking |
| `AGENT.md` | This file — agent configuration and rules |
