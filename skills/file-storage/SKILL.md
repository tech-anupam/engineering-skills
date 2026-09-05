---
name: file-storage
description: File upload and storage preferences using UploadThing and CDN image delivery. Activate when implementing file uploads, image uploads, document storage, user-generated content, or any file handling in web applications.
---

# File Storage

## When to Activate
- Implementing file uploads (images, documents, media)
- Handling user-generated content
- Setting up an image pipeline for a web app
- Deciding between storage providers

## Default: UploadThing

UploadThing is the default for file uploads in Next.js projects.

**Why UploadThing:**
- Type-safe file routes in Next.js
- Handles upload directly to cloud storage (no server bottleneck)
- Built-in file validation (type, size)
- Simple API, minimal setup
- Free tier is generous for most projects

**Setup pattern:**
1. Define file routes with type and size constraints
2. Create an upload endpoint in your API
3. Use the React components or hooks on the client
4. Files go directly to UploadThing's storage, you get back a URL

## Image Delivery

For serving images to users, never use raw uploaded files directly. Always run through an optimization pipeline:

- **ImageKit.io** - real-time URL-based transformations, automatic format negotiation, responsive delivery
- **Cloudinary** - heavier media processing, also handles video
- **Bunny CDN** - raw speed, simple static delivery at lowest cost

Upload to UploadThing for storage, then serve through ImageKit.io or CDN for delivery.

## When NOT to Use UploadThing

| Situation | Use instead |
|:----------|:------------|
| Already using Supabase for everything | Supabase Storage (keeps ecosystem unified) |
| Already using Firebase | Firebase Storage (same reason) |
| Enterprise/large-scale with S3 requirements | AWS S3 directly |
| Need server-side processing before storage | Custom upload handler |
| Video streaming/transcoding | Cloudinary or Mux |

## Anti-Patterns
- Building custom S3 multipart upload flows when UploadThing handles it
- Storing file blobs in the database
- Serving raw uploaded images without optimization
- Not validating file types on the server (client-side only is bypassable)
- Allowing unlimited file sizes without constraints
- Not cleaning up orphaned uploads

## Lessons Learned
- TODO: Add personal context about file upload issues

## Validation
- File uploads work end-to-end (select -> upload -> get URL -> display)
- File type and size validation works on both client and server
- Images are served through ImageKit.io or CDN, not raw URLs
- Upload errors are handled gracefully with user feedback
