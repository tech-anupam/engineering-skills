# Frontend Performance & Core Web Vitals Checklist

## Core Web Vitals Targets
- [ ] **LCP (Largest Contentful Paint)**: < 2.5s
- [ ] **INP (Interaction to Next Paint)**: < 200ms
- [ ] **CLS (Cumulative Layout Shift)**: < 0.1
- [ ] **TTFB (Time to First Byte)**: < 800ms
- [ ] **FCP (First Contentful Paint)**: < 1.8s
- [ ] **Lighthouse Performance Score**: > 90 consistently

## Image Optimization
- [ ] **Format**: Serve AVIF with WebP fallback (JPEG as last resort).
- [ ] **Transformation**: Use ImageKit.io or Cloudinary for dynamic, on-the-fly transformations.
- [ ] **Layout Stability**: Set explicit `width`/`height` or `aspect-ratio` on all images to prevent CLS.
- [ ] **Responsive Sizes**: Utilize the `sizes` attribute accurately for responsive rendering.
- [ ] **Preloading**: Preload LCP/hero images using the `priority` prop in Next.js `Image`.
- [ ] **Lazy Loading**: Native lazy loading (`loading="lazy"`) for all below-the-fold images.
- [ ] **Placeholders**: Use blur data URLs for perceived performance during load.

## Font Loading
- [ ] **Rendering**: Use `font-display: swap` to prevent FOIT (Flash of Invisible Text).
- [ ] **Preloading**: Preload critical fonts in the document head.
- [ ] **Hosting**: Self-host fonts when possible (avoid FOUT and extra DNS lookups from Google Fonts).
- [ ] **Variants**: Strictly limit font variants to 2-3 weights max.
- [ ] **Next.js Integration**: Use `next/font` for automatic optimization and zero-layout-shift configuration.

## JavaScript Bundle
- [ ] **Code Splitting**: Extensively use dynamic imports for heavy, non-critical components.
- [ ] **Tree Shaking**: Ensure `sideEffects` is correctly configured in `package.json`.
- [ ] **Lazy Loading**: Defer non-critical UI components until they enter the viewport.
- [ ] **Bundle Analysis**: Regularly analyze bundle sizes with `@next/bundle-analyzer`.
- [ ] **Dependency Pruning**: Actively remove unused dependencies.
- [ ] **Barrel Files**: Avoid massive barrel exports (`index.ts` re-exporting everything) that prevent effective tree shaking.

## Rendering Strategy
- [ ] **SSG (Static Site Generation)**: Preferred for static content like marketing pages, docs, and blogs.
- [ ] **SSR (Server-Side Rendering)**: Use for dynamic, highly personalized content.
- [ ] **ISR (Incremental Static Regeneration)**: Ideal for content that changes periodically but doesn't need real-time rendering.
- [ ] **CSR (Client-Side Rendering)**: Reserve for highly interactive, dashboard-style features.
- [ ] **Streaming**: Implement Streaming SSR with Suspense boundaries for heavy, data-dependent pages.

## Caching
- [ ] **Static Assets**: `Cache-Control: public, max-age=31536000, immutable`.
- [ ] **HTML**: `Cache-Control: public, max-age=0, must-revalidate`.
- [ ] **API Responses**: Tailor cache headers based strictly on data freshness requirements.
- [ ] **Revalidation**: Utilize `stale-while-revalidate` where appropriate.
- [ ] **CDN caching**: Leverage Vercel Edge, Cloudflare, or Bunny CDN for edge asset delivery.

## Security Headers (Performance-Relevant)
- [ ] **Redirects**: Minimize unnecessary redirects at the infrastructure level.
- [ ] **HSTS**: Enforce HTTP Strict Transport Security to avoid HTTP → HTTPS redirect overhead.
- [ ] **Preconnect**: Use `<link rel="preconnect">` for required critical cross-origin domains.
- [ ] **DNS Prefetch**: Use `<link rel="dns-prefetch">` for non-critical third-party domains.
