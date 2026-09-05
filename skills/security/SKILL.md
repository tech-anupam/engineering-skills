---
name: security
description: Web application security standards based on OWASP Top 10 and modern security practices. Activate when building any web application, API, authentication system, handling user input, storing sensitive data, or deploying to production. Covers injection prevention, authentication flaws, sensitive data exposure, XSS, CSRF, CORS, security headers, dependency auditing, and secure deployment.
---

## When to Activate
- Any web application development
- API development
- Auth implementation
- User input handling
- Production deployment
- Code review for security

## OWASP Top 10 (2021) Coverage

1. **A01: Broken Access Control**
   - **What it is:** Failures where authenticated users can access unauthorized data or actions.
   - **Prevention:** Enforce server-side auth checks; don't rely on client-side guards. Use Clerk middleware for route protection. Validate permissions on every API route.
2. **A02: Cryptographic Failures**
   - **What it is:** Failures related to cryptography leading to sensitive data exposure.
   - **Prevention:** Enforce HTTPS everywhere. Never store plaintext passwords (Clerk handles this). Encrypt sensitive data at rest and use environment variables for secrets.
3. **A03: Injection**
   - **What it is:** Flaws like SQL, NoSQL, or Command Injection, where untrusted data is sent as part of a command or query.
   - **Prevention:** Use parameterized queries with ORMs (Drizzle/Prisma). Never concatenate SQL. Validate all inputs and sanitize user content before rendering.
4. **A04: Insecure Design**
   - **What it is:** Flaws stemming from missing or ineffective control design.
   - **Prevention:** Threat model before building. Apply the principle of least privilege and defense in depth. Implement rate limiting on all public endpoints.
5. **A05: Security Misconfiguration**
   - **What it is:** Insecure default settings, open cloud storage, misconfigured HTTP headers, and verbose error messages.
   - **Prevention:** Remove default configs. Enforce security headers (CSP, HSTS, X-Frame-Options). Disable directory listing and keep dependencies updated.
6. **A06: Vulnerable Components**
   - **What it is:** Components, such as libraries, frameworks, and other software modules, running with known vulnerabilities.
   - **Prevention:** Run `npm audit` regularly. Pin dependency versions. Monitor for CVEs and use `npx npm-check-updates`.
7. **A07: Authentication Failures**
   - **What it is:** Weaknesses in authentication and session management leading to identity theft.
   - **Prevention:** Use Clerk (don't roll your own auth). Enforce MFA where appropriate. Implement secure session management and secure cookie flags.
8. **A08: Software and Data Integrity**
   - **What it is:** Code and infrastructure that does not protect against integrity violations (e.g., unsigned updates, compromised CI/CD).
   - **Prevention:** Verify CI/CD pipeline integrity. Use subresource integrity (SRI) for CDN scripts and sign commits.
9. **A09: Security Logging & Monitoring**
   - **What it is:** Insufficient logging and monitoring, allowing attackers to further extract or destroy data without detection.
   - **Prevention:** Log auth events, failed access attempts, and API abuse patterns. Set up alerts for suspicious activities.
10. **A10: Server-Side Request Forgery (SSRF)**
    - **What it is:** Flaws occurring when a web application fetches a remote resource without validating the user-supplied URL.
    - **Prevention:** Validate/whitelist URLs. Don't pass user input directly to `fetch` or `axios` on the server. Sanitize redirect URLs.

## Security Headers Checklist
- `Content-Security-Policy`: Controls resources the user agent is allowed to load.
- `Strict-Transport-Security`: Enforces secure (HTTP over SSL/TLS) connections.
- `X-Content-Type-Options: nosniff`: Prevents MIME-sniffing.
- `X-Frame-Options: DENY`: Prevents clickjacking by disabling iframes.
- `X-XSS-Protection: 0`: Disable in favor of CSP.
- `Referrer-Policy: strict-origin-when-cross-origin`: Controls how much referrer information is sent.
- `Permissions-Policy`: Allows/denies use of browser features in its own frame and iframes.
- `Cache-Control`: Proper directives for sensitive pages (e.g., `no-store, max-age=0`).

## Input Validation Rules
- Validate on the server; never trust client-side validation alone.
- Whitelist acceptable patterns rather than blacklisting bad ones.
- Use `zod` or similar libraries for robust schema validation.
- Sanitize HTML with DOMPurify or similar before rendering.
- Limit file upload types and strictly enforce maximum sizes.

## Environment & Secrets
- Never commit `.env` files to source control.
- Use `.env.local` for local development, and platform-specific environment variables for production.
- Rotate keys periodically to limit exposure windows.
- Use different keys per environment (dev, staging, prod).

## Anti-Patterns
- Rolling your own auth/crypto mechanisms.
- Storing secrets directly in code or repositories.
- Trusting client-side validation as a security measure.
- Using `dangerouslySetInnerHTML` in React without rigorous HTML sanitization.
- Disabling CORS entirely or using wildcard CORS origins (`*`) in production.

## Lessons Learned
- TODO: Add personal context (e.g., specific pain points with rolling own auth or CORS misconfigurations).

## Exceptions
- When building purely static, internal-only marketing sites with no user input, some strict API rate limiting or complex CORS setups may be overkill, though standard headers should still apply.

## Validation
- Run `npm audit` before every deploy.
- Check security headers using securityheaders.com.
- Test for common vulnerabilities with OWASP ZAP or Burp Suite.
