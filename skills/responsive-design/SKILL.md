---
name: responsive-design
description: Mobile-first responsive design rules and breakpoint strategy. Activate when building any frontend, layout, or UI component. Every interface must work across mobile, tablet, and desktop viewports.
---

# Responsive Design

## When to Activate
- Any frontend layout work
- Building any UI component
- Reviewing existing layouts for responsiveness
- Setting up CSS/Tailwind breakpoints

## Core Rule

**Build mobile-first.** Start with the smallest viewport. Add complexity as the screen grows. Never the reverse.

Mobile is not a shrunken version of desktop. Desktop is an expanded version of mobile.

## Breakpoint Strategy

Start with no media queries (mobile base), then layer up:

| Breakpoint | Width | Target |
|:-----------|:------|:-------|
| Base | < 640px | Phones (portrait) |
| `sm` | 640px+ | Phones (landscape) |
| `md` | 768px+ | Tablets |
| `lg` | 1024px+ | Small laptops |
| `xl` | 1280px+ | Desktops |
| `2xl` | 1536px+ | Large monitors |

In Tailwind, this means writing the base styles for mobile first, then using `md:`, `lg:`, `xl:` for larger screens.

## Layout Patterns

- **Stack on mobile, grid on desktop.** Single column at base, multi-column at `md:` or `lg:`.
- **Touch-first interactions.** Tap targets minimum 44x44px (48px preferred). No hover-only interactions.
- **Fluid typography.** Use `clamp()` for font sizes that scale with viewport. Example: `clamp(1rem, 2.5vw, 1.5rem)`.
- **Flexible images.** Always `max-width: 100%` on images. Use `aspect-ratio` to prevent layout shift.
- **Navigation adapts.** Full nav on desktop, hamburger/bottom nav on mobile. Don't just hide links.

## Testing Requirements

Before any UI work is considered complete, test at these viewports:

1. **320px** - smallest phones (iPhone SE)
2. **375px** - standard phones (iPhone 12/13/14)
3. **768px** - tablets (iPad)
4. **1024px** - small laptops
5. **1440px** - standard desktops

Use browser DevTools device toolbar, not just browser resize.

## Anti-Patterns

- Building desktop-first and then trying to squeeze it into mobile
- Using fixed pixel widths that break on smaller screens
- Hiding critical content on mobile instead of redesigning for it
- Testing only on desktop during development
- Using `display: none` on mobile as a "responsive" solution
- Horizontal scrolling on mobile (except intentional carousels)
- Text too small to read without zooming (min 16px body text on mobile)
- Tap targets too close together (frustrating on touch screens)

## Lessons Learned
- TODO: Add personal context about responsive issues encountered

## Exceptions
- Admin dashboards or internal tools where desktop-only is explicitly acceptable
- Kiosk or fixed-display applications with known screen dimensions

## Validation
- Test at minimum 5 viewport sizes (320, 375, 768, 1024, 1440)
- No horizontal scrollbar on any viewport
- All tap targets are at least 44x44px
- Text is readable without zooming on mobile
- Navigation is usable on every viewport
