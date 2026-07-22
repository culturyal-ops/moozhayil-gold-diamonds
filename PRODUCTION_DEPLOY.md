# Moozhayil — Production Deployment Guide

Everything you need to do when your API keys arrive and you're ready to go live.
Follow the sections in order. Don't skip steps.

---

## 1. Secrets & API Keys — What You Need

Collect all of these before starting. Everything is referenced in `.env.production.example`.

### Auth secrets (generate yourself — must be 32+ random chars each)
```
JWT_SECRET
JWT_REFRESH_SECRET
OTP_HASH_SECRET
PII_ENCRYPTION_SECRET        ← encrypts Aadhaar / PAN numbers in the DB
ADMIN_JWT_SECRET
```

Generate with:
```bash
node -e "console.log(require('crypto').randomBytes(48).toString('hex'))"
```
Run that 5 times, one per secret.

### MSG91 (OTP SMS)
- `MSG91_AUTH_KEY` — from MSG91 dashboard → API → Auth Key
- `MSG91_OTP_TEMPLATE_ID` — create an OTP template, copy the template ID

### Razorpay
- `RAZORPAY_KEY_ID` — format `rzp_live_XXXXX`
- `RAZORPAY_KEY_SECRET`
- `RAZORPAY_WEBHOOK_SECRET` — set in Razorpay Dashboard → Webhooks → Secret

### Firebase (for push notifications)
From Firebase Console → Project Settings → Service Accounts → Generate New Private Key:
- `FIREBASE_PROJECT_ID`
- `FIREBASE_CLIENT_EMAIL`
- `FIREBASE_PRIVATE_KEY` — the full `-----BEGIN RSA PRIVATE KEY-----` string (keep newlines as `\n`)

From Firebase Console → Project Settings → General → Your apps (Android app):
- `FIREBASE_APP_ID` — for mobile dart-define build
- `FIREBASE_API_KEY` — for mobile dart-define build
- `FIREBASE_MESSAGING_SENDER_ID` — for mobile dart-define build

### KYC Provider (Digilocker / your KYC vendor)
- `KYC_PROVIDER_BASE_URL`
- `KYC_PROVIDER_API_KEY`
- `KYC_WEBHOOK_SECRET`

### AWS S3 (media & KYC uploads)
- `S3_BUCKET` — e.g. `moozhayil-media-prod`
- `S3_ACCESS_KEY_ID`
- `S3_SECRET_ACCESS_KEY`
- `S3_PUBLIC_BASE_URL` — e.g. `https://cdn.moozhayil.com`
- `S3_REGION` — `ap-south-1`

### Gold Rate Webhook
- `GOLD_RATE_WEBHOOK_SECRET` — shared secret between your gold rate provider and the API

### Sentry (optional but recommended)
- `SENTRY_DSN` — from sentry.io → Project → Settings → DSN

---

## 2. Fill in the Production .env

Copy `.env.production.example` to a secure location (not in the repo):

```bash
cp .env.production.example /etc/moozhayil/api.env
```

Fill in every blank field. Do NOT leave any field empty.

Key non-obvious settings:
```env
NODE_ENV=production
PUBLIC_BASE_URL=https://api.moozhayil.com
CORS_ALLOWED_ORIGINS=https://admin.moozhayil.com
TRUST_PROXY=true
STORAGE_BACKEND=s3
SMS_PROVIDER_MODE=live
PAYMENT_PROVIDER_MODE=live
KYC_PROVIDER_MODE=live
FIREBASE_MODE=live
ENABLE_DEMO_SEEDS=false
```

---

## 3. Android Release Build

### 3a. Create the keystore (one-time)

```bash
keytool -genkey -v \
  -keystore ~/keys/moozhayil-release.jks \
  -alias moozhayil \
  -keyalg RSA -keysize 2048 \
  -validity 10000
```

Store the JKS file somewhere safe and backed up. If you lose it, you can never update the app on Play Store.

### 3b. Fill in key.properties

```bash
cp apps/mobile/android/key.properties.example apps/mobile/android/key.properties
```

Edit `key.properties`:
```
storeFile=/absolute/path/to/moozhayil-release.jks
storePassword=YOUR_KEYSTORE_PASSWORD
keyAlias=moozhayil
keyPassword=YOUR_KEY_PASSWORD
```

### 3c. Add google-services.json

Download from Firebase Console → Project Settings → Your apps → Android app → google-services.json

Place it at:
```
apps/mobile/android/app/google-services.json
```

This file is git-ignored. Never commit it.

### 3d. Update strings.xml with live Razorpay key

Edit `apps/mobile/android/app/src/main/res/values/strings.xml`:
```xml
<string name="razorpay_key_id">rzp_live_XXXXXXXXXXXXXX</string>
```

### 3e. Build the release APK / AAB

```bash
cd apps/mobile

flutter build appbundle --release \
  --dart-define=API_BASE_URL=https://api.moozhayil.com/v1 \
  --dart-define=PUSH_ENABLED=true \
  --dart-define=FIREBASE_PROJECT_ID=your-project-id \
  --dart-define=FIREBASE_API_KEY=your-api-key \
  --dart-define=FIREBASE_APP_ID=1:123456789:android:abcdef \
  --dart-define=FIREBASE_MESSAGING_SENDER_ID=123456789 \
  --dart-define=APP_VERSION=1.0.0
```

Output: `build/app/outputs/bundle/release/app-release.aab`

Upload this AAB to Google Play Console.

---

## 4. Deploy the API

### 4a. Database (PostgreSQL 15)

Provision a managed PostgreSQL instance (RDS, Supabase, Neon, etc.).
Connection string format:
```
postgresql://USER:PASSWORD@HOST:5432/moozhayil?schema=public&sslmode=require
```

### 4b. Redis

Provision a managed Redis 7 instance (Upstash, ElastiCache, etc.).
Use `rediss://` (with TLS) in production:
```
REDIS_URL=rediss://USER:PASSWORD@HOST:6379
```

### 4c. Build & push Docker images

```bash
# API
docker build -t moozhayil-api:latest -f apps/api/Dockerfile apps/api

# Worker
docker build -t moozhayil-worker:latest -f apps/api/Dockerfile.worker apps/api

# Admin
docker build -t moozhayil-admin:latest \
  --build-arg VITE_API_BASE=https://api.moozhayil.com \
  -f apps/admin/Dockerfile apps/admin
```

### 4d. Run migrations

Run once before starting the API:
```bash
docker run --rm \
  --env-file /etc/moozhayil/api.env \
  moozhayil-api:latest \
  node dist/scripts/migrate.js
```

### 4e. Seed the first admin user

```bash
docker run --rm \
  --env-file /etc/moozhayil/api.env \
  -e ADMIN_SEED_EMAIL=admin@moozhayil.com \
  -e ADMIN_SEED_PASSWORD=STRONG_PASSWORD_HERE \
  -e ADMIN_SEED_NAME="Moozhayil Admin" \
  -e ADMIN_SEED_ROLE=super_admin \
  moozhayil-api:latest \
  node dist/scripts/seed-admin.js
```

Run this ONCE. Change the password immediately after first login.

### 4f. Start containers

```bash
# API
docker run -d --name moozhayil-api \
  --env-file /etc/moozhayil/api.env \
  -p 3000:3000 \
  --restart unless-stopped \
  moozhayil-api:latest

# Worker
docker run -d --name moozhayil-worker \
  --env-file /etc/moozhayil/api.env \
  -p 3001:3001 \
  --restart unless-stopped \
  moozhayil-worker:latest

# Admin portal
docker run -d --name moozhayil-admin \
  -p 80:80 \
  --restart unless-stopped \
  moozhayil-admin:latest
```

---

## 5. Razorpay Webhook Configuration

In Razorpay Dashboard → Webhooks → Add New Webhook:

- URL: `https://api.moozhayil.com/v1/webhooks/razorpay`
- Secret: same value as `RAZORPAY_WEBHOOK_SECRET` in your env
- Events to enable:
  - `payment.captured`
  - `payment.failed`
  - `order.paid`
  - `refund.processed`

---

## 6. Firebase Cloud Messaging Setup

In Firebase Console:
1. Go to Project Settings → Cloud Messaging
2. Note the Server Key (used by the API via `firebase-admin`)
3. Ensure the Android app is registered with the correct package name: `com.moozhayil.moozhayil`

The `FIREBASE_PRIVATE_KEY` in your env is from the service account JSON, not the server key.

---

## 7. Sentry Error Monitoring (optional but recommended)

1. Create a project at sentry.io
2. Add the DSN to your env: `SENTRY_DSN=https://...@sentry.io/...`
3. In `apps/api`:
   ```bash
   npm install @sentry/node --save
   ```
4. In `apps/api/src/utils/monitoring.ts`, uncomment the Sentry import and `Sentry.init()` block (instructions are in the file).

---

## 8. DNS & SSL

Set up DNS records pointing to your server:

| Domain | Points to |
|--------|-----------|
| `api.moozhayil.com` | Your API server IP |
| `admin.moozhayil.com` | Your admin server IP |

Add SSL via Let's Encrypt (nginx + certbot) or your cloud provider's certificate manager.

Nginx config for the API (reference):
```nginx
server {
    listen 443 ssl;
    server_name api.moozhayil.com;

    ssl_certificate     /etc/letsencrypt/live/api.moozhayil.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/api.moozhayil.com/privkey.pem;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Set `TRUST_PROXY=true` in the API env when behind nginx/load balancer.

---

## 9. Pre-Launch Checklist

Run through every item before going live:

### API
- [ ] `NODE_ENV=production` is set
- [ ] All 5 auth secrets are set (non-default, 32+ chars)
- [ ] `SMS_PROVIDER_MODE=live`, MSG91 keys set
- [ ] `PAYMENT_PROVIDER_MODE=live`, Razorpay keys set
- [ ] `KYC_PROVIDER_MODE=live`, KYC keys set
- [ ] `FIREBASE_MODE=live`, Firebase service account set
- [ ] `STORAGE_BACKEND=s3`, S3 bucket created and accessible
- [ ] `ENABLE_DEMO_SEEDS=false`
- [ ] Database migrations ran successfully
- [ ] First admin user seeded and password changed
- [ ] Health check returns 200: `curl https://api.moozhayil.com/health`
- [ ] Razorpay webhook configured and returning 200

### Mobile App
- [ ] `google-services.json` placed in `android/app/`
- [ ] `strings.xml` has live Razorpay key ID (`rzp_live_...`)
- [ ] `key.properties` filled with keystore details
- [ ] Release AAB built with all `--dart-define` values
- [ ] AAB uploaded to Play Store internal testing track
- [ ] Test OTP flow end-to-end on a real device
- [ ] Test checkout + Razorpay payment on a real device
- [ ] Test push notification received on a real device

### Admin Portal
- [ ] `VITE_API_BASE` set to `https://api.moozhayil.com` in Docker build arg
- [ ] Login works with the seeded admin credentials
- [ ] Step-up token flow works (Settings page)
- [ ] Can create/edit a product
- [ ] Can approve a KYC submission

### Infrastructure
- [ ] SSL certificates installed for all domains
- [ ] HTTPS redirect configured (HTTP → HTTPS)
- [ ] `TRUST_PROXY=true` if behind a load balancer
- [ ] `CORS_ALLOWED_ORIGINS` set to exact admin domain only
- [ ] Backups configured for PostgreSQL
- [ ] Container restart policy is `unless-stopped`

---

## 10. Post-Launch

### Monitoring
- Watch API logs for the first 30 minutes after launch
- Check Sentry for any new exceptions
- Verify the worker is processing jobs: `docker logs moozhayil-worker`

### Seed catalogue data
```bash
docker run --rm --env-file /etc/moozhayil/api.env \
  moozhayil-api:latest node dist/scripts/seed-catalog.js
```

### First gold rate
Set via Admin Portal → Gold Rates → Override Rate.
This must be done before any product prices display correctly.

---

## Quick Reference — Key URLs

| Service | URL |
|---------|-----|
| API | `https://api.moozhayil.com` |
| API Health | `https://api.moozhayil.com/health` |
| Admin Portal | `https://admin.moozhayil.com` |
| Razorpay Dashboard | `https://dashboard.razorpay.com` |
| Firebase Console | `https://console.firebase.google.com` |
| MSG91 Dashboard | `https://msg91.com/dashboard` |
| Play Console | `https://play.google.com/console` |
