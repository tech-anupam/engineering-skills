# Deployment Matrix

## Deployment decision matrix
| Project Type | Platform | Why |
|---|---|---|
| Next.js app | Vercel | Native Next.js support, edge functions, preview deployments |
| Static site | Netlify or Vercel | Both work well, Netlify has simpler forms |
| Full-stack with Supabase | Vercel + Supabase | Supabase handles backend, Vercel handles frontend |
| Firebase project | Firebase Hosting | Keep ecosystem unified |
| Cloudflare Workers project | Cloudflare Pages | Native workers integration |

## Domain registrar usage
- Hostinger: Primary for cost-effective domains
- GoDaddy: When specific TLDs are only available there
- BigRock: India-specific domains
- Bluehost: When bundled hosting is needed
