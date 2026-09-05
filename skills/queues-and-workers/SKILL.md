---
name: queues-and-workers
description: Queue and background processing preferences using Hono and Cloudflare Workers. Activate when implementing background jobs, task queues, webhook handlers, scheduled tasks, cron jobs, or lightweight API endpoints that don't need a full server.
---

# Queues and Workers

## When to Activate
- Background job processing
- Webhook handlers (Stripe, Clerk, GitHub, etc.)
- Scheduled/cron tasks
- Lightweight API endpoints
- Edge compute requirements
- Email sending, notification dispatching
- Data pipeline processing

## Default Stack: Hono on Cloudflare Workers

**Why Hono:**
- Ultralight (14KB), fast, zero dependencies
- Runs on multiple runtimes: Cloudflare Workers, Deno, Bun, Node.js, Vercel Edge, Netlify Edge, AWS Lambda
- Express-like API but built for edge/serverless
- First-class TypeScript support
- Middleware ecosystem (CORS, auth, rate limiting, logging)
- If you outgrow Workers, same code runs on Node.js

**Why Cloudflare Workers:**
- Edge-first execution (runs close to users globally)
- Cold start under 5ms (vs 100-500ms for traditional serverless)
- Generous free tier (100K requests/day)
- Built-in KV, Durable Objects, Queues, R2 storage
- Cron triggers for scheduled tasks

## Use Cases and Patterns

### Webhook Handler
Receive webhooks from Stripe, Clerk, GitHub, etc. Validate signature, process event, return 200 fast.

### Scheduled/Cron Jobs
Cloudflare Workers support cron triggers natively. Use for: cleanup tasks, report generation, data sync, cache warming.

### Background Processing
For tasks that shouldn't block the user request:
1. Accept the request, return 202 immediately
2. Queue the work using Cloudflare Queues or Durable Objects
3. Process asynchronously

### Lightweight API
When you need a few endpoints but a full Express/Fastify server is overkill. Hono gives you routing, middleware, and validation without the weight.

## When NOT to Use This Stack

| Situation | Use instead |
|:----------|:------------|
| Complex job orchestration with retries, priorities, dead letter queues | BullMQ on Redis, or dedicated queue service |
| Long-running jobs (> 30 seconds) | Traditional server or serverless with extended timeout |
| Already have a Node.js/Express backend | Add routes to existing server |
| Need WebSocket connections | Durable Objects on CF, or dedicated WebSocket server |
| CPU-intensive processing | Dedicated server or cloud function with high memory |

## Anti-Patterns
- Spinning up a full Express server for a single webhook handler
- Using heavyweight queue systems (RabbitMQ, Kafka) for simple background tasks
- Not validating webhook signatures
- Blocking on long operations in a Worker (there's a CPU time limit)
- Fragmenting infrastructure by adding Cloudflare when the project already runs on a different edge platform

## Lessons Learned
- TODO: Add personal context about queue/worker decisions

## Validation
- Webhook handlers validate signatures and return 200/202 within time limits
- Cron jobs execute on schedule and log results
- Background tasks complete without blocking user-facing requests
- Error handling reports failures without silent drops
