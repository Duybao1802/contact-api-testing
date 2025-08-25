# 🧪 Contact API Testing - CS423 Software Testing Assignment

This project demonstrates **API Testing with Postman and Newman CLI**, integrated into a **CI/CD workflow** using GitHub Actions.

## 📚 Assignment Overview

**Course**: CS423 – CSC13003 – Software Testing  
**Exercise**: API Testing  
**Duration**: 9 hours  
**Features Tested**: Contact API endpoints  
**Testing Approach**: Data-driven testing with Postman + Newman CLI  
**CI/CD**: GitHub Actions automation  

## 🚀 Quick Start

### Prerequisites
- [Node.js](https://nodejs.org/) (v16 or higher)
- [npm](https://www.npmjs.com/) (v8 or higher)
- [Postman](https://www.postman.com/) (for test development)
- Your local API running on `http://localhost:8091`

### 1. Install Dependencies
```bash
npm run setup
```

### 2. Run Tests Locally (Windows)
```powershell
npm run test:local
```

### 3. Run Tests Locally (Linux/macOS)
```bash
npm run test:unix
```

### 4. Run Tests with npm
```bash
npm test
```

## 📁 Project Structure

```
API Testing/
├── .github/
│   └── workflows/
│       └── api-testing.yml          # GitHub Actions workflow
├── postman-collections/
│   ├── Contact-API-Tests.postman_collection.json
│   └── Contact-API-Tests-Data-Driven.postman_collection.json
├── postman-environments/
│   └── Contact-API-Environment-Fixed.postman_environment.json
├── test-data/
│   ├── contact-api-test-data.json
│   └── contact-api-test-scenarios.csv
├── test-cases/
│   └── Contact-API-Test-Cases.csv
├── bug-reports/
│   └── Bug-Report-Template.md
├── run-api-tests.ps1                # Windows PowerShell script
├── run-api-tests.sh                 # Linux/macOS Bash script
├── newman-config.json               # Newman configuration
├── package.json                     # Node.js dependencies
└── README.md                        # This file
```

## 🧪 Test Coverage

### Contact API Endpoints Tested
- ✅ **POST /messages** - Send new contact message
- ✅ **GET /messages** - Retrieve messages (admin/unauthorized)
- ✅ **GET /messages/{id}** - Get specific message by ID
- ✅ **PUT /messages/{id}/status** - Update message status
- ✅ **POST /messages/{id}/reply** - Reply to message
- ✅ **POST /messages/{id}/attach-file** - Attach file to message

### Test Scenarios
- **Positive Testing**: Valid data, successful operations
- **Negative Testing**: Invalid data, error handling
- **Boundary Testing**: Edge cases, data limits
- **Security Testing**: SQL injection, XSS prevention
- **Data-Driven Testing**: Multiple test data sets

## 🔄 CI/CD Integration

### GitHub Actions Workflow
- **Triggers**: Push, Pull Request, Daily Schedule (2 AM UTC), Manual
- **Environment**: Ubuntu Latest
- **Tools**: Node.js 18, Newman CLI, HTML Reporter
- **Output**: HTML test reports, GitHub artifacts

### Workflow Features
- Automatic test execution on code changes
- Daily scheduled testing
- Beautiful HTML test reports
- Test result artifacts for download
- Vietnam timezone support

## 📊 Test Reports

### HTML Report Features
- **Interactive Dashboard**: Test summary and details
- **Visual Charts**: Pass/fail statistics
- **Request/Response Details**: Full API interaction logs
- **Performance Metrics**: Response times, throughput
- **Export Options**: PDF, CSV, JSON formats

### Report Location
- **Local**: `test-results/report.html`
- **CI/CD**: GitHub Actions artifacts

## 🛠️ Manual Testing with Postman

### 1. Import Collection
- Import `Contact-API-Tests.postman_collection.json`
- Import `Contact-API-Environment-Fixed.postman_environment.json`

### 2. Set Environment Variables
- `base_url`: `http://localhost:8091/api`
- `admin_token`: Your admin JWT token
- `user_token`: Your user JWT token

### 3. Run Tests
- Select individual requests or entire collection
- Click "Send" to execute tests
- View results in Postman console

## 🎯 Data-Driven Testing

### Pre-request Scripts
Each test includes JavaScript code that:
- Defines multiple test data scenarios
- Randomly selects test data for each run
- Sets environment variables dynamically
- Provides variety in test execution

### Test Data Sources
- **Hardcoded Arrays**: Multiple scenarios in scripts
- **CSV Files**: External test data files
- **Environment Variables**: Dynamic configuration
- **Random Selection**: Unpredictable test patterns

## 🐛 Bug Reporting

### Known Issues
- **500 Internal Server Error** on invalid input validation
- **Server crashes** instead of proper error responses
- **Missing input validation** for required fields

### Bug Report Template
- Located in `bug-reports/Bug-Report-Template.md`
- Includes severity, priority, and impact assessment
- Provides reproduction steps and expected behavior

## 📝 Assignment Requirements Met

### ✅ API Testing Tools
- Postman for test development
- Newman CLI for automation
- Data-driven testing technique

### ✅ Test Coverage
- 3+ significant APIs tested
- Comprehensive test scenarios
- Bug identification and reporting

### ✅ CI/CD Integration
- GitHub Actions workflow
- Automated test execution
- Test result reporting

### ✅ AI Tools Usage
- AI-assisted test design
- Prompt transparency
- Critical validation of results

## 🚀 Getting Started for Assignment

### 1. Setup Local Environment
```bash
# Clone your repository
git clone <your-repo-url>
cd API-Testing

# Install dependencies
npm run setup

# Export Postman collection and environment
# (Do this in Postman first)
```

### 2. Run Tests Locally
```bash
# Windows
npm run test:local

# Linux/macOS
npm run test:unix
```

### 3. Push to GitHub
```bash
git add .
git commit -m "Add API testing with CI/CD integration"
git push origin main
```

### 4. Check GitHub Actions
- Go to your repository on GitHub
- Click "Actions" tab
- Watch tests run automatically

## 📚 Useful Commands

### Newman CLI
```bash
# Run tests with collection and environment
newman run collection.json -e environment.json

# Generate HTML report
newman run collection.json --reporters htmlextra --reporter-htmlextra-export report.html

# Run with custom configuration
newman run collection.json --iterationCount 5 --delayRequest 1000
```

### npm Scripts
```bash
npm run setup          # Install Newman and create directories
npm test              # Run tests with Newman
npm run test:local    # Run tests with PowerShell script (Windows)
npm run test:unix     # Run tests with Bash script (Linux/macOS)
```

## 🎥 Video Recording Guide

### For Assignment Video
1. **Show Postman Collection**: Demonstrate your data-driven tests
2. **Run PowerShell Script**: Show automated test execution
3. **Display HTML Report**: Show beautiful test results
4. **Push to GitHub**: Show CI/CD automation
5. **GitHub Actions**: Show tests running automatically

### Key Points to Highlight
- Data-driven testing approach
- Comprehensive test coverage
- CI/CD integration
- Professional test reporting
- Bug identification and documentation

## 🤝 Support

### Common Issues
- **Newman not found**: Run `npm run install:newman`
- **Collection file missing**: Export from Postman first
- **Environment file missing**: Export from Postman first
- **Tests failing**: Check API is running on localhost:8091

### Resources
- [Newman Documentation](https://learning.postman.com/docs/running-collections/using-newman-cli/)
- [GitHub Actions](https://docs.github.com/en/actions)
- [Postman Testing](https://learning.postman.com/docs/writing-scripts/test-scripts/)

## 📄 License

MIT License - Feel free to use this for your assignment!

---

**Good luck with your CS423 assignment! 🎓✨**
