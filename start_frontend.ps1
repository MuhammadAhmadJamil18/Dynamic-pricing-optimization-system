# Start Frontend Development Server
# Handles path with special characters (like "&" in "AI&ML project")

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$frontendPath = Join-Path $scriptPath "frontend"

Write-Host "=== Starting Frontend Development Server ===" -ForegroundColor Green
Write-Host "Frontend will be available at: http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

Set-Location -LiteralPath $frontendPath

# Check if node_modules exists
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing dependencies..." -ForegroundColor Yellow
    npm install
}

# Use npx to run vite (handles path issues better)
npx vite --host 0.0.0.0

