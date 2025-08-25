# Test Token Script
# This script helps you verify if your extracted token is working

Write-Host "🔑 Token Testing Script" -ForegroundColor Green
Write-Host "=======================" -ForegroundColor Green
Write-Host ""

# Get token from user
$token = Read-Host "Paste your access_token here (the long string starting with eyJ)"

if ([string]::IsNullOrWhiteSpace($token)) {
    Write-Host "❌ No token provided. Please run the script again with a valid token." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🔍 Testing your token..." -ForegroundColor Blue

# Test the token with a simple API call
try {
    $headers = @{
        "Authorization" = "Bearer $token"
        "Content-Type" = "application/json"
    }
    
    Write-Host "📡 Making test request to: http://localhost:8091/api/messages" -ForegroundColor Yellow
    
    $response = Invoke-WebRequest -Uri "http://localhost:8091/api/messages" -Method GET -Headers $headers -TimeoutSec 10
    
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ SUCCESS! Your token is working correctly." -ForegroundColor Green
        Write-Host "📊 Response Status: $($response.StatusCode)" -ForegroundColor Cyan
        Write-Host "📄 Response Length: $($response.Content.Length) characters" -ForegroundColor Cyan
        
        # Try to parse JSON response
        try {
            $jsonResponse = $response.Content | ConvertFrom-Json
            if ($jsonResponse.data) {
                Write-Host "📋 Found $($jsonResponse.data.Count) messages" -ForegroundColor Green
                Write-Host "📄 Total messages: $($jsonResponse.total)" -ForegroundColor Green
            }
        } catch {
            Write-Host "⚠️  Response is not valid JSON, but request was successful" -ForegroundColor Yellow
        }
        
        Write-Host ""
        Write-Host "🎯 Next Steps:" -ForegroundColor Green
        Write-Host "1. Update your test script with this token" -ForegroundColor White
        Write-Host "2. Run the full test suite: .\scripts\run-contact-api-tests.ps1" -ForegroundColor White
        
    } else {
        Write-Host "⚠️  Unexpected response code: $($response.StatusCode)" -ForegroundColor Yellow
        Write-Host "📄 Response: $($response.Content)" -ForegroundColor Cyan
    }
    
} catch {
    Write-Host "❌ ERROR: $($_.Exception.Message)" -ForegroundColor Red
    
    if ($_.Exception.Message -like "*401*") {
        Write-Host ""
        Write-Host "🔍 This looks like an authentication error. Possible issues:" -ForegroundColor Yellow
        Write-Host "   - Token has expired (re-login to get a fresh token)" -ForegroundColor White
        Write-Host "   - Token format is incorrect" -ForegroundColor White
        Write-Host "   - Token is for a different user role" -ForegroundColor White
    } elseif ($_.Exception.Message -like "*connection*") {
        Write-Host ""
        Write-Host "🔍 This looks like a connection error. Please check:" -ForegroundColor Yellow
        Write-Host "   - Your app is running: docker compose ps" -ForegroundColor White
        Write-Host "   - API is accessible: http://localhost:8091/api/status" -ForegroundColor White
    }
    
    Write-Host ""
    Write-Host "🔄 Try getting a fresh token by logging in again." -ForegroundColor Cyan
}

Write-Host ""
Write-Host "📚 For more help, see: TOKEN-EXTRACTION-GUIDE.md" -ForegroundColor Cyan
