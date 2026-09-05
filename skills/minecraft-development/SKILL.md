---
name: minecraft-development
description: Minecraft mod and plugin development using Java with CLI-based build tools (Maven/Gradle). Activate when building Minecraft mods, server plugins, or extensions. No IDE dependency - everything builds from command line. Covers Bukkit, Spigot, Paper, Forge, Fabric, and NeoForge.
---

### When to Activate
- Building Minecraft server plugins (Bukkit/Spigot/Paper)
- Building Minecraft mods (Forge/Fabric/NeoForge)
- Setting up a Minecraft development environment
- Debugging plugin/mod issues

### Hard Rules
- Language: Java
- Build tools: Maven or Gradle from the CLI
- Do NOT require IntelliJ IDEA or Android Studio. Projects must build from the command line.
- If the user prefers an IDE, that's fine, but CLI-buildable is mandatory.

### Before Starting
1. Determine target platform: server plugin or client mod?
2. Determine target Minecraft version (this affects Java version, API version, everything)
3. Verify Java JDK is installed (run verify-minecraft-env.ps1)
4. Verify build tool is installed (Maven or Gradle)
5. Set up project skeleton

### Server Plugins (Bukkit/Spigot/Paper)

**When to use each:**
- **Bukkit** - legacy API, rarely used for new plugins
- **Spigot** - extends Bukkit, most compatible, largest plugin ecosystem
- **Paper** - extends Spigot, better performance, modern API additions, preferred for new plugins

**Project setup:**
- Maven or Gradle with the server API as a dependency
- plugin.yml (Bukkit/Spigot) or paper-plugin.yml (Paper) in src/main/resources
- Main class extends JavaPlugin
- Build produces a JAR -> copy to server's plugins/ directory
- Test on a local server instance

**Key APIs:**
- Events (PlayerJoinEvent, BlockBreakEvent, etc.)
- Commands (onCommand or Brigadier on Paper)
- Schedulers (BukkitRunnable for async tasks)
- Config (FileConfiguration for YAML configs)
- Persistence (SQLite/MySQL via JDBC, or config files)

### Client Mods (Forge/Fabric/NeoForge)

**When to use each:**
- **Fabric** - lightweight, fast updates, modern tooling, preferred for new mods
- **Forge** - mature ecosystem, most existing mods, slower updates
- **NeoForge** - Forge successor/fork, newer, community-driven

**Project setup:**
- Download MDK/template from the mod loader's site
- Uses Gradle with the mod loader's Gradle plugin
- Build with ./gradlew build (uses wrapper, no global Gradle needed)
- Build produces a JAR -> copy to mods/ directory
- Test with the mod loader's dev client

### Java Version Matrix
| Minecraft Version | Minimum JDK | Recommended JDK |
|---|---|---|
| 1.16.x and below | JDK 8 | JDK 8 |
| 1.17.x | JDK 16 | JDK 17 |
| 1.18.x - 1.20.4 | JDK 17 | JDK 17 |
| 1.20.5+ | JDK 21 | JDK 21 |

### Anti-Patterns
- Requiring IntelliJ or Android Studio to build
- Mixing Bukkit/Spigot APIs with Forge/Fabric APIs
- Not specifying target Minecraft version before starting
- Not testing on a local server/client
- Running heavy computation on the main server thread (causes lag)
- Not handling plugin enable/disable lifecycle properly
- Hardcoding values that should be in config files

### Lessons Learned
- Shipped G1axCrystalOptimizer with 75K+ downloads on Modrinth
- Performance mods need careful profiling - what seems fast in dev can lag with 100 players
- Always test with a clean server/client (no other plugins/mods) first, then with common mod packs

### Validation
- Project builds from CLI: `mvn package` or `./gradlew build`
- JAR loads on target server/client without errors
- Plugin/mod commands and events work as expected
- No main thread blocking (check TPS with /tps command for servers)
- Refer to [toolchain-setup.md](./references/toolchain-setup.md) for environment setup
