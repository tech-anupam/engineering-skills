# Agent Rules

These rules apply to every AI agent working with my code or projects.

## Before Starting Any Project

Activate the `project-discovery` skill. Ask the user about their project before writing code. Do not assume stack, design, or architecture choices.

## Code Generation Rules

- **No comments in generated code** unless explicitly requested. I prefer self-documenting code over noisy comments.
- **No AI-slopped code structure** - code should look handwritten, intentional, and not machine-generated.
- **No boilerplate explanations in code** (e.g., `// This function does X`).
- **Clean imports** - absolutely no unused imports or dangling dependencies left behind.
- **Consistent naming conventions** per project language (e.g., camelCase for TS, snake_case for Python).
- **TypeScript over JavaScript** in all web projects, without exception.
- **Proper error handling** - no silent catches, no empty `try/catch` blocks. Fail loud or handle it cleanly.

## Design Rules

- Design should look intentional and highly polished, not AI-generated.
- No default AI-style gradients, generic glowing orbs, or overused color palettes.
- **Build mobile-first, always.**
- **Never use emojis as UI icons** - use Lucide, Font Awesome, or Material Icons exclusively.
- **Use ImageKit.io or a CDN** for image delivery - never serve raw unoptimized images directly.

## Quality Rules

- Every frontend must be validated for performance, SEO, accessibility, security, and AI discoverability before considering it done.
- Run Lighthouse checks before calling a public-facing site finished.
- Check OWASP Top 10 security basics on any production deployment.
- Verify build environments (Gradle, SDK versions, dependencies) before writing platform-specific code.

## Decision-Making Rules

- My stack preferences are defaults, not mandates.
- If a different technology is clearly better for the specific requirement, explain why and use it.
- Do not blindly follow generic AI coding patterns. Adapt to the specific context.
- Understand the full project context before making technical decisions.

## Available Skills

Activate these based on project needs:

| Skill | When to use |
|---|---|
| `project-discovery` | Start of any new project or feature |
| `ui-design` | Any UI work - design system, components, fonts, images |
| `responsive-design` | Any frontend layout work |
| `icons-and-assets` | Adding icons to UI |
| `frontend-stack` | React/Next.js development, SEO, performance |
| `backend-and-infra` | Backend, auth, deployment, analytics |
| `database-selection` | Choosing or setting up a database |
| `file-storage` | File/image upload features |
| `queues-and-workers` | Background jobs, webhooks, edge compute |
| `desktop-software` | Desktop application development |
| `android-development` | Android/Kotlin development |
| `minecraft-development` | Minecraft mods/plugins |
| `ai-stack` | AI features, LLM integration, voice/speech |
| `security` | Security hardening, OWASP, production deploy |
