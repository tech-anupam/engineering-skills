---
name: backend-and-infra
description: Backend platform, authentication, deployment, domain, and analytics preferences. Activate when choosing a backend service, setting up auth, selecting a deployment platform, configuring domains, or adding analytics. Covers Supabase, Firebase, Clerk, Vercel, Netlify, Google Analytics, and domain registrar selection.
---

## When to Activate
- Choosing a backend service (DB, real-time, storage)
- Setting up user authentication and authorization
- Selecting a deployment platform for frontend or full-stack apps
- Configuring domain names and DNS
- Adding product analytics or web tracking

## Preferences

### Backend Platforms
- **Supabase** (Preferred)
  - Core features: PostgreSQL, Auth, Realtime, Storage, Edge Functions, Row-Level Security (RLS).
  - **Use when**: Building full-stack apps with complex relational data, or when needing Auth, DB, and Storage tightly integrated.
- **Firebase**
  - Core features: Firestore, Auth, Hosting, Cloud Functions, real-time sync.
  - **Use when**: Building mobile-first apps, working deep within the Google ecosystem, or when real-time NoSQL data sync is the primary requirement.

### Authentication
- **Clerk** (Default for all web projects)
  - Utilize pre-built components heavily: `<SignIn />`, `<SignUp />`, `<UserButton />`, `<UserProfile />`.
  - Use Clerk Middleware for robust route protection in Next.js.
  - Implement webhook syncs with the primary database to keep user data mirrored.
  - Leverage Clerk Organizations for multi-tenant SaaS architecture.
  - **When NOT to use Clerk**:
    - Firebase-only projects (use native Firebase Auth).
    - Deep Supabase Row-Level Security integration (use native Supabase Auth to leverage RLS naturally).

### Deployment
- **Vercel**
  - Preferred for Next.js applications.
  - Benefits: Native framework support, edge functions, zero-config preview deployments, built-in analytics.
- **Netlify**
  - Good alternative for static sites, simpler form handling, and split testing.
- **Decision Matrix**:
  - Next.js → Vercel.
  - Static Site (HTML/Vite) → Vercel or Netlify.
  - Firebase heavy project → Firebase Hosting.

### Domain Registrars
- **Hostinger**: Primary choice for cost-effective domains.
- **GoDaddy**: Use for specific TLD availability.
- **BigRock**: Primary choice for India-specific domains (`.in`, `.co.in`).
- **Bluehost**: Use when bundled hosting makes financial sense.

### Analytics
- **Google Analytics (GA4)**: Default for comprehensive marketing and traffic analytics.
- **Vercel Analytics**: Default for simple, built-in core web vitals and basic traffic tracking.
- **PostHog**: Go-to alternative for deep product analytics, event tracking, and feature flags.

## Anti-Patterns
- Rolling your own custom authentication when Clerk or Supabase Auth handles it securely out-of-the-box.
- Deploying Next.js to legacy platforms that don't support SSR or App Router features well.
- Forcing Firebase into complex, heavily relational data models.
- Mixing multiple auth providers in a single project (e.g., using Clerk and Firebase Auth simultaneously).
- Failing to properly segregate environment variables across dev, preview, and production environments.

## Lessons Learned
- TODO: Add personal context around Clerk vs Supabase auth migration issues.
- TODO: Add personal context around Vercel billing spikes or Firebase NoSQL scaling traps.

## Exceptions
- Highly specialized enterprise apps requiring on-premise deployments or custom identity providers (SAML/SSO via Okta).
- Bare-metal deployments for applications with extreme, sustained compute requirements where serverless is cost-prohibitive.

## Validation
- Authentication flow works end-to-end (Sign up → Sign in → Protected route access → Sign out).
- CI/CD deployment pipeline builds and deploys to production without build errors.
- Custom domain DNS resolves correctly with valid SSL/HTTPS.
- Analytics events (page views, custom conversions) successfully fire and register in production.
