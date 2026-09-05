Toolchain setup guide (CLI-only, no IDE):

Java JDK:
- MC 1.17+: JDK 17+
- MC 1.20.5+: JDK 21+
- Install via: Adoptium (Temurin), Oracle JDK, or Amazon Corretto
- Verify: `java -version` and `javac -version`

Maven:
- Install via: winget, scoop, chocolatey, or manual download from maven.apache.org
- Verify: `mvn -version`
- Typical for: Bukkit/Spigot/Paper plugins

Gradle:
- Install via: winget, scoop, chocolatey, or SDKMAN
- Verify: `gradle --version`
- Typical for: Forge/Fabric/NeoForge mods (uses Gradle wrapper from MDK)
- Most mod loaders provide a Gradle wrapper (gradlew) — use it

Project templates:
- Spigot plugin: `mvn archetype:generate` with spigot archetype or manual pom.xml
- Paper plugin: Similar to Spigot, use Paper API dependency
- Fabric mod: Use `fabricmc.net/develop/` template generator, download and build with `./gradlew build`
- Forge mod: Download MDK from Forge site, extract, build with `./gradlew build`
- NeoForge: Download MDK from NeoForge, extract, build with `./gradlew build`

Testing:
- Run a local server with the built JAR
- For plugins: copy JAR to server plugins/ and restart
- For mods: copy JAR to mods/ and launch with mod loader
