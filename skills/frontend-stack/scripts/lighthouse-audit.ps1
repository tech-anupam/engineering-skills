param (
    [Parameter(Mandatory=$true)]
    [string]$Url
)

$ErrorActionPreference = "Stop"
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$htmlReport = "lighthouse-report-$timestamp.html"
$jsonReport = "lighthouse-report-$timestamp.json"

if (-not (Get-Command "lighthouse" -ErrorAction SilentlyContinue)) {
    Write-Host "Lighthouse CLI is not installed." -ForegroundColor Yellow
    $install = Read-Host "Do you want to install it globally via npm? (Y/N)"
    if ($install -eq "Y" -or $install -eq "y") {
        npm install -g lighthouse
    } else {
        Write-Host "Exiting script. Lighthouse is required." -ForegroundColor Red
        exit 1
    }
}

Write-Host "Running Lighthouse audit for $Url..." -ForegroundColor Cyan

lighthouse $Url --output html --output json --output-path "lighthouse-report-$timestamp" --quiet --chrome-flags="--headless"

$reportPath = Resolve-Path $jsonReport
$reportData = Get-Content $reportPath | ConvertFrom-Json

$performanceScore = [math]::Round($reportData.categories.performance.score * 100)
$accessibilityScore = [math]::Round($reportData.categories.accessibility.score * 100)
$bestPracticesScore = [math]::Round($reportData.categories."best-practices".score * 100)
$seoScore = [math]::Round($reportData.categories.seo.score * 100)

Write-Host "`nLighthouse Results:" -ForegroundColor Cyan

if ($performanceScore -ge 90) { Write-Host "Performance: $performanceScore (PASS)" -ForegroundColor Green }
else { Write-Host "Performance: $performanceScore (FAIL)" -ForegroundColor Red }

if ($accessibilityScore -ge 90) { Write-Host "Accessibility: $accessibilityScore (PASS)" -ForegroundColor Green }
else { Write-Host "Accessibility: $accessibilityScore (FAIL)" -ForegroundColor Red }

if ($bestPracticesScore -ge 90) { Write-Host "Best Practices: $bestPracticesScore (PASS)" -ForegroundColor Green }
else { Write-Host "Best Practices: $bestPracticesScore (FAIL)" -ForegroundColor Red }

if ($seoScore -ge 90) { Write-Host "SEO: $seoScore (PASS)" -ForegroundColor Green }
else { Write-Host "SEO: $seoScore (FAIL)" -ForegroundColor Red }

Write-Host "`nReports generated:" -ForegroundColor Cyan
Write-Host $htmlReport
Write-Host $jsonReport
