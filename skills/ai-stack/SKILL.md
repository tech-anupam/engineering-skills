---
name: ai-stack
description: AI model provider preferences, fallback chain strategy, and voice/speech AI capabilities. Activate when building AI-powered features, choosing model providers, implementing LLM integrations, setting up inference pipelines, adding voice/TTS/STT features, or building AI automations. Covers Groq, Gemini, OpenAI, OpenRouter, Google Voice Engine, Gemini Voice, Grok voice, and speech-to-text/text-to-speech pipelines.
---

## When to Activate
- Choosing LLM providers for new or existing features.
- Designing high-availability fallback chains for AI integrations.
- Adding voice capabilities (TTS, STT, Real-time voice) to applications.
- Automating voice-controlled workflows or phone integrations.

## LLM Provider Strategy

### Primary Providers
1. **Groq**: Unmatched inference speed (LPUs). First choice for speed-critical, real-time, or low-latency applications (e.g., synchronous voice pipelines, rapid RAG retrieval). Best models are Llama 3.1 and Mixtral. Generous free tier but strict rate limits on RPM.
2. **Gemini**: The undisputed king of long context (up to 2M tokens) and multimodal capabilities. Best for analyzing entire codebases, massive documents, or raw audio/video. Generous free tier. Excellent for complex reasoning over massive context.
3. **OpenAI**: The gold standard for complex reasoning (GPT-4o, o1, o3). Expensive but reliable. Use for the hardest logical tasks or when you need robust tool calling capabilities.
4. **OpenRouter**: The ultimate fallback and multiplexer. Gives access to everything. Best used as a routing layer to avoid lock-in, though adds a slight latency penalty.

### Fallback Chain Architecture
Never rely on a single provider in production. Outages happen. Rate limits are real. Implement a resilient fallback chain with automatic retry logic.
- **Circuit Breakers**: Trip the circuit if a provider fails 3 times in a row. Switch to fallback immediately for subsequent requests.
- **Retry Logic**: Implement exponential backoff for 429 (Rate Limit) errors. Do not retry blindly on 400 (Bad Request).
- **Decision Tree**:
  - Task is speed critical? -> Groq (Llama) -> OpenRouter (Llama) -> Gemini Flash
  - Task requires deep reasoning? -> OpenAI GPT-4o -> Gemini Pro
  - Task requires massive context? -> Gemini Pro -> Gemini Flash

## Voice & Speech AI

### Text-to-Speech (TTS)
- **Google Cloud TTS / Voice Engine**: Rock solid for production at scale. Neural2 and Studio voices offer high quality at reasonable costs. My go-to for standard app TTS.
- **OpenAI TTS**: Six distinct voices (alloy, echo, fable, onyx, nova, shimmer). Excellent natural prosody out of the box. Use when you need immediate high-quality voice without extensive tuning.
- **Gemini Voice**: Native multimodal voice built into Gemini models. Best when generating speech directly from an LLM prompt without an intermediate text step.
- **ElevenLabs**: Unmatched for ultra-realistic voice cloning and emotional delivery. Very expensive. Use only when the voice quality is the primary value proposition.
- **Grok Voice**: Emerging capabilities. Keep an eye on xAI's offerings for future integrations.

### Speech-to-Text (STT)
- **Deepgram**: The king of real-time transcription. Sub-second latency. Use for live voice assistants or real-time captioning.
- **OpenAI Whisper**: Excellent accuracy. Run locally (free) for batch processing or offline apps. Use the API for easy integration when latency isn't the primary concern.
- **Google Cloud STT**: Enterprise-grade, highly customizable vocabularies. Use when you need specific domain terminology (e.g., medical or legal).
- **Gemini Audio Input**: Feed audio directly into the LLM context. Skips the traditional STT-to-text pipeline entirely, preserving tone and emotion.

### Voice AI Automations
- **Real-time Assistants**: Use Gemini Live API or OpenAI Realtime API for bidirectional, conversational agents. These handle turn-taking and interruptions natively.
- **Voice-to-Action Pipelines**:
  - `STT (Deepgram) -> LLM (Groq for speed) -> Tool Call/Action -> TTS (OpenAI)`
  - Minimize latency at every step. Target < 800ms end-to-end.

## Preferences
- Use streaming interfaces for all LLM and TTS outputs whenever possible. Time-To-First-Byte (TTFB) matters more than total completion time for perceived latency.
- Always implement timeouts. A stalled API call should fail fast and trigger the fallback.

## Anti-Patterns
- Hardcoding a single LLM provider with no fallback mechanism.
- Defaulting to the most expensive model (e.g., GPT-4o) for simple classification or routing tasks. Use smaller, faster models (Llama 8B, Gemini Flash).
- Ignoring API rate limits and failing to implement backoff/retry queues.
- Using synchronous, blocking LLM calls for real-time voice applications. Always stream.
- Piping raw, un-sanitized user audio directly to an unconstrained LLM without safety checks.
- Failing to handle network failures gracefully in STT/TTS pipelines.

## Lessons Learned
- TODO: Add personal context regarding specific production outages caused by provider lock-in.
- TODO: Add personal context regarding cost overruns from using premium models for trivial tasks.
- Voice applications live or die by latency. A 2-second delay feels like an eternity in a conversation. Optimize the STT -> LLM -> TTS pipeline relentlessly.

## Exceptions
- Internal admin tools or one-off scripts do not need complex fallback chains. Simple OpenAI or Gemini calls are fine.
- Offline environments require local Whisper and on-device TTS. Cloud APIs are strictly for connected apps.

## Validation
- Simulate network failures and verify the fallback chain activates seamlessly.
- Measure end-to-end latency for voice pipelines; it must consistently remain under 500-800ms.
- Listen to TTS outputs across edge cases (acronyms, numbers, non-standard text) to ensure natural pronunciation.
