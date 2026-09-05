# OWASP Top 10 (2021) Detailed Checklist

## A01: Broken Access Control
- **Description:** Failures where authenticated users can access unauthorized data or actions.
- **Attack Example:** Changing a URL parameter from `user=123` to `user=124` to view another user's profile.
- **Prevention Checklist:**
  - [ ] Deny by default.
  - [ ] Implement access control mechanisms once and reuse them throughout the application.
  - [ ] Enforce record ownership.
- **Next.js/React Mitigations:** Use middleware to protect routes.
- **API Mitigations:** Validate permissions and ownership on every server-side API request.
- **Insecure:**
  ```javascript
  const user = await db.users.find(req.query.userId);
  ```
- **Secure:**
  ```javascript
  const user = await db.users.find({ id: req.query.userId, ownerId: req.user.id });
  ```

## A02: Cryptographic Failures
- **Description:** Failures related to cryptography leading to sensitive data exposure.
- **Attack Example:** Intercepting unencrypted traffic over HTTP.
- **Prevention Checklist:**
  - [ ] Classify data processed, stored, or transmitted.
  - [ ] Encrypt all sensitive data at rest and in transit.
  - [ ] Use strong, up-to-date standard algorithms.
- **Next.js/React Mitigations:** Only load assets over HTTPS.
- **API Mitigations:** Enforce TLS/HTTPS. Use standard hashing (e.g., bcrypt) if handling passwords, though relying on Clerk is preferred.

## A03: Injection
- **Description:** Flaws like SQL, NoSQL, or Command Injection, where untrusted data is sent as part of a command or query.
- **Attack Example:** Inputting `admin' --` into a login form to bypass auth.
- **Prevention Checklist:**
  - [ ] Use a safe API, which avoids the use of the interpreter entirely or provides a parameterized interface.
  - [ ] Use positive or "whitelist" server-side input validation.
- **Next.js/React Mitigations:** Avoid `dangerouslySetInnerHTML` unless input is sanitized via DOMPurify.
- **API Mitigations:** Use ORMs like Prisma or Drizzle which handle parameterization by default.

## A04: Insecure Design
- **Description:** Flaws stemming from missing or ineffective control design.
- **Attack Example:** An e-commerce site allowing bulk purchases without rate limiting, leading to inventory exhaustion.
- **Prevention Checklist:**
  - [ ] Establish and use a secure development lifecycle.
  - [ ] Use threat modeling for critical authentication, access control, and business logic.
- **Next.js/React Mitigations:** Implement route guards and component-level authorization.
- **API Mitigations:** Apply strict rate limiting and defense in depth on all endpoints.

## A05: Security Misconfiguration
- **Description:** Insecure default settings, open cloud storage, misconfigured HTTP headers, and verbose error messages.
- **Attack Example:** Accessing `/admin` directory because directory listing was left enabled.
- **Prevention Checklist:**
  - [ ] Implement a repeatable hardening process.
  - [ ] Remove or do not install unused features and frameworks.
- **Next.js/React Mitigations:** Configure `next.config.js` with secure HTTP headers.
- **API Mitigations:** Disable detailed stack traces in production error responses.

## A06: Vulnerable Components
- **Description:** Using components, such as libraries, frameworks, and other software modules, with known vulnerabilities.
- **Attack Example:** Exploiting a known RCE in an outdated version of lodash or express.
- **Prevention Checklist:**
  - [ ] Remove unused dependencies, unnecessary features, components, files, and documentation.
  - [ ] Continuously inventory the versions of both client-side and server-side components.
- **Next.js/React Mitigations:** Regular `npm audit` checks.
- **API Mitigations:** Pin dependencies and automate updates using tools like Dependabot.

## A07: Authentication Failures
- **Description:** Weaknesses in authentication and session management leading to identity theft.
- **Attack Example:** Brute forcing a login page that has no rate limiting or lock-out mechanism.
- **Prevention Checklist:**
  - [ ] Where possible, implement multi-factor authentication.
  - [ ] Do not deploy with any default credentials.
- **Next.js/React Mitigations:** Integrate standard auth providers like Clerk.
- **API Mitigations:** Ensure session cookies use `HttpOnly`, `Secure`, and `SameSite` flags.

## A08: Software and Data Integrity
- **Description:** Code and infrastructure that does not protect against integrity violations.
- **Attack Example:** A compromised CDN serving malicious scripts that clients execute.
- **Prevention Checklist:**
  - [ ] Use digital signatures or similar mechanisms to verify software or data from external sources.
  - [ ] Ensure libraries and dependencies are consuming trusted repositories.
- **Next.js/React Mitigations:** Use Subresource Integrity (SRI) tags when loading scripts from CDNs.
- **API Mitigations:** Enforce signed commits in the repository.

## A09: Security Logging & Monitoring
- **Description:** Insufficient logging and monitoring, allowing attackers to further extract or destroy data without detection.
- **Attack Example:** An attacker probing an API for vulnerabilities over days without being noticed.
- **Prevention Checklist:**
  - [ ] Ensure all login, access control, and server-side input validation failures can be logged.
  - [ ] Establish effective monitoring and alerting.
- **Next.js/React Mitigations:** Log client-side exceptions to a monitoring service (e.g., Sentry).
- **API Mitigations:** Centralize logs and set up automated alerts for high error rates.

## A10: Server-Side Request Forgery (SSRF)
- **Description:** Flaws occurring when a web application fetches a remote resource without validating the user-supplied URL.
- **Attack Example:** Supplying `http://localhost/admin` to a webhook URL field to access internal services.
- **Prevention Checklist:**
  - [ ] Enforce "deny by default" network policies.
  - [ ] Sanitize and validate all client-supplied input data.
- **Next.js/React Mitigations:** Avoid initiating network requests directly based on unvalidated user input in Server Components or API routes.
- **API Mitigations:** Whitelist allowed domains for outbound requests.
