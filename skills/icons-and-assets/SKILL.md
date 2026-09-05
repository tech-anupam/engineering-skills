---
name: icons-and-assets
description: Icon library preferences and asset rules. Activate when adding icons, choosing icon sets, or working with visual assets in any UI. Never use emojis as UI icons.
---
## When to Activate
- Any time icons are needed in a UI
- Choosing icon sets or working with visual assets

## Instructions
- Pick ONE icon library per project and stick with it. Do not mix icon styles from different libraries.

## Preferences
- Preferred icon libraries (in order of preference):
  1. Lucide Icons — default for React/Next.js projects
  2. Font Awesome
  3. Google Material Icons

## Anti-Patterns
- Hard rule: NEVER use emojis as UI icons inside code
- Using emojis (🚀 ✨ 🎯) as icons in UI components
- Mixing Lucide and Font Awesome in the same project
- Using random SVGs from different sources with inconsistent stroke widths

## Lessons Learned
- TODO: Add personal context

## Exceptions
- Emojis are acceptable in content/copy (blog posts, chat messages) but never as UI chrome icons

## Validation
- Verify only one consistent icon library is used across the project
- Ensure no emojis are used as UI icons
