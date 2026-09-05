---
name: file-storage
description: File upload and storage preferences using UploadThing. Activate when implementing file uploads, image uploads, document storage, or any user-generated file handling.
---

# file-storage

## When to Activate
- When implementing file uploads
- When handling image uploads
- When managing document storage
- When handling any user-generated file

## Preferences
- Preferred solution: UploadThing for anonymous file uploads and storage
- UploadThing integrates well with Next.js and provides type-safe file routes

## Anti-Patterns
- Don't build custom S3 upload flows when UploadThing handles the use case
- Don't store files in the database

## Lessons Learned
- TODO: Add personal context

## Exceptions
- When using Supabase Storage (already in Supabase ecosystem)
- When using Firebase Storage (already in Firebase ecosystem)
- When S3 direct access is required for large-scale/enterprise needs

## Validation
- Ensure file uploads are routed through UploadThing or a justified alternative
- Verify type safety in file routes when using Next.js
