# Image Delivery & Optimization

Modern web apps must never serve raw, unoptimized images directly from a repository or basic file server. This reference outlines the pipeline, strategies, and provider choices for high-performance image delivery.

## The Image Pipeline
Every image in the application must pass through this conceptual pipeline:
1. **Source**: High-res original (uploaded by user or stored in cloud bucket).
2. **Transform**: Resize, crop, adjust quality on the fly via URL parameters.
3. **Format Negotiation**: Automatically serve AVIF or WebP based on the requesting browser's `Accept` headers.
4. **Deliver & Cache**: Serve from a CDN edge node closest to the user.

## Provider Matrix

| Provider | Best For | Core Feature |
|---|---|---|
| **ImageKit.io** | Dynamic transformations, real-time resizing | URL-based API, excellent Next.js/React SDKs |
| **Cloudinary** | Heavy media apps, complex video processing | Powerful AI transformations, asset management |
| **Bunny CDN** | Raw speed, static assets, budget | Low cost edge-caching, simple pull zones |
| **Next.js (Vercel)** | Simple setups, mostly static sites | Zero-config, built into the framework |

## ImageKit.io Integration Patterns

ImageKit is the preferred default for dynamic image transformation.

### URL-Based Transformations
Images are transformed purely by manipulating the URL string.
```text
https://ik.imagekit.io/your_endpoint/default-image.jpg?tr=w-400,h-300,q-80
```
- `w-400,h-300`: Resize and crop to 400x300.
- `q-80`: Set quality to 80%.
- Automatic format conversion is usually enabled by default on the dashboard.

### Next.js Custom Loader
When using Next.js `next/image`, avoid Vercel's built-in optimizer for heavy dynamic workloads to save costs. Hook ImageKit into a custom loader:

```javascript
// lib/imagekitLoader.js
export default function imageKitLoader({ src, width, quality }) {
  if (src[0] === "/") src = src.slice(1);
  const params = [`w-${width}`];
  if (quality) {
    params.push(`q-${quality}`);
  }
  const paramsString = params.join(",");
  
  let urlEndpoint = process.env.NEXT_PUBLIC_IMAGEKIT_URL;
  if(urlEndpoint[urlEndpoint.length-1] === "/") urlEndpoint = urlEndpoint.substring(0, urlEndpoint.length - 1);
  
  return `${urlEndpoint}/${src}?tr=${paramsString}`;
}
```

```jsx
// components/OptimizedImage.jsx
import Image from 'next/image';
import imageKitLoader from '../lib/imagekitLoader';

export const OptimizedImage = (props) => {
  return <Image loader={imageKitLoader} {...props} />;
};
```

## Core Optimization Strategies

### 1. Responsive Images (Art Direction vs. Resolution)
- Provide multiple sizes using `srcset` (or let `next/image` handle it).
- Define accurate `sizes` attributes so the browser knows how much layout space the image will take before it downloads.
```html
<img src="small.jpg" 
     srcset="small.jpg 300w, medium.jpg 768w, large.jpg 1200w" 
     sizes="(max-width: 768px) 100vw, 50vw" 
     alt="Example" />
```

### 2. Format Prioritization
Your delivery network should handle this transparently, but the priority stack is:
1. **AVIF**: Best compression, slow encode, fast decode. Use for static assets.
2. **WebP**: Excellent compression, fast encode. Great default for dynamic content.
3. **JPEG/PNG**: Fallbacks only for legacy browsers.

### 3. LCP (Largest Contentful Paint) Optimization
- The hero image (or any image immediately visible above the fold) is usually your LCP element.
- **Never lazy-load the LCP image.** Set `loading="eager"` or `priority={true}` in Next.js.
- **Preload it** in the document head:
```html
<link rel="preload" as="image" href="hero-image.jpg" />
```

### 4. Lazy Loading
- All images below the fold must use `loading="lazy"`.
- Use a blur-up placeholder or a solid skeleton UI while loading to prevent layout shifts (CLS).
