param(
    [Parameter(Mandatory=$true)]
    [string]$Url,
    [string]$OutputDir = "./lighthouse-reports",
    [string[]]$Categories = @("performance", "accessibility", "best-practices", "seo")
)

if (-not (Get-Command "lighthouse" -ErrorAction SilentlyContinue)) {
    Write-Error "Lighthouse CLI not found. Install with: npm install -g lighthouse"
    exit 1
}

if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$outputPath = Join-Path $OutputDir "report_$timestamp.html"
$categoryFlags = ($Categories | ForEach-Object { "--only-categories=$_" }) -join " "

Invoke-Expression "lighthouse $Url $categoryFlags --output=html --output-path=$outputPath --chrome-flags='--headless'"

Write-Host "Report saved to: $outputPath"
