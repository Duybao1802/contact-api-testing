#!/bin/bash

# Contact API Test Runner Script
# This script runs automated API tests using Newman CLI

echo "🚀 Starting Contact API Tests..."

# Check if Newman is installed
if ! command -v newman &> /dev/null; then
    echo "❌ Newman CLI is not installed. Please install it first:"
    echo "   npm install -g newman"
    exit 1
fi

# Set environment variables
export BASE_URL="http://localhost:8091/api"
export ADMIN_TOKEN="your_admin_token_here"
export USER_TOKEN="your_user_token_here"

# Create reports directory if it doesn't exist
mkdir -p reports

# Run the Contact API tests
echo "📋 Running Contact API Tests..."
newman run postman-collections/Contact-API-Tests.postman_collection.json \
    --environment-var base_url=$BASE_URL \
    --environment-var admin_token=$ADMIN_TOKEN \
    --environment-var user_token=$USER_TOKEN \
    --reporters cli,json,html \
    --reporter-json-export reports/contact-api-results.json \
    --reporter-html-export reports/contact-api-report.html \
    --bail

# Check exit code
if [ $? -eq 0 ]; then
    echo "✅ All Contact API tests passed!"
else
    echo "❌ Some Contact API tests failed. Check the reports for details."
fi

echo "📊 Test reports generated in reports/ directory"
echo "   - JSON: reports/contact-api-results.json"
echo "   - HTML: reports/contact-api-report.html"
