# Authentication Patterns

## Clerk Integration Patterns
- Default auth provider for all web projects
- Use Clerk middleware for route protection in Next.js
- Use Clerk components (SignIn, SignUp, UserButton) instead of building custom auth UI
- Sync Clerk user data with your database via webhooks
- Use Clerk organizations for multi-tenant apps

## When NOT to use Clerk
- Firebase-only projects (use Firebase Auth)
- Supabase-native auth when deep Supabase RLS integration is needed
