# Bug Report - Contact API Validation Issues

## Bug Information
**Bug ID:** BUG-001  
**Date Reported:** 2025-01-25  
**Reporter:** [Your Name]  
**Severity:** High  
**Priority:** High  
**Status:** Open  

## Bug Description
**Summary:** Contact API returns 500 Internal Server Error instead of proper validation errors for invalid input data.

**Detailed Description:** 
The Contact API endpoint `POST /messages` is not properly handling input validation. When invalid data is submitted (empty name or invalid email format), the API crashes with a 500 Internal Server Error instead of returning appropriate 400/422 status codes with validation error messages.

## Steps to Reproduce
1. **Open Postman** and navigate to the Contact API Tests collection
2. **Select "Invalid Contact Message - Empty Name"** test
3. **Click "Send"** to execute the request
4. **Observe the response**: 500 Internal Server Error

**Alternative reproduction:**
1. **Select "Invalid Contact Message - Invalid Email"** test
2. **Click "Send"** to execute the request
3. **Observe the response**: 500 Internal Server Error

## Expected Behavior
- **Empty Name**: Should return 400 Bad Request or 422 Unprocessable Entity with error message: "Name field is required"
- **Invalid Email**: Should return 400 Bad Request or 422 Unprocessable Entity with error message: "Invalid email format"

## Actual Behavior
- **Empty Name**: Returns 500 Internal Server Error (server crash)
- **Invalid Email**: Returns 500 Internal Server Error (server crash)

## Environment
- **Application:** Practice Software Testing (sprint5-with-bugs)
- **API Endpoint:** POST http://localhost:8091/messages
- **Test Tool:** Postman
- **Operating System:** Windows 10
- **Browser:** N/A (API testing)

## Test Case Reference
- **TC002:** Contact Message with Empty Name
- **TC003:** Contact Message with Invalid Email

## Impact Assessment
**Business Impact:** High
- Users cannot submit contact forms with validation errors
- Server crashes affect application stability
- Poor user experience when form validation fails

**Technical Impact:** High
- Server crashes instead of graceful error handling
- No proper input validation implemented
- Security risk: server errors may expose internal information

## Suggested Fix
1. **Implement proper input validation** on the server side
2. **Add validation middleware** to check required fields and data formats
3. **Return appropriate HTTP status codes** (400/422) instead of 500
4. **Provide clear error messages** to help users correct their input
5. **Add logging** to track validation failures without crashing

## Additional Information
**Screenshots:** Available in Postman test results
**Logs:** Server logs would show the actual error causing the 500 response
**Related Issues:** This suggests the entire validation layer may be missing or broken

## Test Data Used
```json
// Empty Name Test
{
  "name": "",
  "email": "john@doe.example",
  "subject": "Test Subject",
  "message": "Test message"
}

// Invalid Email Test
{
  "name": "John Doe",
  "email": "invalid-email",
  "subject": "Test Subject",
  "message": "Test message"
}
```

## Priority Justification
This bug is **High Priority** because:
1. **User Experience**: Users cannot submit contact forms properly
2. **Application Stability**: Server crashes affect all users
3. **Data Integrity**: Invalid data may be processed incorrectly
4. **Security**: Server errors may expose sensitive information

---
*Bug reported as part of CS423 Software Testing Assignment - API Testing*
