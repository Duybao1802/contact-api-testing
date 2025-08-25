#!/bin/bash

# API Testing Bash Script
# CS423 - Software Testing Assignment
# Contact API Tests with Newman CLI

echo "🚀 Starting API Tests..."
echo "📚 CS423 - Software Testing Assignment"
echo "🔗 Contact API Testing with Newman CLI"
echo ""

# Check if Newman is installed
if ! command -v newman &> /dev/null; then
    echo "❌ Newman CLI not found. Installing..."
    echo "📦 Installing Newman CLI..."
    npm install -g newman
    
    echo "📦 Installing Newman HTML Reporter..."
    npm install -g newman-reporter-htmlextra
    
    echo "✅ Installation completed!"
else
    echo "✅ Newman CLI is installed"
fi

# Check if HTML reporter is installed
if ! command -v newman-reporter-htmlextra &> /dev/null; then
    echo "📦 Installing Newman HTML Reporter..."
    npm install -g newman-reporter-htmlextra
else
    echo "✅ Newman HTML Reporter is installed"
fi

# Create test results directory
mkdir -p test-results
echo "📁 Test results directory ready"

# Check if collection file exists
COLLECTION_PATH="postman-collections/Contact-API-Tests.postman_collection.json"
if [ ! -f "$COLLECTION_PATH" ]; then
    echo "❌ Collection file not found: $COLLECTION_PATH"
    echo "💡 Please export your Postman collection first"
    exit 1
fi

# Check if environment file exists
ENVIRONMENT_PATH="postman-environments/Contact-API-Environment-Fixed.postman_environment.json"
if [ ! -f "$ENVIRONMENT_PATH" ]; then
    echo "❌ Environment file not found: $ENVIRONMENT_PATH"
    echo "💡 Please export your Postman environment first"
    exit 1
fi

echo ""
echo "🧪 Running API Tests..."
echo "📁 Collection: $COLLECTION_PATH"
echo "📁 Environment: $ENVIRONMENT_PATH"
echo "📊 Output: test-results/report.html"
echo ""

# Run the tests
newman run "$COLLECTION_PATH" \
    -e "$ENVIRONMENT_PATH" \
    --reporters cli,htmlextra \
    --reporter-htmlextra-export "test-results/report.html" \
    --reporter-htmlextra-title "Contact API Test Results" \
    --reporter-htmlextra-browserTitle "API Test Report" \
    --reporter-htmlextra-exportTimestamp \
    --reporter-htmlextra-timezone "Asia/Ho_Chi_Minh" \
    --iterationCount 3 \
    --delayRequest 1000

EXIT_CODE=$?

echo ""

# Check results
if [ -f "test-results/report.html" ]; then
    echo "✅ Tests completed successfully!"
    echo "📊 Report generated: test-results/report.html"
    
    # Get file size
    FILE_SIZE=$(stat -f%z "test-results/report.html" 2>/dev/null || stat -c%s "test-results/report.html" 2>/dev/null || echo "unknown")
    echo "📁 File size: $FILE_SIZE bytes"
    
    if [ $EXIT_CODE -eq 0 ]; then
        echo "🎉 All tests passed!"
    else
        echo "⚠️ Some tests failed (Exit code: $EXIT_CODE)"
    fi
    
    echo ""
    echo "🌐 Opening report in browser..."
    
    # Open report based on OS
    if command -v xdg-open &> /dev/null; then
        xdg-open "test-results/report.html"  # Linux
    elif command -v open &> /dev/null; then
        open "test-results/report.html"       # macOS
    else
        echo "💡 Please open test-results/report.html manually"
    fi
    
    echo ""
    echo "📋 Summary:"
    echo "   • Tests executed with Newman CLI"
    echo "   • HTML report generated"
    echo "   • Report opened in browser"
    echo "   • Ready for assignment submission!"
    
else
    echo "❌ Test execution failed - no report generated"
    echo "💡 Check the error messages above"
    exit 1
fi

echo ""
echo "🏁 Script completed!"
