---
name: responsive-design
description: Mobile-first responsive design rules. Activate when building any frontend, layout, or UI component. Every interface must work across mobile, tablet, and desktop.
---
## When to Activate
- Any frontend work
- Building any layout or UI component

## Instructions
- Core rule: Build mobile-first. Start with the mobile layout, then scale up.
- Every frontend must work properly across mobile, tablet, and desktop
- Breakpoint expectations: mobile → tablet → desktop (not the reverse)

## Preferences
- Mobile responsiveness is NOT an afterthought — it is the starting point

## Anti-Patterns
- Building desktop-first and then trying to squeeze it into mobile
- Using fixed widths that break on smaller screens
- Hiding critical content on mobile instead of redesigning for it
- Testing only on desktop during development

## Lessons Learned
- TODO: Add personal context

## Exceptions
- Admin dashboards or internal tools where desktop-only is explicitly acceptable

## Validation
- Test at minimum 3 viewport sizes before considering any UI work complete
