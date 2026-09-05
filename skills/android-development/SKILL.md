---
name: android-development
description: Android development preferences using Kotlin with CLI-based tooling, voice/speech integration, and environment validation. Activate when building Android apps, configuring Android projects, adding voice features (TTS/STT), or setting up Android development environments. Covers Kotlin, Gradle, Google VoiceKit, ML Kit, and speech APIs.
---

## When to Activate
- Bootstrapping new Android applications.
- Troubleshooting Android build configurations or dependency issues.
- Integrating native voice capabilities (TTS/STT) into Android apps.
- Validating and configuring local Android development environments.

## Instructions

### Language & Tooling
- **Language**: Kotlin is the absolute standard. Do not write new Java code. Utilize Coroutines and Flow heavily.
- **Build System**: Gradle is mandatory. Always use the Gradle Wrapper (`gradlew`). Never rely on globally installed Gradle versions.
- **Targeting**: Aggressively target the latest SDK (e.g., API 34+). Keep min SDK reasonable (e.g., API 24/26) based on strict analytics, but don't hold back architectural decisions for ancient devices unless explicitly required.

### Environment Validation (CRITICAL)
Before writing *any* Android code, rigidly verify the environment:
1. Java JDK is installed and matches the Gradle requirement (often JDK 17 for newer Gradle).
2. The Gradle Wrapper (`gradlew.bat` or `./gradlew`) is present and executable.
3. Android SDK is installed and `ANDROID_HOME` (or `ANDROID_SDK_ROOT`) is correctly set in the environment.
4. Execute `./gradlew tasks` to ensure the project parses correctly.
5. Do NOT assume the project is ready just because files exist. Verify the build first.

## Voice & Speech on Android

### On-Device Capabilities
- **Android TextToSpeech API**: The built-in standard. Requires no external dependencies and supports multiple TTS engines installed on the device. Great for basic voice feedback, completely offline.
- **Android SpeechRecognizer**: Built-in STT. Works offline on modern devices with downloaded language packs. Essential for zero-cost, privacy-first transcription.
- **Google ML Kit**: Use for lightweight, on-device ML tasks like text recognition (OCR), translation, and smart reply. Completely offline and highly optimized.
- **MediaPipe**: Powerful for on-device audio classification and voice activity detection (VAD).

### Cloud Capabilities
- **Google Cloud Speech-to-Text**: Server-side, offering higher accuracy and robust streaming support for long-form dictation.
- **Google Cloud Text-to-Speech**: Server-side, providing high-quality neural voices (WaveNet). Use when the built-in TTS sounds too robotic.

## Architecture Patterns
- **MVVM**: Model-View-ViewModel is the standard. State flows down, events flow up.
- **State Management**: Expose UI state using `StateFlow` in ViewModels. Collect safely in the UI (e.g., `collectAsStateWithLifecycle` in Compose).
- **Data Layer**: Enforce a strict Repository pattern to abstract network and local database (Room) sources.
- **Dependency Injection**: Use Hilt. It's the most robust and standard DI framework for Android.
- **Concurrency**: Use Coroutines. Never block the main thread.
- **Voice Pipeline Rule**: Voice processing (STT/TTS initialization, file saving, API calls) must *always* execute on background dispatchers (`Dispatchers.IO`).

## Preferences
- Use Jetpack Compose for all new UI. XML layouts are legacy.
- Manage dependencies using Gradle Version Catalogs (`libs.versions.toml`).
- Keep ViewModels absolutely free of Android framework dependencies (no `Context`, no `View`).

## Anti-Patterns
- Writing code without first verifying the Gradle build environment works locally.
- Assuming Gradle plugins or versions will "just work" without explicit version management and compatibility checks.
- Ignoring dependency conflicts; resolve them explicitly in Gradle.
- Running heavy operations (like TTS synthesis or STT model loading) on the main UI thread.
- Forgetting to aggressively request and handle runtime permissions (specifically `RECORD_AUDIO` for voice features).

## Lessons Learned
- TODO: Add personal context regarding Gradle caching nightmares.
- TODO: Add personal context regarding device-specific OEM quirks with the built-in `SpeechRecognizer`.
- Microphone permissions require delicate UX. Always explain *why* the app needs the mic before requesting the system permission.

## Exceptions
- Quick prototyping scripts may bypass strict MVVM or DI rules, but must still compile cleanly via Gradle.
- If integrating with legacy C++ audio processing, NDK build constraints supersede some standard Kotlin rules.

## Validation
- The project successfully builds from the command line: `./gradlew assembleDebug`.
- The resulting APK installs and launches successfully on an emulator or physical device.
- Voice features activate correctly only after runtime permissions are explicitly granted by the user.
