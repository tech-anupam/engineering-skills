# Extended Question Bank by Project Type

Use these specific drill-down questions when the user specifies a particular domain in Phase 1 of discovery.

## Web Application
- SPA or multi-page? Server-rendered (SSR) or static (SSG)?
- Need real-time features? (Chat, notifications, live updates, WebSockets)
- Need CMS or content management? (Sanity, Strapi, local Markdown)
- Need e-commerce / payments? (Stripe, LemonSqueezy)
- Need i18n / multi-language support?
- Is SEO important? (Public-facing indexing vs. gated internal tool)
- Expected traffic volume? (Affects edge caching decisions)
- Need PWA features? (Offline support, push notifications, installable)

## Mobile App (Android)
- Native Kotlin, or cross-platform (React Native/Flutter)?
- Offline support needed? (Room DB, Sync workers)
- Push notifications? (FCM)
- Camera/microphone access required?
- Voice/speech features? (TTS, STT, on-device voice commands)
- Google Play Store distribution planned? (Requires strict permission handling)
- Minimum SDK version target?
- Need long-running background services?

## Desktop Software
- Webview acceptable (Electron/Tauri) or need native UI (C#/C++/Swift)?
- Target OS? (Windows only? macOS? Cross-platform?)
- System tray / background process requirements?
- Auto-updates mechanism?
- File system access level? (Sandboxed vs. full access)
- Hardware integration? (USB, Bluetooth, serial ports)

## AI / ML Project
- Which models / providers? (Groq, Gemini, OpenAI, OpenRouter, Anthropic)
- Latency budget? (Real-time critical vs. asynchronous batch processing)
- Cost ceiling per request / per month?
- Need voice/speech capabilities? (TTS, STT, conversational voice assistant)
- Need image/video generation?
- Need RAG / knowledge base context injection?
- Streaming responses needed? (Essential for perceived performance)
- Fallback strategy if primary LLM provider goes down?
- On-device vs. cloud inference? (Privacy constraints)

## Minecraft Mod/Plugin
- Server plugin (Bukkit/Spigot/Paper) or client mod (Forge/Fabric/NeoForge)?
- Target Minecraft version? (Strictly adhere to API changes between versions)
- Server-side only or client-side too?
- Dependencies on other plugins/mods? (Vault, WorldEdit, etc.)
- Need database storage? (SQLite, MySQL, flat config files)
- Need custom networking / packet handling?
- Permission system integration needed?
- Need NMS (Net.Minecraft.Server) / packet-level access?

## Game / Creative Project
- Game engine? (Unity, Godot, Unreal, custom)
- 2D or 3D?
- Art style direction? (Pixel art, low poly, hyper-realistic)
- Multiplayer architecture? (P2P, dedicated server, authoritative server, matchmaking)
- Target platforms? (PC, mobile, console, web)
- Monetization model? (Premium, F2P, IAP)
