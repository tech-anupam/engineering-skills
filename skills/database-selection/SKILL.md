---
name: database-selection
description: Database selection preferences and decision framework for different project types. Activate when choosing a database, setting up data storage, planning data architecture, or evaluating database options. Covers Turso, Neon, MongoDB, Supabase, and Firebase with selection criteria.
---

# Database Selection

## When to Activate
- Choosing a database for a new project
- Migrating between databases
- Evaluating whether the current database fits the use case
- Setting up data storage architecture

## Quick Decision Guide

Ask these questions to narrow down:

1. **Is it a full-stack app that needs auth + db + storage together?** -> Supabase
2. **Is it mobile-first with real-time sync?** -> Firebase
3. **Is it edge-deployed or serverless-first?** -> Turso
4. **Is it a Postgres project needing branching/preview envs?** -> Neon
5. **Is the schema flexible/changing rapidly?** -> MongoDB

## Database Profiles

### Turso
- **What:** LibSQL fork of SQLite, designed for edge
- **Best for:** Edge-first apps, embedded databases, read-heavy workloads, serverless functions
- **Strengths:** Blazing fast reads, replicates to edge locations, scales to zero, SQLite compatibility
- **Weaknesses:** Write throughput lower than dedicated Postgres, smaller ecosystem
- **Use when:** You need low-latency reads globally and your data model fits SQLite

### Neon
- **What:** Serverless Postgres with branching
- **Best for:** Postgres projects that need serverless scaling, preview/staging database branches
- **Strengths:** Full Postgres compatibility, database branching (like git for your DB), scales to zero, great free tier
- **Weaknesses:** Cold starts on scale-to-zero, not ideal for always-hot high-throughput
- **Use when:** You want real Postgres but don't want to manage infrastructure, or you need branch previews

### MongoDB
- **What:** Document database with flexible schema
- **Best for:** Rapid prototyping, unstructured/semi-structured data, content management, event logging
- **Strengths:** Schema flexibility, horizontal scaling, Atlas managed service, rich query language
- **Weaknesses:** No native joins (aggregation pipeline instead), consistency trade-offs, can get messy without discipline
- **Use when:** Your data model is document-shaped and you need fast iteration without migrations

### Supabase
- **What:** Open-source Firebase alternative built on Postgres
- **Best for:** Full-stack apps needing auth + database + storage + real-time in one platform
- **Strengths:** Built-in auth, row-level security, real-time subscriptions, storage, edge functions, Postgres underneath
- **Weaknesses:** Vendor coupling if you use all features, RLS can be complex to debug
- **Use when:** You want a single platform for auth + DB + storage and your data is relational

### Firebase
- **What:** Google's app platform with Firestore (NoSQL) and Realtime Database
- **Best for:** Mobile-first apps, real-time sync, Google ecosystem projects
- **Strengths:** Real-time listeners, offline support, tight Android/iOS SDKs, Google auth integration, generous free tier
- **Weaknesses:** NoSQL data modeling can get painful for relational data, vendor lock-in, pricing can spike unpredictably at scale
- **Use when:** You're building a mobile app that needs real-time sync and offline support

## Anti-Patterns
- Picking a database out of habit instead of matching project requirements
- Using a NoSQL database for heavily relational data
- Using a relational database when your schema changes every sprint
- Choosing Firebase for a project with complex relational queries
- Not considering the deployment model (edge vs server vs serverless)

## Lessons Learned
- TODO: Add personal context about database choices that worked/failed

## Exceptions
- When the project needs a database not in this list (PostgreSQL direct, Redis, DynamoDB, CockroachDB), explain why and use it
- Legacy projects with existing databases should not be migrated without clear justification

## Validation
- Selected database matches the data model (relational vs document)
- Selected database matches the deployment model (edge vs server vs serverless)
- Free tier or pricing fits the project budget
- Refer to [decision-matrix.md](./references/decision-matrix.md) for the comparison table
