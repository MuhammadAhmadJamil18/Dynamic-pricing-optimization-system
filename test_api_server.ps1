# Quick test script for API
Write-Host "Starting API server test..."
Write-Host "Press Ctrl+C to stop the server"
Write-Host ""

cd "C:\Users\ahmad\Desktop\AI&ML project"
uvicorn api.main:app --host 0.0.0.0 --port 8000

