---
name: desktop-software
description: Desktop application development preferences covering Rust/Tauri for webview-based apps and Composer for native apps. Activate when building desktop software, choosing a desktop framework, or deciding between webview and native approaches.
---

# Desktop Software

## When to Activate
- Building a desktop application
- Choosing a desktop framework
- Deciding between webview-based and native UI
- Porting a web app to desktop

## Decision Framework

Ask these questions before choosing a framework:

### Path 1: Webview-based (Rust / Tauri)
Choose this when:
- The app can use a web-based UI (HTML/CSS/JS)
- You want a small binary size (Tauri apps are 2-10MB vs Electron's 100MB+)
- You need cross-platform (Windows, macOS, Linux)
- You want system-level APIs (file system, notifications, tray) with a web frontend
- Performance matters but native rendering isn't critical

**Tauri advantages over Electron:**
- Uses the OS's native webview (WebView2 on Windows, WebKit on macOS/Linux) instead of bundling Chromium
- 10-50x smaller binary size
- Lower memory footprint
- Backend is Rust (fast, memory-safe, no garbage collector)
- IPC between frontend and Rust backend is type-safe

### Path 2: Native (Composer)
Choose this when:
- You don't want a webview at all
- The app needs native OS look-and-feel that webviews can't replicate
- Performance-critical rendering (CAD, video editing, real-time visualization)
- Deep OS integration (hardware drivers, system services)

### Do NOT default to Electron
Electron bundles an entire Chromium browser. For new projects, Tauri does the same job with a fraction of the size and memory. Only use Electron for existing Electron codebases.

## Decision Checklist

| Question | Yes -> | No -> |
|:---------|:-------|:------|
| Is a web UI acceptable? | Tauri | Composer |
| Need cross-platform? | Tauri | Consider platform-native |
| Need tiny binary? | Tauri | Either |
| Need native OS controls? | Composer | Either |
| GPU-intensive rendering? | Composer | Either |
| Existing web codebase to port? | Tauri | Evaluate both |

## Build Tools
- **Tauri:** Cargo (Rust) for backend + npm/pnpm for frontend. CLI: `cargo tauri dev`, `cargo tauri build`
- **Composer:** Depends on target platform and language

## Anti-Patterns
- Defaulting to Electron for new projects
- Assuming webview is always acceptable without asking
- Assuming native is always necessary without asking
- Not considering binary size and memory footprint
- Not testing on all target platforms during development

## Lessons Learned
- TODO: Add personal context about desktop framework choices

## Exceptions
- Existing Electron codebases should not be rewritten to Tauri without clear justification
- .NET WPF/WinForms for Windows-only enterprise apps where the ecosystem demands it
- Qt for C++ desktop apps with complex native rendering needs

## Validation
- Framework choice matches the performance, UI, and distribution requirements
- App builds and runs on all target platforms
- Binary size is reasonable for the distribution method
