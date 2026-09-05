$errors = @()

$javaVersion = java -version 2>&1
if ($LASTEXITCODE -ne 0) {
    $errors += "Java JDK is not installed or not in PATH"
} else {
    Write-Host "Java: $($javaVersion[0])" -ForegroundColor Green
}

$javacCheck = javac -version 2>&1
if ($LASTEXITCODE -ne 0) {
    $errors += "javac not found - JRE may be installed but not JDK"
} else {
    Write-Host "javac: $($javacCheck)" -ForegroundColor Green
}

$mvnCheck = mvn -version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Maven: not installed" -ForegroundColor Yellow
} else {
    Write-Host "Maven: installed" -ForegroundColor Green
}

$gradleCheck = gradle --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Gradle: not installed (wrapper may still work)" -ForegroundColor Yellow
} else {
    Write-Host "Gradle: installed" -ForegroundColor Green
}

$gitCheck = git --version 2>&1
if ($LASTEXITCODE -ne 0) {
    $errors += "Git is not installed"
} else {
    Write-Host "Git: $($gitCheck)" -ForegroundColor Green
}

if ($errors.Count -gt 0) {
    Write-Host "`nEnvironment issues found:" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    exit 1
} else {
    Write-Host "`nMinecraft development environment is ready." -ForegroundColor Green
    if (-not (Get-Command "mvn" -ErrorAction SilentlyContinue) -and -not (Get-Command "gradle" -ErrorAction SilentlyContinue)) {
        Write-Host "Note: Neither Maven nor Gradle is globally installed. You will need a Gradle wrapper or to install one." -ForegroundColor Yellow
    }
}
