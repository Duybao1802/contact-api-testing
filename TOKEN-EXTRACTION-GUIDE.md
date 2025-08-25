# 🔑 How to Find API Calls and Access Tokens

## 📱 **Step-by-Step Token Extraction Guide**

### **Step 1: Open Your Application**
1. Go to: `http://localhost:4200`
2. You should see the login page

### **Step 2: Open Developer Tools**
- **Press F12** on your keyboard, OR
- **Right-click** anywhere on the page → "Inspect", OR
- **Press Ctrl+Shift+I** (Windows/Linux) or **Cmd+Option+I** (Mac)

### **Step 3: Go to Network Tab**
1. In Developer Tools, click the **"Network"** tab
2. **Clear the network log** by clicking the 🚫 icon (if there are existing requests)

### **Step 4: Login and Capture the Request**
1. **Enter your credentials**:
   - Email: `admin@practicesoftwaretesting.com`
   - Password: `welcome01`
2. **Click Login**
3. **Watch the Network tab** - you'll see new requests appear

### **Step 5: Find the Login API Call**
Look for requests with names like:
- `login`
- `auth`
- `signin`
- `POST` requests to `/api/auth/login` or similar

### **Step 6: Examine the Response**
1. **Click on the login request** in the Network tab
2. **Click the "Response" tab** in the details panel
3. **Look for the access_token** in the response body

---

## 🔍 **What to Look For**

### **Common Response Formats:**

#### **Format 1: Direct token**
```json
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0Ojg5MS9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTcwNTQ5NjgwMCwiZXhwIjoxNzA1NTAwNDAwLCJuYmYiOjE3MDU0OTY4MDAsImp0aSI6IjEyMzQ1Njc4OTAiLCJzdWIiOjEsInBydiI6IjIzNDU2Nzg5MCJ9.abcdef123456789"
}
```

#### **Format 2: Nested token**
```json
{
  "data": {
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
    "user": {
      "id": 1,
      "name": "Admin User"
    }
  }
}
```

#### **Format 3: Different field name**
```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
  "type": "Bearer"
}
```

---

## 📸 **Visual Guide - Where to Click**

### **Network Tab Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│ Developer Tools                                             │
├─────────────────────────────────────────────────────────────┤
│ Elements | Console | Sources | Network | Performance | ... │
├─────────────────────────────────────────────────────────────┤
│ 🚫 Clear | 🔄 Reload | ⚙️ Settings                        │
├─────────────────────────────────────────────────────────────┤
│ Name                    │ Method │ Status │ Type │ Size   │
├─────────────────────────────────────────────────────────────┤
│ login                   │ POST   │ 200    │ xhr  │ 1.2KB  │ ← Click this
│ favicon.ico             │ GET    │ 200    │ img  │ 15.2KB │
│ main.js                 │ GET    │ 200    │ js   │ 45.1KB │
└─────────────────────────────────────────────────────────────┤
```

### **Response Details Panel:**
```
┌─────────────────────────────────────────────────────────────┐
│ Request Details                                            │
├─────────────────────────────────────────────────────────────┤
│ Headers | Preview | Response | Cookies | Timing            │
├─────────────────────────────────────────────────────────────┤
│ Response Body:                                             │
│ {                                                          │
│   "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9. │
│   eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0Ojg5MS9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTcwNTQ5NjgwMCwiZXhwIjoxNzA1NTAwNDAwLCJuYmYiOjE3MDU0OTY4MDAsImp0aSI6IjEyMzQ1Njc4OTAiLCJzdWIiOjEsInBydiI6IjIzNDU2Nzg5MCJ9.abcdef123456789" │
│ }                                                          │
│                                                             │
│ ← Copy this entire token string                            │
└─────────────────────────────────────────────────────────────┤
```

---

## 🎯 **Alternative: Use Postman to Get Token**

If browser method doesn't work, try this:

### **Step 1: Create Login Request in Postman**
1. **New Request** → **POST**
2. **URL**: `http://localhost:8091/api/auth/login`
3. **Headers**: `Content-Type: application/json`
4. **Body** (raw JSON):
```json
{
  "email": "admin@practicesoftwaretesting.com",
  "password": "welcome01"
}
```

### **Step 2: Send Request**
1. Click **Send**
2. Look at the **Response** tab
3. Find the `access_token` in the response body

---

## 🚨 **Common Issues and Solutions**

### **Issue 1: No Network Requests Showing**
- **Solution**: Make sure Network tab is open BEFORE you click login
- **Check**: Clear the network log and try again

### **Issue 2: Can't Find access_token**
- **Solution**: Look for different field names like `token`, `jwt`, `bearer_token`
- **Check**: The token is usually a very long string starting with `eyJ`

### **Issue 3: Response is Empty or Error**
- **Solution**: Check if your app is running correctly
- **Verify**: `http://localhost:8091/api/status` should work

### **Issue 4: Token Looks Different**
- **Solution**: Copy the entire token string, even if it's very long
- **Note**: Tokens can be 200+ characters long

---

## ✅ **What You Should See**

### **Successful Login Response:**
```json
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0Ojg5MS9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTcwNTQ5NjgwMCwiZXhwIjoxNzA1NTAwNDAwLCJuYmYiOjE3MDU0OTY4MDAsImp0aSI6IjEyMzQ1Njc4OTAiLCJzdWIiOjEsInBydiI6IjIzNDU2Nzg5MCJ9.abcdef123456789",
  "token_type": "bearer",
  "expires_in": 3600
}
```

### **Copy the Token:**
- **Select**: The entire token string (from `eyJ` to the end)
- **Copy**: Ctrl+C (Windows) or Cmd+C (Mac)
- **Length**: Should be 200+ characters

---

## 🔄 **Next Steps After Getting Token**

1. **Update your test script**:
   ```powershell
   $env:ADMIN_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9..."
   ```

2. **Test the token**:
   ```bash
   curl -H "Authorization: Bearer YOUR_TOKEN_HERE" http://localhost:8091/api/messages
   ```

3. **Run your tests**:
   ```bash
   .\scripts\run-contact-api-tests.ps1
   ```

---

## 🆘 **Still Having Trouble?**

If you can't find the token:

1. **Check the browser console** for error messages
2. **Try different browsers** (Chrome, Firefox, Edge)
3. **Use Postman method** instead
4. **Check if your app has a different authentication endpoint**

The key is to capture the network traffic **during** the login process, not before or after!
