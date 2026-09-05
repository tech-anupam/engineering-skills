---
name: ui-design
description: UI/UX design preferences covering multiple design systems (glassmorphism, minimalism, neumorphism, skeuomorphism, claymorphism, aurora UI, brutalism, Material 3), shadcn/ui component architecture, anti-AI-design rules, font selection, and image delivery via ImageKit.io/CDN. Activate when building any user interface, designing layouts, choosing design systems, selecting fonts, picking colors, or creating visual components.
---

## When to Activate
- When scaffolding a new frontend project and establishing the visual identity.
- When generating or refining UI components, layouts, or navigation structures.
- When selecting color palettes, typography, or spacing conventions.
- When configuring image pipelines and static asset delivery.
- When evaluating wireframes or high-fidelity designs for implementation.

## Instructions
1. **Prompt for System**: Never default to a generic aesthetic. Present the 8 design systems (see Preferences) and force a choice based on project context.
2. **Setup Foundations**: Initialize shadcn/ui. Extract core layout shells (Navbar, Footer, Layout) immediately.
3. **Configure Image Delivery**: Wire up ImageKit.io or a dedicated CDN for media. Never commit large binary images directly to the repo if they are dynamic.
4. **Define Typography**: Set up standard variables for display (headings) and body (sans-serif) fonts.
5. **Enforce Identity**: Actively scan for and reject AI-slop design tropes during implementation.

## Preferences

### Design Systems
Before writing a single line of CSS, select one of these core design systems based on the project's goals. See `references/design-systems.md` for detailed implementation patterns.

- **Glassmorphism**: Frosted glass effects via backdrop-blur, semi-transparent backgrounds, and light borders. Use for dashboards, overlay-heavy UIs, and dark themes. 
- **Minimalism**: Maximum whitespace, strict limited color palette, stark typography. Use for portfolios, documentation, and content-first sites.
- **Neumorphism**: Soft extruded/inset shadows mimicking physical plastic or clay. Use for single-function tools, calculators, or hardware-like UIs. High risk for low contrast.
- **Skeuomorphism**: Realistic physical metaphors, rich textures (leather, metal). Use for note-taking apps, music production tools, or highly specific niche software.
- **Claymorphism**: Soft, rounded 3D shapes with vibrant, colorful shadows. Use for playful apps, children's content, or creative tools.
- **Aurora UI**: Subtle, fluid gradient mesh backgrounds with organic color transitions. Use for creative portfolios and music apps. Must be intentional, not generic AI gradient soup.
- **Brutalism**: Raw, unpolished, intentionally jarring layouts with high contrast and web-safe fonts. Use for art portfolios, experimental projects, and statement pieces.
- **Material 3 / Material You**: Highly structured, adaptive, dynamic color system. Use for Android apps, Google ecosystem tools, or system-level native feel.

### Image Delivery
- Always use ImageKit.io or a CDN (Cloudinary, Bunny CDN) for image optimization.
- Never serve raw unoptimized images directly from a basic web server.
- Serve AVIF with WebP fallback, then JPEG.
- Utilize ImageKit.io for real-time URL-based transformations and lazy loading.
- See `references/image-delivery.md` for specific pipeline configurations.

### Reusable Components (shadcn/ui)
- shadcn/ui is the default component architecture for React/Next.js projects.
- Extract generic structural elements into reusable components: `Navbar`, `Footer`, `Sidebar`, `PageLayout`.
- Use data-driven navigation: Drive menus and nav links from static configuration arrays, not hardcoded JSX elements.
- Implement strict variant props (`primary`, `secondary`, `ghost`, `destructive`) using `cva` (Class Variance Authority).

### Typography
- **Handwritten / Display Elements**: Google Fonts like Permanent Marker, Caveat, or Shadows Into Light for deliberate organic contrast.
- **Body Text**: System fonts (San Francisco, Inter, Roboto) or clean sans-serifs that fit the design system.
- Never use generic futuristic or robotic fonts that scream "AI generated this". Keep typography grounded.

## Anti-Patterns
See `references/anti-patterns.md` for detailed breakdowns. Do NOT do the following:
- Defaulting to purple-to-blue gradient backgrounds.
- Scattering glowing floating orbs across the screen as generic decoration.
- Using the standard "Built with AI" shiny aesthetic.
- Building the exact same Hero -> Feature Grid -> Testimonials -> CTA layout for every single site.
- Using rainbow gradient text on stark dark backgrounds.

## Lessons Learned
- TODO: Add personal context around which specific shadcn components always cause integration friction.
- TODO: Add personal context about performance hits on low-end devices from abusing `backdrop-blur`.
- TODO: Add personal context regarding ImageKit vs Next.js native image optimization costs.

## Exceptions
- Internal admin panels or scratch tools don't need a strict design system (fallback to simple Tailwind/shadcn defaults).
- Completely static, single-page hardcoded landing pages without dynamic images don't require an external CDN pipeline.

## Validation
- Verify the chosen design system is consistently applied across buttons, cards, and inputs.
- Inspect network requests to confirm images are being served from the CDN in AVIF/WebP formats.
- Run Lighthouse accessibility checks to catch contrast issues, especially if using Neumorphism or Glassmorphism.
