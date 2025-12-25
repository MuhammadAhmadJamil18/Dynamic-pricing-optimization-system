# Simple Frontend Start Script
# This handles the path issue with "&" in directory name

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$frontendDir = Join-Path $projectRoot "frontend"

Write-Host "=== Starting Frontend Server ===" -ForegroundColor Green
Write-Host "Directory: $frontendDir" -ForegroundColor Cyan
Write-Host "URL: http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

Set-Location -LiteralPath $frontendDir

# Run using npx to avoid path resolution issues
npx vite --host 0.0.0.0

