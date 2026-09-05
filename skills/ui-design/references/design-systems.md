# Design Systems Reference

This reference outlines eight distinct design systems, their visual DNA, and practical implementation details.

## 1. Glassmorphism
**Definition**: A UI style that emulates frosted glass through background blur and semi-transparent layers.
**Visual DNA**: 
- `backdrop-blur` on panels.
- White or light translucent backgrounds (`bg-white/10`).
- Subtle 1px translucent borders (`border-white/20`).
- Vibrant backgrounds behind the glass to emphasize the effect.
**Best Project Types**: Dashboards, dark-themed overlays, analytics tools.
**Implementation Patterns**:
```css
.glass-panel {
  @apply bg-white/10 backdrop-blur-md border border-white/20 shadow-xl rounded-xl;
}
```
**Common Mistakes**: Stacking too many blurred layers, crushing scrolling performance on mobile devices.
**Accessibility**: Text on glass panels often fails contrast checks if the background underneath shifts to a light color.

## 2. Minimalism
**Definition**: Stripping the UI down to its absolute bare essentials.
**Visual DNA**:
- Extreme whitespace (macro and micro).
- Monochromatic or highly restricted color palettes (max 1 accent color).
- Strong, deliberate typography scale.
- No unnecessary borders or shadows.
**Best Project Types**: Portfolios, text-heavy blogs, documentation.
**Implementation Patterns**:
```css
.minimal-container {
  @apply max-w-2xl mx-auto px-4 py-24 text-gray-900 bg-white;
}
```
**Common Mistakes**: Confusing "minimalism" with "emptiness". It requires rigorous alignment and grid systems to work.
**Accessibility**: Usually excellent, provided the minimal color choices maintain high contrast.

## 3. Neumorphism
**Definition**: A soft, extruded plastic look where components appear pushed out of or dented into the background.
**Visual DNA**:
- The background color and the component color must be identical.
- Dual shadows: one light, one dark, combining to create the extrusion effect.
- Soft, large border radiuses.
**Best Project Types**: Calculator UIs, single-purpose utilities, hardware-control dashboards.
**Implementation Patterns**:
```css
.neu-button {
  @apply bg-gray-200 rounded-2xl shadow-[8px_8px_16px_#b3b3b3,-8px_-8px_16px_#ffffff];
}
```
**Common Mistakes**: Using it for complex, data-heavy layouts. It consumes massive amounts of screen real estate.
**Accessibility**: Terrible by default. State changes (hover/active) are often purely shadow-based, failing WCAG requirements.

## 4. Skeuomorphism
**Definition**: Designing interfaces to mimic real-world textures, materials, and physics.
**Visual UI DNA**:
- Photorealistic textures (leather, brushed aluminum).
- Directional lighting and bevels.
- Real-world interaction models (knobs, switches).
**Best Project Types**: Audio plugins (VSTs), niche hardware control apps, specific note-taking tools.
**Implementation Patterns**: Requires heavy use of background images, box-shadow stacking, and intricate CSS gradients mimicking light reflection.
**Common Mistakes**: Going halfway. Skeuomorphism requires absolute commitment to the metaphor to not look cheap.

## 5. Claymorphism
**Definition**: A friendly, tactile 3D style resembling soft clay.
**Visual DNA**:
- Light, pastel background colors.
- Large border radii.
- Inner shadows combined with drop shadows.
- Exaggerated, soft, colorful shadows.
**Best Project Types**: Children's educational apps, playful creative tools, casual games.
**Implementation Patterns**:
```css
.clay-card {
  @apply bg-blue-100 rounded-[32px] shadow-[8px_8px_16px_#93c5fd,inset_-4px_-4px_8px_#60a5fa,inset_4px_4px_8px_#ffffff];
}
```
**Common Mistakes**: Clashing it with serious, corporate typography or dense data tables.

## 6. Aurora UI
**Definition**: Fluid, organic, multi-colored gradient meshes that feel like the Northern Lights.
**Visual DNA**:
- Soft, blurred, overlapping color blobs.
- Subtle animations of the background mesh.
- Clean, high-contrast foreground elements (often glassmorphic).
**Best Project Types**: Web3 landing pages, music streaming apps, creative portfolios.
**Implementation Patterns**: Use pseudo-elements with massive blurs, or CSS `radial-gradient`.
```css
.aurora-bg {
  background: radial-gradient(circle at 0% 0%, #ff00ff 0%, transparent 50%),
              radial-gradient(circle at 100% 100%, #00ffff 0%, transparent 50%);
  filter: blur(60px);
}
```
**Common Mistakes**: Making it too bright or busy, distracting from the content.

## 7. Brutalism
**Definition**: Raw, unstyled, intentionally jarring design that rejects traditional aesthetic conventions.
**Visual DNA**:
- Default browser styling (blue links, times new roman).
- High contrast, often clashing colors (e.g., pure red on pure green).
- Visible grid lines, raw HTML table aesthetics.
- Huge, overlapping typography.
**Best Project Types**: Art portfolios, underground music labels, temporary event sites.
**Implementation Patterns**:
```css
.brutal-box {
  @apply border-4 border-black bg-yellow-400 text-black font-mono uppercase shadow-[8px_8px_0px_0px_rgba(0,0,0,1)];
}
```
**Common Mistakes**: Making it actually unusable. Good brutalism is aesthetically rough but still functionally sound.

## 8. Material 3 / Material You
**Definition**: Google's latest iteration of its design language, focused on user-generated, dynamic color palettes.
**Visual DNA**:
- Pill-shaped buttons.
- Dynamic color extraction (tonal palettes).
- Prominent floating action buttons.
- Strict elevation and depth systems.
**Best Project Types**: PWA, Android-first web apps, enterprise tooling.
**Implementation Patterns**: Rely on a robust CSS variable system representing the 0-100 tonal range of a seed color.
**Common Mistakes**: Trying to manually fake the complex color generation algorithms instead of using a library.

## Comparison Matrix

| System | Best Vibe | Dev Complexity | A11y Rating |
|---|---|---|---|
| Glassmorphism | Tech, Sleek | Medium | Low |
| Minimalism | Clean, Professional | Low | High |
| Neumorphism | Physical, Gadget | High | Very Low |
| Skeuomorphism | Realistic, Niche | Very High | Medium |
| Claymorphism | Fun, Approachable | Medium | Medium |
| Aurora UI | Modern, Creative | Medium | Medium |
| Brutalism | Edgy, Raw | Low | Low |
| Material 3 | Native, App-like | High | High |

## Combining Systems
- **Glassmorphism + Aurora**: The quintessential modern creative stack. Use Aurora for the background mesh, and Glassmorphism for the foreground panels containing text.
- **Minimalism + Brutalism (Neo-Brutalism)**: Clean whitespace and stark typography, but utilizing hard black shadows, bold borders, and primary colors.
