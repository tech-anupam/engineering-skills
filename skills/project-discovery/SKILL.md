---
name: project-discovery
description: Ask-first workflow that gathers project context before writing any code. Activate this skill at the start of every new project, feature, or significant task. Asks about what the user is building, target users, requirements, preferred UI/UX, target platforms, deployment, existing stack, and constraints.
---

# project-discovery

## When to Activate
- Start of any new project (greenfield development).
- Start of a significant new feature requiring architectural decisions.
- When switching context to an unfamiliar codebase.
- When the scope of work is unclear or vaguely defined.

## Instructions
Execute the following question flow in order. Adapt follow-up questions based on the answers received.

**Phase 1 - What & Why**
1. What are you building? (Demand specificity: e.g., "a SaaS dashboard for logistics", not "a website")
2. Who are the target users? (Developers, end consumers, internal team, B2B?)
3. What core problem does this application solve?

**Phase 2 - Requirements**
4. Core requirements and must-have features?
5. Nice-to-have features for future scope?
6. Any reference sites or applications for inspiration?

**Phase 3 - Design & UX**
7. Preferred UI/UX style? (Offer specific options: glassmorphism, minimalism, neumorphism, brutalism, Material 3, etc.)
8. Any established brand guidelines, colors, or fonts to strictly follow?
9. Priority: Mobile-first or desktop-first? (Always default to mobile-first unless stated otherwise).

**Phase 4 - Technical**
10. Target platforms? (Web, Android, iOS, Desktop, Cross-platform)
11. Preferred tech stack? (Or should I prescribe a stack based on the requirements?)
12. Any existing codebase, legacy APIs, or external services to integrate with?
13. Database preferences? (SQL vs NoSQL, local vs managed)
14. Auth requirements? (Clerk, Firebase Auth, Supabase Auth, custom JWT, none)

**Phase 5 - Deployment & Ops**
15. Deployment target? (Vercel, Netlify, Firebase, AWS, self-hosted VPS)
16. Domain situation? (Have one? Need one? Preferred registrar?)
17. Analytics needed? (GA4, Vercel Analytics, PostHog, custom, none)
18. Any security or compliance requirements? (OWASP strictness, SOC2, HIPAA, PCI)

**Phase 6 - Constraints**
19. Budget constraints? (Strict free tier only? Willing to pay for DX/speed?)
20. Timeline expectations? (MVP, hackathon speed, production-grade slow burn)
21. Any absolute hard rules? (e.g., No AI slop, strict linting, zero comments in code)

### Skill Mapping
After gathering answers, immediately activate relevant skills:
- **Web frontend:** `frontend-stack`, `ui-design`, `responsive-design`, `icons-and-assets`
- **Backend needed:** `backend-and-infra`, `database-selection`
- **Auth needed:** `backend-and-infra` (Clerk/Supabase section)
- **File uploads:** `file-storage`
- **Background jobs:** `queues-and-workers`
- **Android app:** `android-development`
- **Desktop app:** `desktop-software`
- **AI features:** `ai-stack`
- **Voice/TTS/STT:** `ai-stack` (voice section)
- **Minecraft mod/plugin:** `minecraft-development`
- **Production deploy:** `security`, `frontend-stack` (pre-launch checklist)
- **Image-heavy app:** `ui-design` (image delivery section)

## Preferences
- Present questions in digestible batches (e.g., Phase 1 & 2 first) rather than overwhelming with a massive wall of text.
- Assume TypeScript over JavaScript by default for any modern web project unless I state otherwise.

## Anti-Patterns
- Starting to write code before asking questions.
- Assuming I want a specific framework (like React/Next.js) without clarifying the project scale and needs.
- Skipping deployment and security questions (they dictate architecture early on).
- Making stack decisions based on AI habit instead of actual requirements and constraints.
- Not clarifying ambiguous requirements (e.g., guessing what "fast" means instead of asking about latency budgets).

## Lessons Learned
- TODO: Add personal context around times when skipping discovery led to rewriting the entire data layer.
- TODO: Add personal context regarding early CI/CD pipeline setup saving hours of debugging later.

## Exceptions
- Trivial tasks (fix a typo, run a basic script, explain a snippet) skip the full flow.
- Follow-up work on an already-discovered project skips the full flow.
- Minor bug fixes in an existing codebase only need question 12 (existing codebase context) and relevant logs.

## Validation
- Review the collected answers: Is there enough context to define the data model?
- Do we know exactly where this code will be deployed? If not, discovery is incomplete.
