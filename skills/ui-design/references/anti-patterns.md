# UI/UX Anti-Patterns

This document outlines the most common, lazy, or actively harmful design decisions. Many of these have been exacerbated by generic AI design tools. Reject these patterns in all projects.

## 1. The "AI Slop" Aesthetic

### The Blue-to-Purple Gradient
**What it looks like**: Every background, button, and text element is splashed with a `#4F46E5` to `#9333EA` gradient.
**Why it's bad**: It visually signals "I clicked generate in an AI tool and shipped it." It lacks brand identity, looks cheap, and is aggressively overused in the current tech ecosystem.
**Alternative**: Pick a single, strong brand color. Use monochromatic shades for depth, or use highly intentional, subtle split-complements. If you need gradients, use mesh gradients (Aurora) with unique color stops (e.g., rust orange to slate blue).

### The Floating Orbs
**What it looks like**: Random blurry glowing circles floating in the background of dark-mode landing pages.
**Why it's bad**: It's decorative noise that adds no value. It distracts from the content and is a hallmark of thoughtless template-driven design.
**Alternative**: Use structural elements for visual interest-grids, typography, micro-interactions, or high-quality product photography.

## 2. Layout Clichés

### The Cookie-Cutter SaaS Landing Page
**What it looks like**: 
1. Centered Hero (H1, p, two buttons)
2. Logo cloud ("Trusted by")
3. 3-Column Feature Grid (Icon, H3, p)
4. Testimonial carousel
5. Big CTA box
**Why it's bad**: Users are blind to this layout. They scroll past it without reading because it looks identical to thousands of other sites.
**Alternative**: Break the grid. Use asymmetric layouts, interactive scroll-driven sections, terminal windows, or direct interactive demos right in the hero section.

### The "Card Grid of Death"
**What it looks like**: A dashboard or page comprised entirely of identically sized white cards on a gray background, regardless of the importance of the content within them.
**Why it's bad**: Destroys visual hierarchy. If everything is in a box, nothing stands out.
**Alternative**: Remove borders and cards where unnecessary. Group content using whitespace, typography scale, and horizontal rules. Reserve cards only for actionable, distinctly separated entities.

## 3. Typography Mistakes

### The "Futuristic" Tech Font
**What it looks like**: Using overly geometric, squared-off, or stencil fonts (e.g., Orbitron, Syncopate) for paragraphs and UI elements.
**Why it's bad**: Extremely poor legibility. It immediately dates the project and feels gimmicky.
**Alternative**: Stick to high-quality grotesques (Inter, Roboto) or geometric sans-serifs (Satoshi, Plus Jakarta Sans). Save display fonts strictly for giant, isolated headers.

### Low Contrast Gray-on-Gray
**What it looks like**: Using `#6B7280` text on a `#F3F4F6` background for "elegance".
**Why it's bad**: It fails WCAG standards and makes your application unusable for users in bright environments or with imperfect vision.
**Alternative**: For secondary text on light backgrounds, never go lighter than `#4B5563` (Tailwind gray-600). Use font weight and size to establish hierarchy, not just color fading.

## 4. Color Palette Failures

### Rainbow Text on Dark Mode
**What it looks like**: Text with `background-clip: text` spanning 4 different neon colors against a `#000000` background.
**Why it's bad**: Unreadable. The contrast shifts drastically across the word, breaking eye tracking.
**Alternative**: Use a solid, bright accent color for text, or restrict gradients to very subtle, related color stops (e.g., pure white to light silver).

### Using "Status Colors" for Branding
**What it looks like**: Using standard pure Red, Green, or Yellow as primary brand colors for navigation or headers.
**Why it's bad**: These colors have deeply ingrained psychological associations (Danger, Success, Warning). Overusing them confuses the user about the state of the system.
**Alternative**: Shift the hue or saturation. Instead of `#FF0000` (Error Red), use a burnt orange or a deep maroon if it must be the brand color. Always reserve distinct semantic colors for alerts and validation.
