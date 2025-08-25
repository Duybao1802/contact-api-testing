# Get Authentication Tokens Script
# This script helps you extract authentication tokens from your local app

Write-Host "🔑 Authentication Token Helper" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host ""

Write-Host "This script will help you get authentication tokens for Postman testing." -ForegroundColor Yellow
Write-Host ""

# Check if the app is running
Write-Host "📡 Checking if your local app is running..." -ForegroundColor Blue
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8091/api/status" -Method GET -TimeoutSec 5
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ API is running and accessible!" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ API is not accessible. Please ensure your app is running:" -ForegroundColor Red
    Write-Host "   docker compose up -d" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "   Then check: http://localhost:8091/api/status" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "🔐 To get authentication tokens, follow these steps:" -ForegroundColor Cyan
Write-Host ""

Write-Host "1. Open your web browser and go to:" -ForegroundColor White
Write-Host "   http://localhost:4200" -ForegroundColor Yellow
Write-Host ""

Write-Host "2. Login with these credentials:" -ForegroundColor White
Write-Host "   Admin User:" -ForegroundColor Cyan
Write-Host "   - Email: admin@practicesoftwaretesting.com" -ForegroundColor Yellow
Write-Host "   - Password: welcome01" -ForegroundColor Yellow
Write-Host ""

Write-Host "   Regular User:" -ForegroundColor Cyan
Write-Host "   - Email: customer@practicesoftwaretesting.com" -ForegroundColor Yellow
Write-Host "   - Password: welcome01" -ForegroundColor Yellow
Write-Host ""

Write-Host "3. After login, open browser Developer Tools (F12):" -ForegroundColor White
Write-Host "   - Go to Network tab" -ForegroundColor Yellow
Write-Host "   - Look for API calls to /auth/login or similar" -ForegroundColor Yellow
Write-Host "   - Check the response for 'access_token' or 'token'" -ForegroundColor Yellow
Write-Host ""

Write-Host "4. Copy the token and update your Postman environment:" -ForegroundColor White
Write-Host "   - Open Postman" -ForegroundColor Yellow
Write-Host "   - Go to Environments > Contact API Environment" -ForegroundColor Yellow
Write-Host "   - Update 'admin_token' and 'user_token' variables" -ForegroundColor Yellow
Write-Host ""

Write-Host "5. Test the setup:" -ForegroundColor White
Write-Host "   - Create a GET request to: {{base_url}}/messages" -ForegroundColor Yellow
Write-Host "   - Add header: Authorization: Bearer {{admin_token}}" -ForegroundColor Yellow
Write-Host "   - Send request - should return 200 OK" -ForegroundColor Yellow
Write-Host ""

Write-Host "📁 Files to import in Postman:" -ForegroundColor Cyan
Write-Host "   - Environment: postman-environments/Contact-API-Environment.postman_environment.json" -ForegroundColor Yellow
Write-Host "   - Collection: postman-collections/Contact-API-Tests.postman_collection.json" -ForegroundColor Yellow
Write-Host ""

Write-Host "🚀 Ready to start testing!" -ForegroundColor Green
Write-Host ""

# Offer to open the app in browser
$openBrowser = Read-Host "Would you like to open the app in your browser now? (y/n)"
if ($openBrowser -eq "y" -or $openBrowser -eq "Y") {
    Start-Process "http://localhost:4200"
    Write-Host "✅ Opened http://localhost:4200 in your browser" -ForegroundColor Green
}

Write-Host ""
Write-Host "📚 For detailed setup instructions, see: POSTMAN-SETUP-GUIDE.md" -ForegroundColor Cyan
