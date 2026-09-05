# Comprehensive SEO & AI Discoverability Checklist

## Traditional SEO
- [ ] **Page titles**: 50-60 characters, keyword-first, unique per page.
- [ ] **Meta descriptions**: 150-160 characters, compelling call-to-action.
- [ ] **Canonical URLs**: Present on every page to prevent duplicate content issues.
- [ ] **Open Graph tags**: `og:title`, `og:description`, `og:image`, `og:url`, `og:type` correctly implemented.
- [ ] **Twitter Card tags**: `twitter:card`, `twitter:title`, `twitter:image`.
- [ ] **robots.txt**: Allow relevant crawlers, block admin/private routes.
- [ ] **XML Sitemap**: Dynamically generated, includes `lastmod` and priority.
- [ ] **Structured data / JSON-LD**: Organization, WebSite, BreadcrumbList, Article, Product, FAQ, LocalBusiness applied as relevant.
- [ ] **Heading hierarchy**: Strictly one `H1` per page, logical nesting (`H2` → `H3` → `H4`).
- [ ] **Image alt text**: Descriptive, keyword-relevant, no keyword stuffing.
- [ ] **Internal linking**: Logical strategy distributing link equity.
- [ ] **URL structure**: Clean, descriptive paths. No query parameters for content pages.
- [ ] **Breadcrumb navigation**: Implemented visually and via schema.
- [ ] **404 page**: Helpful, with clear navigation options.
- [ ] **Redirect strategy**: 301 for permanent moves, strictly avoid redirect chains.

## GEO (Generative Engine Optimization)
- [ ] **Entity disambiguation**: Clear definitions in the first 100 words of every page.
- [ ] **Direct answers**: Concise answer paragraphs directly under each `H2`/`H3`.
- [ ] **Structured data density**: High utilization of schema.org vocabulary.
- [ ] **FAQ sections**: Clear Question & Answer formatting.
- [ ] **Authoritative citations**: Outbound links to high-authority source material.
- [ ] **Author/expertise signals**: Dedicated About page, explicit author bios.
- [ ] **Permissive AI bot crawling**: Explicitly allowed in `robots.txt`:
  - `GPTBot`, `ChatGPT-User`, `OAI-SearchBot`
  - `ClaudeBot`, `Claude-Web`
  - `PerplexityBot`
  - `Google-Extended`
  - `ByteSpider`
  - `CCBot`

## LEO (LLM Engine Optimization)
- [ ] **Semantic HTML**: Strict use of `<article>`, `<section>`, `<nav>`, `<aside>`, `<main>`, `<header>`, `<footer>`.
- [ ] **Content structure**: Well-structured content with clear, descriptive headings.
- [ ] **FAQ Schema**: FAQ sections wrapped using `FAQPage` schema.
- [ ] **Entity definitions**: Clear, early definitions of core concepts.
- [ ] **Table of contents**: Present for long-form pages.
- [ ] **Terminology consistency**: Standardized phrasing throughout the site.

## AI Discoverability
- [ ] **llms.txt**: File located at root serving as a documentation index for AI agents.
- [ ] **Schema.org @id**: Entities use `@id` references for cross-linking.
- [ ] **Structured navigation**: Machine-readable menus.
- [ ] **Machine-readable data**: Pricing, hours, and contact info clearly structured.

## Validation Tools
- [ ] **Google Search Console**: Verify indexing, coverage, and search performance.
- [ ] **Bing Webmaster Tools**: Verify Bing and AI search indexing.
- [ ] **Google Rich Results Test**: Validate structured data syntax.
- [ ] **PageSpeed Insights**: Validate Core Web Vitals in the field.
- [ ] **Ahrefs / Semrush**: Backlink profile and keyword gap analysis.
- [ ] **Schema.org Validator**: JSON-LD semantic validation.
- [ ] **Mobile-Friendly Test**: Verify responsive rendering.
