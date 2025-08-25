# Contact API Test Runner Script for Windows PowerShell
# This script runs automated API tests using Newman CLI

Write-Host "🚀 Starting Contact API Tests..." -ForegroundColor Green

# Check if Newman is installed
try {
    $newmanVersion = newman --version 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "Newman not found"
    }
    Write-Host "✅ Newman CLI found: $newmanVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Newman CLI is not installed. Please install it first:" -ForegroundColor Red
    Write-Host "   npm install -g newman" -ForegroundColor Yellow
    Write-Host "   npm install -g newman-reporter-html" -ForegroundColor Yellow
    exit 1
}

# Set environment variables
$env:BASE_URL = "http://localhost:8091/api"
$env:ADMIN_TOKEN = "your_admin_token_here"
$env:USER_TOKEN = "your_user_token_here"

# Create reports directory if it doesn't exist
if (!(Test-Path "reports")) {
    New-Item -ItemType Directory -Path "reports" | Out-Null
    Write-Host "📁 Created reports directory" -ForegroundColor Blue
}

# Run the Contact API tests
Write-Host "📋 Running Contact API Tests..." -ForegroundColor Blue

try {
    newman run postman-collections/Contact-API-Tests.postman_collection.json `
        --environment-var base_url=$env:BASE_URL `
        --environment-var admin_token=$env:ADMIN_TOKEN `
        --environment-var user_token=$env:USER_TOKEN `
        --reporters cli,json,html `
        --reporter-json-export reports/contact-api-results.json `
        --reporter-html-export reports/contact-api-report.html `
        --bail

    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ All Contact API tests passed!" -ForegroundColor Green
    } else {
        Write-Host "❌ Some Contact API tests failed. Check the reports for details." -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Error running tests: $_" -ForegroundColor Red
    exit 1
}

Write-Host "📊 Test reports generated in reports/ directory" -ForegroundColor Green
Write-Host "   - JSON: reports/contact-api-results.json" -ForegroundColor Cyan
Write-Host "   - HTML: reports/contact-api-report.html" -ForegroundColor Cyan

# Open the HTML report if available
if (Test-Path "reports/contact-api-report.html") {
    $openReport = Read-Host "Would you like to open the HTML report? (y/n)"
    if ($openReport -eq "y" -or $openReport -eq "Y") {
        Start-Process "reports/contact-api-report.html"
    }
}
