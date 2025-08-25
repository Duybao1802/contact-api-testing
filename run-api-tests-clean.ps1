# API Testing PowerShell Script
# CS423 - Software Testing Assignment
# Contact API Tests with Newman CLI

Write-Host "Starting API Tests..." -ForegroundColor Green
Write-Host "CS423 - Software Testing Assignment" -ForegroundColor Cyan
Write-Host "Contact API Testing with Newman CLI" -ForegroundColor Cyan
Write-Host ""

# Check if Newman is installed
$newmanVersion = newman --version 2>$null
if ($newmanVersion) {
    Write-Host "Newman CLI is installed (Version: $newmanVersion)" -ForegroundColor Green
} else {
    Write-Host "Newman CLI not found. Installing..." -ForegroundColor Yellow
    Write-Host "Installing Newman CLI..." -ForegroundColor Yellow
    npm install -g newman
    
    Write-Host "Installing Newman HTML Reporter..." -ForegroundColor Yellow
    npm install -g newman-reporter-htmlextra
    
    Write-Host "Installation completed!" -ForegroundColor Green
}

# Check if HTML reporter is installed
$reporterVersion = newman-reporter-htmlextra --version 2>$null
if ($reporterVersion) {
    Write-Host "Newman HTML Reporter is installed" -ForegroundColor Green
} else {
    Write-Host "Installing Newman HTML Reporter..." -ForegroundColor Yellow
    npm install -g newman-reporter-htmlextra
}

# Create test results directory
if (!(Test-Path "test-results")) {
    New-Item -ItemType Directory -Path "test-results" | Out-Null
    Write-Host "Created test-results directory" -ForegroundColor Green
} else {
    Write-Host "Test results directory exists" -ForegroundColor Green
}

# Check if collection file exists
$collectionPath = "postman-collections/Contact-API-Tests-Simple.postman_collection.json"
if (!(Test-Path $collectionPath)) {
    Write-Host "Collection file not found: $collectionPath" -ForegroundColor Red
    Write-Host "Please check the exported one folder" -ForegroundColor Yellow
    exit 1
}

# Check if environment file exists
$environmentPath = "exported one/Postman Toolshop API Testing/Contact API Environment.postman_environment.json"
if (!(Test-Path $environmentPath)) {
    Write-Host "Environment file not found: $environmentPath" -ForegroundColor Red
    Write-Host "Please check the exported one folder" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "Running API Tests..." -ForegroundColor Cyan
Write-Host "Collection: $collectionPath" -ForegroundColor White
Write-Host "Environment: $environmentPath" -ForegroundColor White
Write-Host "Output: test-results/report.html" -ForegroundColor White
Write-Host ""

# Run the tests using cmd for better compatibility
Write-Host "Executing tests..." -ForegroundColor Yellow
$newmanArgs = "newman run `"$collectionPath`" -e `"$environmentPath`" --reporters cli,htmlextra --reporter-htmlextra-export test-results/report.html --reporter-htmlextra-title `"Contact API Test Results`" --reporter-htmlextra-browserTitle `"API Test Report`" --reporter-htmlextra-exportTimestamp --reporter-htmlextra-timezone `"Asia/Ho_Chi_Minh`" --iteration-count 3 --delay-request 1000"

cmd /c $newmanArgs
$exitCode = $LASTEXITCODE

Write-Host ""

# Check results
if (Test-Path "test-results/report.html") {
    Write-Host "Tests completed successfully!" -ForegroundColor Green
    Write-Host "Report generated: test-results/report.html" -ForegroundColor Cyan
    
    $fileSize = (Get-Item 'test-results/report.html').Length
    Write-Host "File size: $fileSize bytes" -ForegroundColor White
    
    if ($exitCode -eq 0) {
        Write-Host "All tests passed!" -ForegroundColor Green
    } else {
        Write-Host "Some tests failed (Exit code: $exitCode)" -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "Opening report in browser..." -ForegroundColor Yellow
    Start-Process "test-results/report.html"
    
    Write-Host ""
    Write-Host "Summary:" -ForegroundColor Cyan
    Write-Host "   - Tests executed with Newman CLI" -ForegroundColor White
    Write-Host "   - HTML report generated" -ForegroundColor White
    Write-Host "   - Report opened in browser" -ForegroundColor White
    Write-Host "   - Ready for assignment submission!" -ForegroundColor Green
    
} else {
    Write-Host "Test execution failed - no report generated" -ForegroundColor Red
    Write-Host "Check the error messages above" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "Script completed!" -ForegroundColor Green
