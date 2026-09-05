---
name: frontend-stack
description: React and Next.js frontend stack preferences with SEO, GEO, LEO, performance, accessibility, image delivery (ImageKit.io/CDN), and security requirements. Activate when building any web frontend, choosing a framework, configuring image pipelines, or preparing a site for launch. Covers PageSpeed, Core Web Vitals, structured data, semantic HTML, AI discoverability, crawlability, and OWASP security basics.
---

## When to Activate
- Starting a new web frontend project
- Choosing a framework or styling solution
- Configuring image delivery pipelines and CDNs
- Preparing a site for launch (pre-launch checklists)
- Optimizing for SEO, GEO (Generative Engine Optimization), LEO, and Core Web Vitals

## Preferences

### Default Stack
- **React + Next.js**: App Router is strongly preferred for all new projects.
- **TypeScript**: Always. No exceptions.
- **Tailwind CSS**: Standardized utility-first styling.
- **shadcn/ui**: Component library foundation.

### Image Delivery Pipeline
- **CDNs & Transformation**: Use ImageKit.io or Cloudinary for image optimization in any frontend app.
- **Next.js Integration**: Use the Next.js `Image` component with an external loader configured for ImageKit.io.
- **Formats**: Serve AVIF with WebP and JPEG fallbacks.
- **Responsiveness**: Always use `srcset` and `sizes` attributes for responsive images.
- **Loading Strategy**: Preload LCP (Largest Contentful Paint) / hero images. Lazy load all below-the-fold images.
- **Asset CDN**: Use a CDN for all static assets (Bunny CDN, Cloudflare CDN, Vercel Edge).

### Pre-Launch Validation
A site is NOT done just because it works visually. Before shipping, validate:
1. **Performance**: Lighthouse > 90, LCP < 2.5s, CLS < 0.1.
2. **SEO**: Title, meta descriptions, Open Graph (OG), sitemap, robots.txt, and structured data are mandatory.
3. **GEO**: Entity disambiguation, direct answers, and permissive AI bot crawling.
4. **LEO**: Semantic HTML, FAQ sections, clean content structure.
5. **Accessibility**: WCAG AA minimum, full keyboard navigation, screen reader support.
6. **Security**: CSP headers, enforced HTTPS, no exposed secrets or API keys.
7. **Mobile**: Fully responsive at 320px, 768px, 1024px, and 1440px breakpoints.
8. **AI Discoverability**: Include `llms.txt`, extensive schema.org, and permissive AI bot crawling.

### Code Quality Rules
- No comments in generated code.
- No AI-slopped code structure. Keep it modular and purpose-built.
- Clean imports, strict removal of unused dependencies.
- Consistent file and folder naming conventions (e.g., kebab-case for files, PascalCase for components).

## Anti-Patterns
- Calling a site "done" without running a Lighthouse audit.
- Serving raw, unoptimized images directly from `/public`.
- Missing meta tags and structured data (JSON-LD).
- Lacking error boundaries or suspense/loading states.
- Ignoring accessibility (missing alt text, skipped heading levels, un-tabbable interactive elements).

## Lessons Learned
- TODO: Add personal context around specific SEO/Performance debugging nightmares.
- TODO: Add personal context around ImageKit migration pain points.

## Exceptions
- Internal tools and private dashboards can skip strict SEO and AI discoverability.
- Rapid prototypes and proof-of-concepts can skip deep performance optimizations until validated.

## Validation
- Lighthouse CI checks passing (>90).
- Google Search Console showing no indexing errors.
- Visual inspection across mobile breakpoints.
