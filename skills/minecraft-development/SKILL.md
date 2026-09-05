---
name: minecraft-development
description: Minecraft mod and plugin development preferences using Java with CLI-based build tools. Activate when building Minecraft mods, plugins, or server-side extensions. Uses Java with Maven or Gradle from the command line — no IDE dependency on Android Studio or IntelliJ.
---

## When to Activate
- Building Minecraft mods.
- Developing server plugins (Bukkit/Spigot/Paper).
- Setting up server-side extensions.

## Instructions
- Language: Java
- Build tools: Maven or Gradle — installed and used from the CLI
- Before starting:
  1. Verify Java JDK is installed (JDK 17+ for modern MC versions)
  2. Verify Maven or Gradle CLI is installed
  3. Determine the target platform: Bukkit/Spigot/Paper (server plugins) vs Forge/Fabric/NeoForge (mods)
  4. Determine target Minecraft version
  5. Set up the project skeleton with the appropriate build tool
- For server plugins (Bukkit/Spigot/Paper):
  - Use Maven or Gradle with the appropriate API dependency
  - `plugin.yml` is required for Bukkit/Spigot, `paper-plugin.yml` for Paper
  - Build produces a JAR that goes into the server's `plugins/` directory
- For mods (Forge/Fabric/NeoForge):
  - Use Gradle with the mod loader's MDK/template
  - Follow the mod loader's project structure
  - Build produces a JAR that goes into the `mods/` directory

## Preferences
- Hard rule: Do NOT use or depend on Android Studio or IntelliJ IDEA. Install CLI tools directly (maven, gradle).
- The project must build from the command line.
- No comments in generated code.
- No AI-slopped code structure.

## Anti-Patterns
- Requiring IntelliJ or Android Studio to build.
- Mixing Bukkit and Forge APIs.
- Not specifying the target Minecraft version.
- Building without testing on a local server.

## Lessons Learned
- TODO: Add personal context

## Exceptions
- If the user explicitly prefers an IDE, respect that. But the project must still be buildable from CLI.

## Validation
- Build runs successfully from CLI using Maven or Gradle.
- Generated JAR runs on the target local server or client without missing dependencies.
