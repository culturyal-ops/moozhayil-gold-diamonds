# Vercel Deployment Guide - Admin Panel

## Quick Setup for Admin Dashboard on Vercel

### Step 1: Deploy to Vercel
1. Go to https://vercel.com → Sign in with GitHub
2. Click **New Project**
3. Select `moozhayil-gold-diamonds` repository
4. Configure:
   - **Framework**: Vite
   - **Root Directory**: `apps/admin`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`

### Step 2: Add Environment Variable
Add this environment variable in Vercel project settings:

```
VITE_API_BASE = https://moozhayil-gold-diamonds-production.up.railway.app
```

### Step 3: Update API CORS
After your Vercel URL is deployed (e.g., `https://moozhayil-admin.vercel.app`), update your Railway API service with the admin origin:

**In Railway Dashboard:**
1. Go to `moozhayil-gold-diamonds` service
2. Variables tab
3. Update `CORS_ALLOWED_ORIGINS` to include:
```
https://moozhayil-admin.vercel.app,https://localhost:5180
```

Or if you already have origins listed, append with comma:
```
<existing-origins>,https://moozhayil-admin.vercel.app
```

### Step 4: Login
1. Visit your deployed admin URL (e.g., `https://moozhayil-admin.vercel.app`)
2. **Email**: `admin@moozhayil.com`
3. **Password**: `Moozhayil@123`

## Troubleshooting

**CORS Error?**
- Check the `CORS_ALLOWED_ORIGINS` variable includes your exact Vercel URL
- Make sure there are no spaces or trailing slashes

**API calls not working?**
- Verify `VITE_API_BASE` is set correctly in Vercel
- Check the Railway API is responding: `https://moozhayil-gold-diamonds-production.up.railway.app/v1/health`

**Build fails?**
- Ensure `npm install` installs all dependencies
- Check Node version (should be 20.x as per package.json)

