---
name: desktop-software
description: Desktop application development preferences. Activate when building desktop software, choosing a desktop framework, or deciding between webview and native approaches. Covers Rust with webview and Composer for native.
---

# desktop-software

## When to Activate
- When building desktop software
- When choosing a desktop framework
- When deciding between webview and native approaches

## Instructions
- Do NOT assume one framework fits every desktop project
- Ask about requirements first before deciding on an approach

## Preferences
- Webview-based desktop app → Use Rust (Tauri)
- Native desktop app (no webview) → Use Composer
- Decision factors: Does the app need native OS integration? Is a web UI acceptable? Performance requirements? Target platforms?

## Anti-Patterns
- Don't default to Electron
- Don't assume webview is always fine
- Don't assume native is always necessary

## Lessons Learned
- TODO: Add personal context

## Exceptions
- When project constraints require a specific framework (e.g., existing Electron codebase, .NET WPF for Windows-only)

## Validation
- Ensure the framework choice matches the specific performance, integration, and UI requirements
