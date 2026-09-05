Comprehensive database decision matrix:

### Feature Comparison
| Feature | Turso | Neon | MongoDB | Supabase | Firebase |
|---|---|---|---|---|---|
| Engine | LibSQL (SQLite fork) | PostgreSQL | MongoDB | PostgreSQL | Firestore/RTDB |
| Query language | SQL | SQL | MQL / Aggregation | SQL | SDK methods |
| Schema | Fixed (migrations) | Fixed (migrations) | Flexible (schemaless) | Fixed (migrations) | Flexible |
| Edge support | Excellent (replicas) | Good (serverless) | Moderate (Atlas) | Good (edge functions) | Moderate |
| Real-time | No | No | Change streams | Yes (subscriptions) | Yes (listeners) |
| Built-in auth | No | No | No | Yes | Yes |
| Built-in storage | No | No | GridFS | Yes | Yes |
| Row-level security | No | Manual | No | Yes (RLS) | Security rules |
| Branching | No | Yes (DB branches) | No | No | No |
| Scale to zero | Yes | Yes | No (Atlas always-on) | No (Postgres always-on) | Yes (pay per use) |
| Free tier | 9GB, 500 DBs | 500MB, branching | 512MB (Atlas) | 500MB, 50K MAU auth | Generous |
| Best ORM | Drizzle | Drizzle / Prisma | Mongoose / native | Drizzle / Prisma | SDK |

### Decision Flowchart
```
Need auth + db + storage together?
  Yes -> Supabase
  No ->
    Mobile-first with real-time sync?
      Yes -> Firebase
      No ->
        Edge-deployed / serverless-first?
          Yes -> Turso
          No ->
            Need Postgres with branching?
              Yes -> Neon
              No ->
                Schema changes frequently?
                  Yes -> MongoDB
                  No -> Neon or Supabase
```

### ORM Recommendations
| Database | Recommended ORM | Why |
|---|---|---|
| Turso | Drizzle ORM | First-class LibSQL support, type-safe, lightweight |
| Neon | Drizzle ORM or Prisma | Both work great with Postgres, Drizzle is lighter |
| MongoDB | Mongoose or native driver | Mongoose for schema validation, native for flexibility |
| Supabase | Drizzle ORM or Supabase client | Drizzle for type-safe SQL, Supabase client for real-time |
| Firebase | Firebase SDK | No ORM needed, SDK is the interface |

### Pricing Reality Check (as of 2024-2025)
| Database | Free Tier | First Paid Tier | Watch Out For |
|---|---|---|---|
| Turso | 9GB, 500 DBs, 1B row reads/mo | $29/mo (Scaler) | Row reads can add up fast |
| Neon | 500MB, 1 project | $19/mo (Launch) | Compute hours on free tier |
| MongoDB Atlas | 512MB (M0) | $57/mo (M10) | Jump from free to paid is steep |
| Supabase | 500MB DB, 1GB storage | $25/mo (Pro) | Egress and storage costs |
| Firebase | Generous (Spark plan) | Pay-as-you-go (Blaze) | Reads/writes can spike costs unpredictably |
