# OWASP Top 10 Detailed Checklist

## A01: Broken Access Control
Description: Failures where authenticated users can access unauthorized data or perform unauthorized actions. Attackers exploit these to view sensitive files, modify other users' data, or change access rights.
Real-world impact: A regular user accesses `/admin` or modifies a URL parameter to delete someone else's account.
Prevention checklist:
- [ ] Implement Row Level Security (RLS) policies in Supabase for all tables.
- [ ] Use Clerk middleware to protect private Next.js routes.
- [ ] Verify user identity on every API route using `auth()` from Clerk.
Code-level guidance:
Do not rely on UI hiding. Always enforce checks on the server.
```typescript
const { userId } = auth()
if (!userId) throw new Error("Unauthorized")
const { data, error } = await supabase.from('profiles').select('*').eq('user_id', userId)
```

## A02: Cryptographic Failures
Description: Failures in protecting sensitive data in transit or at rest. This often results from using weak algorithms or mismanaging keys.
Real-world impact: Attackers intercept unencrypted API traffic to steal session tokens or download cleartext credit card numbers.
Prevention checklist:
- [ ] Force HTTPS in production environments.
- [ ] Store API keys in Vercel environment variables, never in code.
- [ ] Let Clerk handle all password hashing and session cryptography.
Code-level guidance:
Use `.env.local` for local secrets and add `.env*` to `.gitignore`. Prefix public variables with `NEXT_PUBLIC_` only when the client absolutely needs them.

## A03: Injection
Description: Flaws where untrusted data is sent to an interpreter as part of a command or query. The interpreter executes unintended commands or accesses unauthorized data.
Real-world impact: An attacker inputs SQL commands into a search box, dumping the entire user database.
Prevention checklist:
- [ ] Rely on Supabase's PostgREST API which uses parameterized queries by default.
- [ ] Sanitize any user-generated HTML using DOMPurify before rendering.
- [ ] Avoid `dangerouslySetInnerHTML` in React components.
Code-level guidance:
When using Supabase client, chain filters rather than concatenating strings.
```typescript
const { data } = await supabase.from('users').select().eq('username', userInput)
```

## A04: Insecure Design
Description: Flaws stemming from missing or ineffective control design. It highlights the need for threat modeling and secure design principles.
Real-world impact: A password reset flow allows unlimited guesses, enabling account takeover via brute force.
Prevention checklist:
- [ ] Enable rate limiting on critical API routes using Upstash or Vercel KV.
- [ ] Require email verification during Clerk sign-up flows.
- [ ] Validate all inputs against a Zod schema before processing.
Code-level guidance:
Wrap API payloads in Zod validation blocks.
```typescript
const schema = z.object({ email: z.string().email() })
const parsed = schema.parse(req.body)
```

## A05: Security Misconfiguration
Description: Insecure default settings, incomplete configurations, or verbose error messages containing sensitive information. This happens across all layers of the stack.
Real-world impact: An unhandled exception dumps a stack trace to the client, revealing database credentials or internal IP addresses.
Prevention checklist:
- [ ] Configure `next.config.js` to emit strict security headers.
- [ ] Disable directory listings and public access to internal storage buckets in Supabase.
- [ ] Ensure error messages sent to the client are generic.
Code-level guidance:
Catch errors at the API boundary and log the full error internally while returning a sanitized message.
```typescript
try {
  await processPayment()
} catch (error) {
  console.error(error)
  return res.status(500).json({ error: "Internal server error" })
}
```

## A06: Vulnerable Components
Description: Using components like libraries and frameworks with known vulnerabilities. Attackers scan for outdated software to exploit known flaws.
Real-world impact: An outdated image parsing library allows remote code execution when a user uploads a malicious avatar.
Prevention checklist:
- [ ] Run `npm audit` in CI/CD pipelines.
- [ ] Enable Dependabot on the GitHub repository.
- [ ] Audit third-party React components for security track records before adding them.
Code-level guidance:
Remove unused dependencies from `package.json`. Do not install packages globally unless required for tooling.

## A07: Identification and Authentication Failures
Description: Weaknesses in authentication and session management leading to identity theft. Attackers compromise passwords, keys, or session tokens.
Real-world impact: Credential stuffing attacks succeed because the application lacks multi-factor authentication and rate limiting.
Prevention checklist:
- [ ] Delegate authentication to Clerk.
- [ ] Enable Multi-Factor Authentication (MFA) in the Clerk dashboard.
- [ ] Set short session lifetimes for highly privileged roles.
Code-level guidance:
Check session validity rather than trusting client-side state.
```typescript
const { userId, sessionId } = auth()
if (!userId || !sessionId) return new Response("Unauthorized", { status: 401 })
```

## A08: Software and Data Integrity Failures
Description: Code and infrastructure that does not protect against integrity violations. This includes pulling unverified plugins or lacking a secure CI/CD pipeline.
Real-world impact: A compromised npm package injects a cryptocurrency miner into the build artifact.
Prevention checklist:
- [ ] Lock dependencies using `package-lock.json` or `pnpm-lock.yaml`.
- [ ] Require signed commits for all repository contributors.
- [ ] Review GitHub Actions workflows for excessive permissions.
Code-level guidance:
Avoid loading external scripts dynamically without Subresource Integrity (SRI) hashes.
```html
<script src="https://example.com/library.js" integrity="sha384-..." crossorigin="anonymous"></script>
```

## A09: Security Logging and Monitoring Failures
Description: Insufficient logging and monitoring allows attackers to extract data or compromise systems without detection. Breaches often go undiscovered for months.
Real-world impact: An attacker exploits a vulnerability over several weeks, but no alerts trigger because failed logins are not logged.
Prevention checklist:
- [ ] Send application logs to a centralized service like Datadog or Vercel Logs.
- [ ] Monitor Clerk for anomalous login attempts.
- [ ] Alert the team on spikes in 500 errors from API routes.
Code-level guidance:
Use a structured logger rather than basic console outputs.
```typescript
logger.info("User login attempt", { userId, ipAddress: req.ip, success: false })
```

## A10: Server-Side Request Forgery (SSRF)
Description: Flaws occurring when a web application fetches a remote resource without validating the user-supplied URL. Attackers can force the server to make requests on their behalf.
Real-world impact: An attacker passes an internal AWS metadata URL to an image fetcher, stealing cloud instance credentials.
Prevention checklist:
- [ ] Validate and sanitize all URLs provided by users before fetching them.
- [ ] Restrict outbound network connections from the server to only required domains.
- [ ] Avoid implementing generic proxy endpoints.
Code-level guidance:
Use an allowlist for external domains.
```typescript
const allowedDomains = ["api.stripe.com", "api.github.com"]
const url = new URL(userInputUrl)
if (!allowedDomains.includes(url.hostname)) throw new Error("Invalid domain")
```
