# Bug Report Template

## Bug Information
**Bug ID:** BUG-001  
**Date Reported:** [Date]  
**Reporter:** [Your Name]  
**Severity:** [Critical/High/Medium/Low]  
**Priority:** [Critical/High/Medium/Low]  
**Status:** [Open/In Progress/Fixed/Closed]  

## Bug Description
**Summary:** [Brief description of the bug]  
**Detailed Description:** [Detailed explanation of what the bug is and how it manifests]

## Steps to Reproduce
1. [Step 1]
2. [Step 2]
3. [Step 3]
4. [Continue as needed]

## Expected Behavior
[Describe what should happen when the steps are followed correctly]

## Actual Behavior
[Describe what actually happens when the steps are followed]

## Environment Information
- **API Version:** [Version number]
- **Base URL:** [http://localhost:8091/api]
- **Test Data Used:** [Reference to test data]
- **Authentication:** [Admin/User/None]
- **Browser/Client:** [Postman/Newman/Other]

## Test Case Reference
**Test Case ID:** [TC-XXX]  
**Test Case Name:** [Test case name]

## Additional Information
**Screenshots/Logs:** [Attach relevant screenshots, error logs, or response data]  
**Related Issues:** [Any related bugs or issues]  
**Notes:** [Additional observations or context]

## Impact Assessment
**Business Impact:** [How this bug affects business operations]  
**User Experience Impact:** [How this bug affects user experience]  
**Security Impact:** [Any security implications]

## Suggested Fix
[Your suggestion for how to fix the bug, if applicable]

---

## Example Bug Report

### Bug Information
**Bug ID:** BUG-001  
**Date Reported:** 2024-01-15  
**Reporter:** John Doe  
**Severity:** High  
**Priority:** High  
**Status:** Open  

### Bug Description
**Summary:** Contact message submission returns 500 error when email contains special characters  
**Detailed Description:** When submitting a contact message with an email address containing special characters like "test+tag@example.com", the API returns a 500 Internal Server Error instead of processing the request or returning a validation error.

### Steps to Reproduce
1. Open Postman and create a new POST request to `/api/messages`
2. Set Content-Type header to `application/json`
3. Use the following request body:
   ```json
   {
     "name": "Test User",
     "email": "test+tag@example.com",
     "subject": "Test Subject",
     "message": "Test message content"
   }
   ```
4. Send the request
5. Observe the 500 error response

### Expected Behavior
The API should either:
- Accept the email and return a 200 status with access token, or
- Return a 400/422 validation error if the email format is not supported

### Actual Behavior
The API returns a 500 Internal Server Error with no specific error details.

### Environment Information
- **API Version:** Sprint 5 with bugs
- **Base URL:** http://localhost:8091/api
- **Test Data Used:** Special character email test case
- **Authentication:** None required for this endpoint
- **Browser/Client:** Postman

### Test Case Reference
**Test Case ID:** TC-003  
**Test Case Name:** Contact Message with Special Characters in Email

### Additional Information
**Response Body:**
```json
{
  "message": "Internal Server Error"
}
```

**Notes:** This bug affects users who have email addresses with plus signs, which are valid according to email standards.

### Impact Assessment
**Business Impact:** Users with valid email addresses cannot submit contact forms, leading to lost customer inquiries.  
**User Experience Impact:** Users receive a generic error message and cannot complete their intended action.  
**Security Impact:** None identified.

### Suggested Fix
The API should properly handle email validation and either accept valid email formats or return appropriate validation error messages instead of crashing with a 500 error.
