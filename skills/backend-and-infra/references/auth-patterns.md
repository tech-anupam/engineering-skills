Comprehensive Clerk auth patterns reference:

### Clerk with Next.js App Router
- Install: @clerk/nextjs
- Wrap app with ClerkProvider in layout.tsx
- Use middleware.ts for route protection (clerkMiddleware)
- Public routes vs protected routes configuration
- Use auth() in server components, useAuth() in client components
- Pre-built components: SignIn, SignUp, UserButton, UserProfile, OrganizationSwitcher

### Route Protection Patterns
- Public routes: landing page, marketing, docs, pricing
- Protected routes: dashboard, settings, API routes
- Role-based access: admin vs user vs viewer
- Organization-scoped access for multi-tenant apps

### Database Sync via Webhooks
- Clerk sends webhooks on user events (user.created, user.updated, user.deleted)
- Set up webhook endpoint in your API
- Verify webhook signature using svix
- Sync user data to your database (Supabase, Neon, etc.)
- Store Clerk user ID as foreign key in your user table

### When NOT to Use Clerk
- Firebase-only projects: use Firebase Auth (keeps ecosystem unified)
- Deep Supabase RLS: use Supabase Auth (RLS policies work natively with Supabase auth)
- Custom auth requirements: OAuth providers not supported by Clerk, custom SAML
- Budget-constrained: Clerk free tier has limits, Supabase Auth is free up to 50K MAU

### Clerk vs Alternatives
| Feature | Clerk | Supabase Auth | Firebase Auth | NextAuth/Auth.js |
|---|---|---|---|---|
| Pre-built UI | Yes (polished) | Basic | Basic | No |
| Organizations/Multi-tenant | Yes | No | No | No |
| Webhook user sync | Yes | N/A (built-in) | Limited | N/A |
| RLS integration | Manual | Native | N/A | Manual |
| Free tier limit | 10K MAU | 50K MAU | Unlimited (with limits) | Unlimited |
| Self-hostable | No | Yes | No | Yes |
