# API Testing Setup Guide

## Prerequisites
- Docker and Docker Compose installed
- Node.js (version 16 or higher)
- Git
- Postman (optional, for manual testing)

## Step 1: Clone and Setup the Project

1. **Clone the repository:**
   ```bash
   git clone https://github.com/testsmith-io/practice-software-testing.git
   cd practice-software-testing
   ```

2. **Switch to sprint5-with-bugs version:**
   ```bash
   # Update .env file to use sprint5-with-bugs
   echo "SPRINT=sprint5-with-bugs" > .env
   ```

3. **Start the application:**
   ```bash
   docker compose up -d
   ```

4. **Wait for services to be ready:**
   ```bash
   # Check if API is responding
   curl http://localhost:8091/api/status
   ```

## Step 2: Install Testing Tools

1. **Install Newman CLI globally:**
   ```bash
   npm install -g newman
   npm install -g newman-reporter-html
   ```

2. **Verify installation:**
   ```bash
   newman --version
   ```

## Step 3: Get Authentication Tokens

1. **Access the application:**
   - Frontend: http://localhost:4200
   - API: http://localhost:8091
   - Swagger: http://localhost:8091/api/documentation

2. **Login to get tokens:**
   - Admin: admin@practicesoftwaretesting.com / welcome01
   - User: customer@practicesoftwaretesting.com / welcome01

3. **Extract tokens from browser/API responses**

## Step 4: Configure Test Environment

1. **Update environment variables in the test script:**
   ```bash
   # Edit scripts/run-contact-api-tests.sh
   export ADMIN_TOKEN="your_actual_admin_token"
   export USER_TOKEN="your_actual_user_token"
   ```

2. **Or create a .env file:**
   ```bash
   ADMIN_TOKEN=your_actual_admin_token
   USER_TOKEN=your_actual_user_token
   BASE_URL=http://localhost:8091/api
   ```

## Step 5: Run Tests

### Option 1: Using Newman CLI
```bash
# Run Contact API tests
./scripts/run-contact-api-tests.sh

# Or run manually
newman run postman-collections/Contact-API-Tests.postman_collection.json \
  --environment-var base_url=http://localhost:8091/api \
  --environment-var admin_token=your_token \
  --reporters cli,json,html
```

### Option 2: Using Postman
1. Import the Postman collection: `postman-collections/Contact-API-Tests.postman_collection.json`
2. Set up environment variables
3. Run the collection

## Step 6: View Test Results

1. **Console output** - Shows real-time test execution
2. **JSON report** - `reports/contact-api-results.json`
3. **HTML report** - `reports/contact-api-report.html`

## Step 7: CI/CD Integration

1. **Push to GitHub** - The GitHub Actions workflow will automatically run tests
2. **View results** - Check the Actions tab in your repository
3. **Download artifacts** - Test reports are available as build artifacts

## Troubleshooting

### Common Issues

1. **Docker services not starting:**
   ```bash
   docker compose down
   docker compose up -d
   ```

2. **API not responding:**
   ```bash
   # Check container status
   docker compose ps
   
   # Check logs
   docker compose logs laravel-api
   ```

3. **Authentication errors:**
   - Verify tokens are valid
   - Check if tokens have expired
   - Ensure proper Bearer token format

4. **Newman not found:**
   ```bash
   npm install -g newman
   ```

### Performance Testing

1. **Response time testing:**
   ```bash
   newman run collection.json --reporters cli,json \
     --reporter-json-export results.json
   ```

2. **Load testing:**
   ```bash
   # Run multiple instances
   for i in {1..10}; do
     newman run collection.json &
   done
   wait
   ```

## Next Steps

1. **Create Favourite API tests** - Follow the same pattern as Contact API
2. **Add more test scenarios** - Expand test coverage
3. **Integrate with bug tracking** - Report discovered issues
4. **Performance optimization** - Monitor and improve test execution time

## Support

- Check the [Practice Software Testing documentation](https://github.com/testsmith-io/practice-software-testing/)
- Review test results and logs for debugging
- Use the bug report template for issue reporting
