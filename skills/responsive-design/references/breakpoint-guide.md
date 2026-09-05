# Breakpoint Guide Reference

## Tailwind CSS Breakpoints

| Prefix | Min Width | CSS | Target Devices |
|---|---|---|---|
| (none) | 0px | (base styles) | All phones |
| sm | 640px | @media (min-width: 640px) | Large phones landscape |
| md | 768px | @media (min-width: 768px) | Tablets |
| lg | 1024px | @media (min-width: 1024px) | Small laptops |
| xl | 1280px | @media (min-width: 1280px) | Desktops |
| 2xl | 1536px | @media (min-width: 1536px) | Large monitors |

## Common Device Widths

| Device | Width | Category |
|---|---|---|
| iPhone SE | 320px | Small phone |
| iPhone 12/13/14/15 | 390px | Standard phone |
| iPhone 15 Pro Max | 430px | Large phone |
| Samsung Galaxy S24 | 360px | Standard phone |
| iPad Mini | 744px | Small tablet |
| iPad Air/Pro 11" | 820px | Tablet |
| iPad Pro 12.9" | 1024px | Large tablet |
| MacBook Air 13" | 1280px | Laptop |
| 1080p monitor | 1920px | Desktop |
| 1440p monitor | 2560px | Large desktop |

## Layout Patterns by Breakpoint

| Pattern | Mobile | Tablet | Desktop |
|---|---|---|---|
| Navigation | Hamburger/bottom nav | Sidebar or top | Full sidebar + top |
| Content grid | 1 column | 2 columns | 3-4 columns |
| Sidebar | Hidden/overlay | Collapsible | Always visible |
| Cards | Full width stack | 2-up grid | 3-4 up grid |
| Forms | Full width inputs | 2-column layout | 2-column with sidebar |
| Hero section | Stacked (image above text) | Side by side | Side by side with more padding |
| Footer | Stacked links | 2-column | 4-column |

## Fluid Typography

Use `clamp()` for responsive font sizes:
- H1: `clamp(2rem, 5vw, 3.5rem)`
- H2: `clamp(1.5rem, 4vw, 2.5rem)`
- H3: `clamp(1.25rem, 3vw, 1.75rem)`
- Body: `clamp(1rem, 2.5vw, 1.125rem)`
- Small: `clamp(0.875rem, 2vw, 0.875rem)`

## Testing Checklist

1. Open browser DevTools (F12)
2. Toggle device toolbar (Ctrl+Shift+M)
3. Test at: 320px, 375px, 768px, 1024px, 1440px
4. Check for: horizontal scroll, overlapping elements, unreadable text, broken layouts, unreachable buttons
5. Test with real content (not lorem ipsum - real text reveals layout problems)
