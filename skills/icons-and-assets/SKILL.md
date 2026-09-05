---
name: icons-and-assets
description: Icon library preferences, asset management rules, and image optimization requirements. Activate when adding icons to any UI, choosing icon sets, managing visual assets, or optimizing images for delivery. Covers Lucide, Font Awesome, Material Icons, ImageKit.io, and CDN delivery.
---

## When to Activate
- Adding icons to any UI
- Choosing icon sets for a new project
- Managing visual assets
- Optimizing images for delivery

## Instructions

### Icon Library Selection
Preferred order:
1. **Lucide Icons** - default for React/Next.js. Lightweight, tree-shakeable, consistent 24x24 grid, active maintenance. Install: `lucide-react`
2. **Font Awesome** - largest icon set, good for projects needing extensive coverage. Use the React package, not the CSS font approach (reduces bundle). Install: `@fortawesome/react-fontawesome`
3. **Google Material Icons** - good for Material 3 projects, Android consistency. Install: `@mui/icons-material` or use via Google Fonts

### Image Assets
- Use ImageKit.io or CDN for image delivery
- Never serve raw unoptimized images from /public
- Use responsive images with srcset/sizes
- Format priority: AVIF > WebP > JPEG
- SVG for icons and logos, raster for photos

## Preferences
- Pick ONE icon library per project. Mixing Lucide and Font Awesome creates visual inconsistency (different stroke widths, sizing, style).
- Use consistent icon sizes throughout the project (16px for inline, 20px for buttons, 24px for standalone).
- Icons should be functional, not decorative. Every icon should communicate meaning.

## Anti-Patterns
- NEVER use emojis as UI icons in code. Emojis render differently across platforms and look unprofessional.
- Using emojis as icons in buttons, nav items, or cards.
- Mixing icons from multiple libraries (inconsistent stroke/fill/size).
- Using icon fonts via CSS instead of React components (can't tree-shake).
- Using random SVGs from the internet with inconsistent design language.
- Not adding aria-labels to icon-only buttons.

## Lessons Learned
- TODO: Add personal context

## Exceptions
When Emojis ARE Acceptable:
- Blog post content / article body text
- Chat messages and user-generated content
- Marketing copy and social media text
- Placeholder text during prototyping
- But NEVER in navigation, buttons, headers, or UI chrome

## Validation
- All icons come from a single library
- No emojis in UI component code
- Icon-only buttons have aria-label for accessibility
- Icons are consistent in size and style throughout
