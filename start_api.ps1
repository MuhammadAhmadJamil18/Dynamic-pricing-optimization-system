# Start API Server
Write-Host "Starting Dynamic Pricing Optimization API..." -ForegroundColor Green
Write-Host "API will be available at: http://localhost:8000" -ForegroundColor Cyan
Write-Host "API Documentation: http://localhost:8000/docs" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

cd $PSScriptRoot
python -m uvicorn api.main:app --reload --port 8000 --host 0.0.0.0

