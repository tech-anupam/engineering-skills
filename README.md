<p align="center">
  <h1 align="center">engineering-skills</h1>
  <p align="center">My personal engineering playbook, packaged as Agent Skills</p>
</p>

<p align="center">
  <a href="https://anupambuilds.store/donate"><img src="https://img.shields.io/badge/Donate-Support_AI_Education-FF6B6B?style=for-the-badge&logo=heart&logoColor=white" alt="Donate"></a>
</p>

<p align="center">
  <a href="https://agentskills.io"><img src="https://img.shields.io/badge/spec-agentskills.io-000000?style=flat-square" alt="agentskills.io"></a>
  <a href="https://github.com/tech-anupam/engineering-skills"><img src="https://img.shields.io/badge/github-tech--anupam-181717?style=flat-square&logo=github" alt="GitHub"></a>
  <img src="https://img.shields.io/badge/skills-14-4CAF50?style=flat-square" alt="14 skills">
  <img src="https://img.shields.io/badge/OWASP-Top_10-EE3124?style=flat-square" alt="OWASP Top 10">
  <img src="https://img.shields.io/github/last-commit/tech-anupam/engineering-skills?style=flat-square&label=updated" alt="Last Commit">
</p>

<p align="center">
  <a href="#who-am-i">Who am I</a> · <a href="#skill-index">Skill Index</a> · <a href="#tooling">Tooling</a> · <a href="#installation">Installation</a> · <a href="#donate">Donate</a>
</p>

---

## Who am I

I'm Anupam. I build software and ship it. Some highlights:

**[G1axCrystalOptimizer](https://modrinth.com/mod/g1axcrystaloptimizer)** - Minecraft performance mod with **75,000+ downloads** on Modrinth, earning over **$80+** in ad revenue. Built and shipped with AI-assisted development.

More shipped projects at **[anupambuilds.store/projects](https://anupambuilds.store/projects)** and **[github.com/tech-anupam](https://github.com/tech-anupam)**.

This repo is the engineering playbook behind all of it. Every preference, stack choice, and rule here comes from actually shipping things. Not theory.

---

## What is this

My personal engineering preferences, habits, stack choices, and hard-won rules, structured as **Agent Skills** that any AI coding assistant can activate on demand.

These are opinionated defaults from real project experience. Every skill captures **what** I prefer, **when** to apply it, **what to avoid**, and **when to break the rule**.

Works with: [agentskills.io](https://agentskills.io) spec, Google Antigravity / Gemini CLI, Claude Code, GitHub Copilot, Cursor, Windsurf, and any agent that reads `SKILL.md`.

---

## Skill Index

### Core Workflow

| Skill | What it does | Key files |
|:------|:-------------|:----------|
| [`project-discovery`](./skills/project-discovery/SKILL.md) | Ask-first workflow. Gathers context before any code is written. Maps answers to relevant skills. | [question-bank.md](./skills/project-discovery/references/question-bank.md) |

### Frontend & Design

| Skill | What it does | Key files |
|:------|:-------------|:----------|
| [`ui-design`](./skills/ui-design/SKILL.md) | 8 design systems (glassmorphism, minimalism, neumorphism, claymorphism, aurora, brutalism, skeuomorphism, Material 3). shadcn/ui. ImageKit.io/CDN image delivery. Anti-AI-design rules. | [design-systems.md](./skills/ui-design/references/design-systems.md) · [anti-patterns.md](./skills/ui-design/references/anti-patterns.md) · [image-delivery.md](./skills/ui-design/references/image-delivery.md) · [component-checklist.md](./skills/ui-design/examples/component-checklist.md) |
| [`responsive-design`](./skills/responsive-design/SKILL.md) | Mobile-first. Every frontend works across mobile, tablet, desktop. | |
| [`icons-and-assets`](./skills/icons-and-assets/SKILL.md) | Lucide, Font Awesome, Material Icons. No emojis as UI icons. One library per project. | |
| [`frontend-stack`](./skills/frontend-stack/SKILL.md) | React + Next.js. SEO, GEO, LEO, Core Web Vitals, AI discoverability. ImageKit.io for images. Pre-launch validation. | [seo-checklist.md](./skills/frontend-stack/references/seo-checklist.md) · [performance-checklist.md](./skills/frontend-stack/references/performance-checklist.md) · [lighthouse-audit.ps1](./skills/frontend-stack/scripts/lighthouse-audit.ps1) |

### Backend & Data

| Skill | What it does | Key files |
|:------|:-------------|:----------|
| [`backend-and-infra`](./skills/backend-and-infra/SKILL.md) | Supabase, Firebase, Clerk auth, Vercel/Netlify deployment, Google Analytics, domain registrars. | [auth-patterns.md](./skills/backend-and-infra/references/auth-patterns.md) · [deployment-matrix.md](./skills/backend-and-infra/references/deployment-matrix.md) |
| [`database-selection`](./skills/database-selection/SKILL.md) | Turso, Neon, MongoDB, Supabase, Firebase. Decision framework by project type. | [decision-matrix.md](./skills/database-selection/references/decision-matrix.md) |
| [`file-storage`](./skills/file-storage/SKILL.md) | UploadThing for file uploads. When to use it vs Supabase/Firebase Storage. | |
| [`queues-and-workers`](./skills/queues-and-workers/SKILL.md) | Hono + Cloudflare Workers for background jobs, webhooks, edge compute. | |

### Security

| Skill | What it does | Key files |
|:------|:-------------|:----------|
| [`security`](./skills/security/SKILL.md) | OWASP Top 10, security headers, input validation, secrets management, dependency auditing. | [owasp-checklist.md](./skills/security/references/owasp-checklist.md) · [security-headers.md](./skills/security/references/security-headers.md) · [security-audit.ps1](./skills/security/scripts/security-audit.ps1) |

### Platform-Specific

| Skill | What it does | Key files |
|:------|:-------------|:----------|
| [`desktop-software`](./skills/desktop-software/SKILL.md) | Rust/Tauri for webview apps, Composer for native. | |
| [`android-development`](./skills/android-development/SKILL.md) | Kotlin. ADB + USB debugging for live dev. Voice/TTS/STT. Gradle + SDK validation. | [verify-android-env.ps1](./skills/android-development/scripts/verify-android-env.ps1) |
| [`minecraft-development`](./skills/minecraft-development/SKILL.md) | Java with Maven/Gradle CLI. No IDE dependency. Bukkit/Spigot/Paper/Forge/Fabric/NeoForge. | [toolchain-setup.md](./skills/minecraft-development/references/toolchain-setup.md) · [verify-minecraft-env.ps1](./skills/minecraft-development/scripts/verify-minecraft-env.ps1) |

### AI & ML

| Skill | What it does | Key files |
|:------|:-------------|:----------|
| [`ai-stack`](./skills/ai-stack/SKILL.md) | Groq, Gemini, OpenAI, OpenRouter. Fallback chains. Voice/TTS/STT (Google Voice Engine, Gemini Voice, Grok, ElevenLabs, Whisper, Deepgram). | [provider-decision.md](./skills/ai-stack/references/provider-decision.md) |

---

## Tooling

### Agentic Development Tools

| Tool | How I use it |
|:-----|:-------------|
| **Google Antigravity** | Primary agentic coding assistant. I switch between multiple Pro Gemini accounts for extended usage. |
| **ChatGPT** | Detailed prompt generation. Crafting precise, structured prompts to feed into other agents. |
| **Claude** | Cross-verification and enhancement. Reviews Antigravity output for quality, catches edge cases. |
| **Amazon Q** | AWS-specific tasks, infrastructure automation, code transformation. |
| **OpenAI Codex** | Autonomous coding tasks, background code generation, PR-level work. |

**My workflow:**
```
ChatGPT (craft prompt) → Antigravity (build) → Claude (verify + enhance)
```

### Testing & Debugging

| Tool | Purpose |
|:-----|:--------|
| **ADB** | Live Android development via USB debugging. Deploy, inspect, debug on physical devices in real-time. |
| **Lighthouse CLI** | Performance, accessibility, SEO auditing from command line. |
| **PageSpeed Insights** | Production Core Web Vitals monitoring. |
| **securityheaders.com** | Security header validation. |
| **OWASP ZAP** | Web app vulnerability scanning. |
| **npm audit** | Dependency vulnerability scanning before every deploy. |

### Build Tools

| Tool | Used for |
|:-----|:---------|
| **Gradle** | Android (Kotlin) and Minecraft (Java) projects. CLI-only, no IDE dependency. |
| **Maven** | Minecraft plugins (Bukkit/Spigot/Paper). CLI-only. |
| **npm / pnpm** | Node.js, React, Next.js projects. |
| **Cargo** | Rust desktop applications (Tauri). |

---

## Installation

### Global (all projects)

```powershell
git clone https://github.com/tech-anupam/engineering-skills.git
Copy-Item -Recurse .\engineering-skills\skills\* "$HOME\.gemini\config\skills\"
```

### Per-project

```powershell
mkdir .agents\skills
Copy-Item -Recurse path\to\engineering-skills\skills\* .\.agents\skills\
```

### Git submodule

```powershell
git submodule add https://github.com/tech-anupam/engineering-skills.git .agents/engineering-skills
```

---

## Architecture

```
engineering-skills/
├── README.md
├── AGENTS.md
└── skills/
    ├── project-discovery/          # Ask first, code second
    ├── ui-design/                  # 8 design systems + image delivery
    ├── responsive-design/          # Mobile-first
    ├── icons-and-assets/           # Icon libraries, no emojis
    ├── frontend-stack/             # React + Next.js + validation
    ├── backend-and-infra/          # Supabase, Clerk, Vercel
    ├── database-selection/         # DB decision framework
    ├── file-storage/               # UploadThing
    ├── queues-and-workers/         # Hono + CF Workers
    ├── security/                   # OWASP Top 10 + headers
    ├── desktop-software/           # Rust/Tauri vs Composer
    ├── android-development/        # Kotlin + ADB + voice
    ├── minecraft-development/      # Java + Maven/Gradle CLI
    └── ai-stack/                   # LLM + Voice/TTS/STT
```

Each skill follows the [agentskills.io spec](https://agentskills.io/specification):
- `SKILL.md` with YAML frontmatter (`name` + `description`) and instructions (under 5K tokens)
- `references/` for detailed docs loaded on demand
- `scripts/` for executable helpers
- `examples/` for reference patterns

---

## Principles

1. **Ask first, code second.** Always run `project-discovery` before starting a project.
2. **No AI slop.** No generic gradients, no slopped code structure, no cookie-cutter pages.
3. **No comments in code.** Clean code, unless explicitly requested.
4. **Mobile-first, always.** Start at mobile, scale up.
5. **Validate before shipping.** Performance, SEO, accessibility, security, AI discoverability.
6. **Preferences are defaults, not laws.** When something else is better, explain why and use it.
7. **Design with intent.** Every visual element has a reason to exist.
8. **Security is not optional.** OWASP Top 10 on every production deploy.

---

## Donate

Donations go towards **AI education sessions in schools**. Helping students learn how to build with AI, not just use it.

**Online:**
[anupambuilds.store/donate](https://anupambuilds.store/donate)

**UPI (India):**
```
anupambuilds@fam
```

**Crypto (USDC on Ethereum):**
```
0xdf2122B4a567CA6908Bbece014492998795f694D
```

---

## Growing this playbook

This is a living document. As I build more:

1. Fill in "Lessons Learned" sections with real war stories
2. Add new skills with `skills/<name>/SKILL.md`
3. Expand references with decision matrices and checklists
4. Add scripts for validation and env checks

---

<p align="center">
  <a href="https://github.com/tech-anupam">@tech-anupam</a> · <a href="https://anupambuilds.store">anupambuilds.store</a>
</p>
