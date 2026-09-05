# Provider Decision Matrix

## LLM Providers
| Factor | Groq | Gemini | OpenAI | OpenRouter |
|---|---|---|---|---|
| Speed | Fastest inference (LPU) | Fast | Moderate | Varies |
| Cost | Low (generous free) | Low-Medium | Medium-High | Varies |
| Models | Llama, Mixtral, Gemma | Gemini 1.5/2.0 family | GPT-4o, o1/o3 | All providers |
| Context | Up to 128K | Up to 2M (Gemini 1.5) | Up to 128K | Varies |
| Rate limits | Generous free tier | Generous free | Stricter | Depends |
| Multimodal | Limited | Full (text+image+audio+video) | Good (text+image+audio) | Varies |
| Voice/Audio | No native | Gemini Live, native audio | Realtime API, Whisper, TTS | Varies |
| Best for | Speed-critical, low-latency | Long context, multimodal, voice | Reasoning quality | Flexibility |

## Voice/Speech Providers
| Provider | TTS Quality | STT Quality | Real-time | Cost | Best For |
|---|---|---|---|---|---|
| Google Cloud TTS | High (Neural2, Studio) | Excellent | Yes (streaming) | Low | Production TTS at scale |
| Google Voice Engine | Experimental, very high | — | — | — | Ultra-natural voice |
| Gemini Voice/Live | Good, improving | Good (native audio input) | Yes (bidirectional) | Medium | Multimodal voice apps |
| OpenAI TTS | Very high (6 voices) | — | No | Medium | Simple high-quality TTS |
| OpenAI Whisper | — | Excellent | Yes (API) / No (local) | Low/Free | Transcription, offline STT |
| OpenAI Realtime | Good | Good | Yes (bidirectional) | High | Real-time voice assistants |
| ElevenLabs | Best (voice cloning) | — | Yes | High | Ultra-realistic, cloning |
| Deepgram | — | Excellent | Yes (fastest) | Medium | Real-time transcription |
| Grok (xAI) | Emerging | Emerging | Emerging | TBD | Experimental voice |

## Fallback Chain Patterns

### Pattern 1 — Cost-optimized
For background processing, large-scale data extraction, or budget-constrained features.
```text
Groq (Llama 3.1 70B) → Gemini 1.5 Flash → OpenAI GPT-4o-mini
```

### Pattern 2 — Quality-optimized
For complex coding tasks, intricate reasoning, or critical user-facing logic.
```text
OpenAI GPT-4o → Gemini 1.5 Pro → Groq (Llama 3.1 70B)
```

### Pattern 3 — Speed-optimized
For real-time chat, autocomplete, or rapid agentic loops.
```text
Groq (Llama 3.1 8B) → Gemini 1.5 Flash → OpenAI GPT-4o-mini
```

### Pattern 4 — Voice pipeline
For low-latency conversational agents.
```text
STT: Deepgram (real-time) → Whisper (fallback)
LLM: Groq (speed) → Gemini (fallback)
TTS: OpenAI TTS → Google Cloud TTS (fallback)
```
