### Java JDK Installation

**Recommended distributions:**
| Distribution | Platform | Install method |
|---|---|---|
| Eclipse Temurin (Adoptium) | All | winget: `winget install EclipseAdoptium.Temurin.21.JDK` |
| Amazon Corretto | All | winget: `winget install Amazon.Corretto.21.JDK` |
| Oracle JDK | All | Manual download from oracle.com |
| Microsoft OpenJDK | Windows | winget: `winget install Microsoft.OpenJDK.21` |

**Verify installation:**
```
java -version
javac -version
```

**Managing multiple Java versions:**
On Windows, use environment variables or tools like jenv. Set JAVA_HOME to the target JDK path.

### Maven Installation

**Install methods:**
- winget: `winget install Apache.Maven`
- scoop: `scoop install maven`
- chocolatey: `choco install maven`
- Manual: download from maven.apache.org, add bin/ to PATH

**Verify:** `mvn -version`

**Typical use for Minecraft:**
- Server plugins (Bukkit/Spigot/Paper)
- pom.xml defines dependencies (Spigot API, Paper API)
- Build: `mvn clean package`
- Output: target/plugin-name.jar

### Gradle Installation

**Install methods:**
- winget: `winget install Gradle.Gradle`
- scoop: `scoop install gradle`
- SDKMAN: `sdk install gradle`

**Verify:** `gradle --version`

**Typical use for Minecraft:**
- Client mods (Forge/Fabric/NeoForge)
- Most mod loaders provide a Gradle wrapper (gradlew/gradlew.bat) - use it instead of global Gradle
- Build: `./gradlew build`
- Output: build/libs/mod-name.jar

### Project Templates

**Paper plugin (Maven):**
1. Create pom.xml with Paper API dependency from papermc.io
2. Create src/main/java/com/yourname/pluginname/PluginMain.java
3. Create src/main/resources/paper-plugin.yml
4. Build: `mvn clean package`
5. Copy JAR to server plugins/ directory

**Fabric mod:**
1. Go to fabricmc.net/develop/template
2. Generate project template
3. Extract and build: `./gradlew build`
4. Copy JAR from build/libs to mods/ directory

**Forge mod:**
1. Download MDK from files.minecraftforge.net
2. Extract and build: `./gradlew build`
3. Copy JAR from build/libs to mods/ directory

**NeoForge mod:**
1. Download MDK from neoforged.net
2. Extract and build: `./gradlew build`
3. Same output structure as Forge

### Local Testing

**Server plugin testing:**
1. Download Paper server JAR from papermc.io
2. Create a test directory: `mkdir test-server && cd test-server`
3. Run: `java -jar paper.jar --nogui`
4. Accept EULA in eula.txt
5. Copy your plugin JAR to plugins/
6. Restart server
7. Check console for errors, test commands in-game

**Mod testing:**
- Use the mod loader's dev client: `./gradlew runClient`
- Or build and copy to a test .minecraft/mods directory

### Publishing
| Platform | For | URL |
|---|---|---|
| Modrinth | Mods + Plugins | modrinth.com |
| CurseForge | Mods + Plugins | curseforge.com |
| SpigotMC | Server Plugins | spigotmc.org |
| Hangar (PaperMC) | Paper Plugins | hangar.papermc.io |
| GitHub Releases | Everything | github.com |
