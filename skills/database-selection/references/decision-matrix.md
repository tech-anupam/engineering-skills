# Database Decision Matrix

| Database | Best For | Edge/Serverless | SQL/NoSQL | Notes |
|---|---|---|---|---|
| Turso | Edge-first apps, embedded SQLite, low-latency reads | Excellent | SQL (SQLite) | LibSQL fork, great for serverless |
| Neon | PostgreSQL projects needing serverless, branching | Good | SQL (Postgres) | Branching for dev/staging, scales to zero |
| MongoDB | Flexible schema, document-heavy, rapid prototyping | Moderate | NoSQL | Atlas for managed, good for unstructured data |
| Supabase | Full-stack with auth + realtime + storage + RLS | Good | SQL (Postgres) | Built-in auth, realtime subscriptions, row-level security |
| Firebase | Google ecosystem, real-time sync, mobile-first | Moderate | NoSQL (Firestore) | Good for mobile, real-time listeners, tight Google integration |

## When to pick what
- Need edge performance → Turso
- Need Postgres with branching → Neon
- Need flexible schema + fast iteration → MongoDB
- Need auth + db + storage in one → Supabase
- Need real-time mobile sync → Firebase
