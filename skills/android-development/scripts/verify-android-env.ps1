$errors = @()

$javaVersion = java -version 2>&1
if ($LASTEXITCODE -ne 0) {
    $errors += "Java is not installed or not in PATH"
} else {
    Write-Host "Java: $($javaVersion[0])" -ForegroundColor Green
}

if ($env:ANDROID_HOME) {
    Write-Host "ANDROID_HOME: $env:ANDROID_HOME" -ForegroundColor Green
    if (-not (Test-Path $env:ANDROID_HOME)) {
        $errors += "ANDROID_HOME path does not exist: $env:ANDROID_HOME"
    }
} elseif ($env:ANDROID_SDK_ROOT) {
    Write-Host "ANDROID_SDK_ROOT: $env:ANDROID_SDK_ROOT" -ForegroundColor Green
} else {
    $errors += "Neither ANDROID_HOME nor ANDROID_SDK_ROOT is set"
}

$gradleCheck = gradle --version 2>&1
if ($LASTEXITCODE -ne 0) {
    if (Test-Path "./gradlew.bat") {
        Write-Host "Gradle wrapper found (gradlew.bat)" -ForegroundColor Yellow
    } elseif (Test-Path "./gradlew") {
        Write-Host "Gradle wrapper found (gradlew)" -ForegroundColor Yellow
    } else {
        $errors += "Gradle is not installed and no wrapper found"
    }
} else {
    Write-Host "Gradle: installed" -ForegroundColor Green
}

$adbCheck = adb version 2>&1
if ($LASTEXITCODE -ne 0) {
    $errors += "ADB is not in PATH"
} else {
    Write-Host "ADB: $($adbCheck[0])" -ForegroundColor Green
}

if ($errors.Count -gt 0) {
    Write-Host "`nEnvironment issues found:" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    exit 1
} else {
    Write-Host "`nAndroid development environment is ready." -ForegroundColor Green
}
