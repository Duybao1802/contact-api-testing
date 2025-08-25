# Postman Setup Guide for Contact API Testing

## 🚀 Quick Setup Steps

### 1. **Import the Environment**
1. Open Postman
2. Click **"Import"** button (top left)
3. Select **"Upload Files"** tab
4. Choose `postman-environments/Contact-API-Environment.postman_environment.json`
5. Click **"Import"**

### 2. **Import the Test Collection**
1. Click **"Import"** again
2. Select **"Upload Files"** tab
3. Choose `postman-collections/Contact-API-Tests.postman_collection.json`
4. Click **"Import"**

### 3. **Select the Environment**
1. In the top-right corner, click the environment dropdown
2. Select **"Contact API Environment"**
3. Verify it shows as active

## 🔧 Environment Variables Setup

### **Required Variables to Update**

After importing, you need to update these **critical variables**:

#### **Authentication Tokens** (Required)
```json
"admin_token": "your_actual_admin_token_here"
"user_token": "your_actual_user_token_here"
```

#### **How to Get Tokens:**
1. **Access your local app**: `http://localhost:4200`
2. **Login with admin credentials**:
   - Email: `admin@practicesoftwaretesting.com`
   - Password: `welcome01`
3. **Check browser Network tab** or **Postman** for the token
4. **Copy the token** and update the environment variable

### **Pre-configured Variables** (Ready to use)
```json
"base_url": "http://localhost:8091/api"
"test_name": "John Doe"
"test_email": "john@doe.example"
"test_subject": "Website Feedback"
"test_message": "The website is working great! Thank you for the excellent service."
```

## 📝 Step-by-Step Environment Setup

### **Step 1: Access Environment Variables**
1. Click the **"Environment"** dropdown (top-right)
2. Click **"Manage Environments"**
3. Find **"Contact API Environment"** and click **"Edit"**

### **Step 2: Update Critical Variables**
1. **Find `admin_token`**:
   - Click on the value field
   - Replace `your_admin_token_here` with your actual admin token
   - Example: `eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...`

2. **Find `user_token`**:
   - Click on the value field
   - Replace `your_user_token_here` with your actual user token
   - Example: `eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...`

### **Step 3: Verify Base URL**
1. **Check `base_url`**:
   - Should be: `http://localhost:8091/api`
   - Update if your local setup uses different ports

### **Step 4: Save Environment**
1. Click **"Update"** button
2. Close the environment editor

## 🧪 Testing the Setup

### **Quick Test - Verify Environment**
1. **Create a new request** in Postman
2. **Set URL**: `{{base_url}}/messages`
3. **Set Method**: GET
4. **Add Header**: `Authorization: Bearer {{admin_token}}`
5. **Send request**
6. **Expected result**: 200 OK with messages data

### **If You Get Errors:**

#### **401 Unauthorized**
- Check if `admin_token` is correctly set
- Verify the token hasn't expired
- Ensure proper Bearer format: `Bearer your_token_here`

#### **Connection Error**
- Verify your local app is running
- Check if `base_url` is correct
- Ensure Docker containers are up: `docker compose ps`

## 🔍 Environment Variables Reference

### **Base Configuration**
| Variable | Value | Description |
|----------|-------|-------------|
| `base_url` | `http://localhost:8091/api` | API base URL |
| `message_id` | `1` | Default message ID for testing |

### **Test Data**
| Variable | Value | Description |
|----------|-------|-------------|
| `test_name` | `John Doe` | Standard test name |
| `test_email` | `john@doe.example` | Standard test email |
| `test_subject` | `Website Feedback` | Standard test subject |
| `test_message` | `The website is working great!...` | Standard test message |

### **Authentication**
| Variable | Value | Description |
|----------|-------|-------------|
| `admin_token` | `your_token_here` | **UPDATE REQUIRED** |
| `user_token` | `your_token_here` | **UPDATE REQUIRED** |

### **Status Values**
| Variable | Value | Description |
|----------|-------|-------------|
| `status_new` | `NEW` | New message status |
| `status_in_progress` | `IN_PROGRESS` | In progress status |
| `status_resolved` | `RESOLVED` | Resolved status |
| `invalid_status` | `INVALID_STATUS` | Invalid status for testing |

### **Test Scenarios**
| Variable | Value | Description |
|----------|-------|-------------|
| `invalid_email` | `invalid-email` | Invalid email format |
| `empty_string` | `` | Empty string for validation |
| `long_string` | `A...` (256 chars) | Long string for boundary testing |
| `sql_injection_test` | `'; DROP TABLE...` | SQL injection test data |

## 🚨 Troubleshooting

### **Common Issues**

#### **1. Environment Not Showing**
- **Solution**: Restart Postman after import
- **Check**: Environment is in the dropdown list

#### **2. Variables Not Working**
- **Solution**: Ensure environment is selected
- **Check**: Look for `{{variable_name}}` in requests

#### **3. Token Issues**
- **Solution**: Re-login to get fresh tokens
- **Check**: Token format includes "Bearer " prefix

#### **4. Connection Issues**
- **Solution**: Verify local app is running
- **Check**: `curl http://localhost:8091/api/status`

### **Verification Commands**
```bash
# Check if API is running
curl http://localhost:8091/api/status

# Check Docker containers
docker compose ps

# Check API logs
docker compose logs laravel-api
```

## 📱 Using Variables in Requests

### **Example Request Body**
```json
{
  "name": "{{test_name}}",
  "email": "{{test_email}}",
  "subject": "{{test_subject}}",
  "message": "{{test_message}}"
}
```

### **Example URL**
```
{{base_url}}/messages/{{message_id}}/status
```

### **Example Header**
```
Authorization: Bearer {{admin_token}}
```

## ✅ Setup Checklist

- [ ] Environment imported successfully
- [ ] Collection imported successfully
- [ ] Environment selected as active
- [ ] `admin_token` updated with real value
- [ ] `user_token` updated with real value
- [ ] `base_url` verified as correct
- [ ] Quick test request successful (200 OK)
- [ ] All variables resolving correctly

## 🎯 Next Steps

1. **Run the complete collection** to test all endpoints
2. **Check test results** for any failures
3. **Update test data** if needed for your specific setup
4. **Create custom test scenarios** using the environment variables

## 🆘 Need Help?

If you encounter issues:
1. Check the troubleshooting section above
2. Verify your local app is running correctly
3. Ensure tokens are valid and not expired
4. Check Postman console for detailed error messages
