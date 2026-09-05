---
name: queues-and-workers
description: Queue and background processing preferences using Hono and Cloudflare Workers. Activate when implementing background jobs, task queues, webhook processing, scheduled tasks, or lightweight API endpoints.
---

# queues-and-workers

## When to Activate
- When implementing background jobs
- When setting up task queues
- When processing webhooks
- When creating scheduled/cron tasks
- When building lightweight API endpoints

## Preferences
- Preferred stack: Hono framework on Cloudflare Workers
- Hono is lightweight, fast, and runs on multiple runtimes (Cloudflare Workers, Deno, Bun, Node)
- Use Cloudflare Workers for edge-first, low-latency background processing

## Anti-Patterns
- Don't spin up a full Express/Fastify server for a simple webhook handler
- Don't use heavyweight queue systems (Bull, RabbitMQ) when the task is simple

## Lessons Learned
- TODO: Add personal context

## Exceptions
- When the project already uses a different runtime and adding Cloudflare would fragment the infra
- When complex job orchestration is needed (use dedicated queue services)

## Validation
- Verify simple background tasks use Hono/Cloudflare Workers over heavyweight alternatives
