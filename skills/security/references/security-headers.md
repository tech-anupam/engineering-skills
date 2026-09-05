# Security Headers Reference

## Content-Security-Policy (CSP)
- **What it does:** Restricts the resources (scripts, images, styles) that a browser is allowed to load for a given page.
- **Why it matters:** It is the primary defense against Cross-Site Scripting (XSS) and data injection attacks.
- **Recommended Value:** `default-src 'self'; script-src 'self'; object-src 'none';` (Adjust based on third-party requirements).

## Strict-Transport-Security (HSTS)
- **What it does:** Forces the browser to communicate with the server over HTTPS, never via HTTP.
- **Why it matters:** Prevents downgrade attacks and cookie hijacking.
- **Recommended Value:** `max-age=63072000; includeSubDomains; preload`

## X-Content-Type-Options
- **What it does:** Prevents the browser from MIME-sniffing a response away from the declared content-type.
- **Why it matters:** Reduces exposure to drive-by download attacks and sites hosting user uploaded content.
- **Recommended Value:** `nosniff`

## X-Frame-Options
- **What it does:** Indicates whether a browser should be allowed to render a page in a `<frame>`, `<iframe>`, `<embed>` or `<object>`.
- **Why it matters:** Defends against clickjacking attacks.
- **Recommended Value:** `DENY` (or `SAMEORIGIN` if framing yourself).

## X-XSS-Protection
- **What it does:** A legacy header that used to stop pages from loading when they detected reflected cross-site scripting (XSS) attacks.
- **Why it matters:** Modern browsers recommend disabling it as it can create XSS vulnerabilities. CSP is the modern alternative.
- **Recommended Value:** `0`

## Referrer-Policy
- **What it does:** Controls how much referrer information (sent via the `Referer` header) should be included with requests.
- **Why it matters:** Prevents leaking sensitive data in the URL to third-party sites.
- **Recommended Value:** `strict-origin-when-cross-origin`

## Permissions-Policy
- **What it does:** Allows a site to control which features and APIs can be used in the browser.
- **Why it matters:** Limits exposure if a site is compromised (e.g., preventing access to the camera or microphone).
- **Recommended Value:** `camera=(), microphone=(), geolocation=()`

## Cache-Control (For Sensitive Pages)
- **What it does:** Dictates caching policies in both client browsers and intermediate caches.
- **Why it matters:** Prevents sensitive information from being stored in public or local caches.
- **Recommended Value:** `no-store, max-age=0`

## Next.js Configuration Example

In your `next.config.js`:

```javascript
const securityHeaders = [
  {
    key: 'Content-Security-Policy',
    value: "default-src 'self'; script-src 'self';" // Customize as needed
  },
  {
    key: 'Strict-Transport-Security',
    value: 'max-age=63072000; includeSubDomains; preload'
  },
  {
    key: 'X-Content-Type-Options',
    value: 'nosniff'
  },
  {
    key: 'X-Frame-Options',
    value: 'DENY'
  },
  {
    key: 'X-XSS-Protection',
    value: '0'
  },
  {
    key: 'Referrer-Policy',
    value: 'strict-origin-when-cross-origin'
  },
  {
    key: 'Permissions-Policy',
    value: 'camera=(), microphone=(), geolocation=()'
  }
];

module.exports = {
  async headers() {
    return [
      {
        source: '/(.*)',
        headers: securityHeaders,
      },
    ];
  },
};
```

## Vercel-Specific Configuration
When deploying to Vercel, `next.config.js` headers are automatically respected. If you are deploying static sites without Next.js on Vercel, you can define headers in `vercel.json`:

```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        }
      ]
    }
  ]
}
```

## How to Test
- **Security Headers Site:** Visit [securityheaders.com](https://securityheaders.com) and enter your URL.
- **cURL:** Run `curl -I https://yourdomain.com` to view the response headers in your terminal.
