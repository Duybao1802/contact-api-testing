# Project Structure Overview

## 📁 Directory Structure

```
API Testing/
├── 📄 README.md                           # Project overview and documentation
├── 📄 SETUP-GUIDE.md                      # Step-by-step setup instructions
├── 📄 PROJECT-STRUCTURE.md                # This file - project organization
├── 📄 .github/
│   └── 📄 workflows/
│       └── 📄 api-testing.yml            # GitHub Actions CI/CD workflow
├── 📄 postman-collections/
│   └── 📄 Contact-API-Tests.postman_collection.json  # Postman test collection
├── 📄 test-data/
│   └── 📄 contact-api-test-data.json     # Test data for various scenarios
├── 📄 test-cases/
│   └── 📄 Contact-API-Test-Cases.csv     # Comprehensive test case documentation
├── 📄 bug-reports/
│   └── 📄 Bug-Report-Template.md         # Bug reporting template and examples
├── 📄 scripts/
│   ├── 📄 run-contact-api-tests.sh       # Linux/Mac test runner script
│   └── 📄 run-contact-api-tests.ps1      # Windows PowerShell test runner
└── 📄 reports/                            # Generated test reports (created when tests run)
    ├── 📄 contact-api-results.json        # JSON test results
    └── 📄 contact-api-report.html         # HTML test report
```

## 🎯 Key Components

### 1. **Postman Collections** (`postman-collections/`)
- **Contact-API-Tests.postman_collection.json**: Complete test collection for Contact API
- Contains all endpoints with test scripts and assertions
- Ready to import into Postman for manual testing

### 2. **Test Data** (`test-data/`)
- **contact-api-test-data.json**: Comprehensive test data covering:
  - Valid contact messages
  - Invalid data scenarios
  - Boundary values
  - Authentication tokens
  - File attachment data

### 3. **Test Cases** (`test-cases/`)
- **Contact-API-Test-Cases.csv**: 25 detailed test cases covering:
  - Positive testing scenarios
  - Negative testing scenarios
  - Boundary value testing
  - Performance testing
  - Security testing

### 4. **Automation Scripts** (`scripts/`)
- **run-contact-api-tests.sh**: Linux/Mac shell script
- **run-contact-api-tests.ps1**: Windows PowerShell script
- Both scripts use Newman CLI for automated testing

### 5. **CI/CD Integration** (`.github/workflows/`)
- **api-testing.yml**: GitHub Actions workflow
- Automatically runs tests on:
  - Code pushes
  - Pull requests
  - Scheduled daily runs
  - Manual triggers

### 6. **Bug Reporting** (`bug-reports/`)
- **Bug-Report-Template.md**: Comprehensive template for documenting issues
- Includes example bug report
- Structured format for consistent reporting

## 🔧 Testing Tools

### **Primary Tools**
- **Postman**: Manual testing and collection management
- **Newman CLI**: Automated testing and CI/CD integration
- **GitHub Actions**: Continuous integration and deployment

### **Supporting Tools**
- **Docker**: Application deployment and testing environment
- **Node.js**: Newman CLI runtime environment
- **Git**: Version control and collaboration

## 📊 Test Coverage

### **Contact API Endpoints Covered**
1. ✅ `POST /messages` - Send new contact message
2. ✅ `GET /messages` - Retrieve messages (with pagination)
3. ✅ `GET /messages/{messageId}` - Get specific message
4. ✅ `PUT /messages/{messageId}/status` - Update message status
5. ✅ `POST /messages/{messageId}/reply` - Reply to message
6. ✅ `POST /messages/{messageId}/attach-file` - Attach file

### **Test Types Implemented**
- **Functional Testing**: All API endpoints and business logic
- **Data Validation**: Input validation and error handling
- **Authentication**: Token-based access control
- **Performance**: Response time and load testing
- **Security**: SQL injection and input sanitization
- **Boundary Testing**: Edge cases and limits

## 🚀 Getting Started

### **Quick Start**
1. Follow `SETUP-GUIDE.md` for environment setup
2. Import Postman collection for manual testing
3. Run automated tests using provided scripts
4. View test results in generated reports

### **Next Steps**
1. **Favourite API Testing**: Create similar test structure for Favourite API
2. **Enhanced Coverage**: Add more test scenarios and edge cases
3. **Performance Optimization**: Improve test execution speed
4. **Integration**: Connect with bug tracking and project management tools

## 📈 Metrics and Reporting

### **Test Execution Metrics**
- Total test cases: 25
- Test execution time
- Pass/fail rates
- Response time measurements
- Error categorization

### **Report Formats**
- **Console Output**: Real-time test execution
- **JSON Reports**: Machine-readable results
- **HTML Reports**: Human-readable with visualizations
- **GitHub Actions**: Integrated CI/CD reporting

## 🔍 Monitoring and Maintenance

### **Regular Tasks**
- Update test data for new scenarios
- Review and update test cases
- Monitor CI/CD pipeline performance
- Update dependencies and tools

### **Quality Assurance**
- Test case review and validation
- Bug report analysis and tracking
- Performance benchmark monitoring
- Security testing updates

## 📚 Documentation

### **User Guides**
- Setup instructions for new team members
- Test execution procedures
- Troubleshooting common issues
- Best practices and guidelines

### **Technical Documentation**
- API endpoint specifications
- Test data schemas
- Automation script configurations
- CI/CD pipeline setup

## 🤝 Collaboration

### **Team Workflow**
1. **Development**: Create and update test cases
2. **Testing**: Execute tests and report results
3. **Review**: Analyze results and identify issues
4. **Reporting**: Document bugs and track resolutions
5. **Integration**: Deploy updates to CI/CD pipeline

### **Version Control**
- All test artifacts are version controlled
- Collaborative development through Git
- Automated testing on all changes
- Rollback capability for failed deployments
