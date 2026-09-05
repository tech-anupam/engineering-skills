param (
    [string]$SourcePath = "."
)

$ErrorActionPreference = "Continue"
$totalIssues = 0

Write-Host "Starting Security Audit..." -ForegroundColor Cyan

$envFiles = git ls-files | Select-String "\.env"
if ($envFiles) {
    Write-Host "FAILED: .env files found in git tracking!" -ForegroundColor Red
    $envFiles | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
    $totalIssues++
} else {
    Write-Host "PASS: No tracked .env files found." -ForegroundColor Green
}

try {
    $auditResult = npm audit --json | ConvertFrom-Json
    $vulns = $auditResult.metadata.vulnerabilities
    if ($vulns.high -gt 0 -or $vulns.critical -gt 0) {
        Write-Host "FAILED: High/Critical vulnerabilities found!" -ForegroundColor Red
        Write-Host "  High: $($vulns.high)" -ForegroundColor Red
        Write-Host "  Critical: $($vulns.critical)" -ForegroundColor Red
        $totalIssues++
    } else {
        Write-Host "PASS: No high/critical vulnerabilities found." -ForegroundColor Green
    }
} catch {
    Write-Host "WARNING: Failed to run npm audit." -ForegroundColor Yellow
    $totalIssues++
}

$secretPatterns = @("api[_-]?key", "secret", "password", "token", "sk_test_", "pk_test_", "sk_live_", "pk_live_")
$patternRegex = ($secretPatterns -join "|")

$matchedFiles = Select-String -Path "$SourcePath\*" -Include "*.js", "*.ts", "*.jsx", "*.tsx" -Pattern $patternRegex -List
if ($matchedFiles) {
    Write-Host "WARNING: Potential hardcoded secrets found:" -ForegroundColor Yellow
    $matchedFiles | ForEach-Object { Write-Host "  $($_.Path)" -ForegroundColor Yellow }
    $totalIssues++
} else {
    Write-Host "PASS: No apparent hardcoded secrets found." -ForegroundColor Green
}

$packageJsonPath = Join-Path $SourcePath "package.json"
if (Test-Path $packageJsonPath) {
    $packageJson = Get-Content $packageJsonPath | ConvertFrom-Json
    if ($packageJson.dependencies."react-scripts" -lt "5.0.0" -and $packageJson.dependencies."react-scripts") {
        Write-Host "WARNING: Outdated react-scripts found in package.json" -ForegroundColor Yellow
        $totalIssues++
    } else {
        Write-Host "PASS: package.json checks passed." -ForegroundColor Green
    }
}

$gitignorePath = Join-Path $SourcePath ".gitignore"
if (Test-Path $gitignorePath) {
    $gitignoreContent = Get-Content $gitignorePath
    $requiredIgnores = @(".env", ".env.local", ".env.production")
    foreach ($ignore in $requiredIgnores) {
        if ($gitignoreContent -notmatch $ignore) {
            Write-Host "FAILED: .gitignore is missing $ignore" -ForegroundColor Red
            $totalIssues++
        }
    }
} else {
    Write-Host "FAILED: .gitignore not found." -ForegroundColor Red
    $totalIssues++
}

$nextConfigPath = Join-Path $SourcePath "next.config.js"
if (Test-Path $nextConfigPath) {
    $nextConfigContent = Get-Content $nextConfigPath -Raw
    if ($nextConfigContent -notmatch "securityHeaders" -and $nextConfigContent -notmatch "headers\(\)") {
        Write-Host "WARNING: Security headers might not be configured in next.config.js" -ForegroundColor Yellow
        $totalIssues++
    } else {
        Write-Host "PASS: next.config.js appears to have headers configured." -ForegroundColor Green
    }
}

Write-Host ""
if ($totalIssues -gt 0) {
    Write-Host "Audit Complete: $totalIssues issues found." -ForegroundColor Red
} else {
    Write-Host "Audit Complete: 0 issues found." -ForegroundColor Green
}
