param (
    [string]$UrlToTest,
    [string]$SourcePath = "."
)

$ErrorActionPreference = "Stop"

Write-Host "Starting Security Audit..." -ForegroundColor Cyan

$envFiles = git ls-files -- "$SourcePath\*.env*" 2>$null
if ($envFiles) {
    Write-Host "FAILED: .env files found in git tracking!" -ForegroundColor Red
    $envFiles | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
} else {
    Write-Host "PASS: No tracked .env files found." -ForegroundColor Green
}

Write-Host "Running npm audit..." -ForegroundColor Cyan
try {
    $auditResult = npm audit --json | ConvertFrom-Json
    $vulns = $auditResult.metadata.vulnerabilities
    if ($vulns.high -gt 0 -or $vulns.critical -gt 0) {
        Write-Host "FAILED: High/Critical vulnerabilities found!" -ForegroundColor Red
        Write-Host "High: $($vulns.high), Critical: $($vulns.critical)" -ForegroundColor Red
    } else {
        Write-Host "PASS: No high/critical vulnerabilities found." -ForegroundColor Green
    }
} catch {
    Write-Host "WARNING: Failed to run npm audit. Ensure package.json exists." -ForegroundColor Yellow
}

$secretPatterns = @("api[_-]?key", "secret", "password", "token", "sk_test_", "pk_test_", "sk_live_", "pk_live_")
$patternRegex = ($secretPatterns -join "|")

Write-Host "Scanning for hardcoded secrets..." -ForegroundColor Cyan
$matchedFiles = Select-String -Path "$SourcePath\*" -Include "*.js", "*.ts", "*.jsx", "*.tsx" -Pattern $patternRegex -List
if ($matchedFiles) {
    Write-Host "WARNING: Potential hardcoded secrets found in the following files:" -ForegroundColor Yellow
    $matchedFiles | ForEach-Object { Write-Host "  $($_.Path)" -ForegroundColor Yellow }
} else {
    Write-Host "PASS: No apparent hardcoded secrets found." -ForegroundColor Green
}

if ($UrlToTest) {
    Write-Host "Checking security headers for $UrlToTest..." -ForegroundColor Cyan
    try {
        $response = Invoke-WebRequest -Uri $UrlToTest -Method Head -UseBasicParsing
        $headers = $response.Headers

        $requiredHeaders = @("Strict-Transport-Security", "Content-Security-Policy", "X-Content-Type-Options", "X-Frame-Options", "Referrer-Policy")
        
        foreach ($header in $requiredHeaders) {
            if ($headers.ContainsKey($header)) {
                Write-Host "PASS: $header is present." -ForegroundColor Green
            } else {
                Write-Host "FAILED: $header is missing!" -ForegroundColor Red
            }
        }
    } catch {
        Write-Host "WARNING: Could not fetch headers for $UrlToTest" -ForegroundColor Yellow
    }
} else {
    Write-Host "SKIPPED: No URL provided to test security headers." -ForegroundColor DarkGray
}

Write-Host "Security Audit Complete." -ForegroundColor Cyan
