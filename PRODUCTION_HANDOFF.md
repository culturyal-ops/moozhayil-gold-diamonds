# Moozhayil Production Handoff

This document lists every secret/account the client must supply, where it goes, and which webhooks to configure. The codebase is hardened for production; you only need to paste credentials and deploy.

---

## 1. Core infrastructure

| Variable | What to provide | Where |
|---|---|---|
| `DATABASE_URL` | PostgreSQL 15 connection string (`postgresql://...`) | API + worker secret store |
| `REDIS_URL` | Redis URL (`redis://` or `rediss://` for TLS) | API + worker secret store |
| `PUBLIC_BASE_URL` | Public API origin, e.g. `https://api.moozhayil.com` | API secret store |
| `CORS_ALLOWED_ORIGINS` | Comma-separated browser origins, e.g. `https://admin.moozhayil.com,https://app.moozhayil.com` | API secret store |
| `TRUST_PROXY` | `true` when behind ALB/nginx/CloudFront | API secret store |
| `NODE_ENV` | `production` | API + worker |

Generate strong random strings (≥32 chars each) in AWS Secrets Manager / hosting vault:

- `JWT_SECRET`
- `JWT_REFRESH_SECRET`
- `OTP_HASH_SECRET`
- `PII_ENCRYPTION_SECRET`
- `ADMIN_JWT_SECRET`

Set `ENABLE_DEMO_SEEDS=false` in production.

---

## 2. Object storage (required in production)

Production requires `STORAGE_BACKEND=s3`.

| Variable | AWS S3 | MinIO (staging) |
|---|---|---|
| `S3_BUCKET` | Bucket name | Bucket name |
| `S3_REGION` | e.g. `ap-south-1` | e.g. `ap-south-1` |
| `S3_ACCESS_KEY_ID` | IAM access key | MinIO user |
| `S3_SECRET_ACCESS_KEY` | IAM secret | MinIO password |
| `S3_PUBLIC_BASE_URL` | CloudFront or bucket URL | `http://localhost:9000/bucket` |
| `S3_ENDPOINT` | Leave empty for AWS | `http://minio:9000` |
| `S3_FORCE_PATH_STYLE` | `false` | `true` |

KYC selfies and admin media uploads are stored under `kyc/` and `media/` keys.

---

## 3. SMS OTP — MSG91

| Variable | Value |
|---|---|
| `SMS_PROVIDER_MODE` | `live` |
| `MSG91_AUTH_KEY` | MSG91 dashboard → API key |
| `MSG91_OTP_TEMPLATE_ID` | DLT-approved OTP template ID |

No webhook required. OTP is outbound-only.

---

## 4. Payments — Razorpay

| Variable | Razorpay Dashboard location |
|---|---|
| `PAYMENT_PROVIDER_MODE` | Set `live` |
| `RAZORPAY_KEY_ID` | Settings → API Keys → Key ID |
| `RAZORPAY_KEY_SECRET` | Settings → API Keys → Key Secret |
| `RAZORPAY_WEBHOOK_SECRET` | Webhooks → create secret |

**Webhook URL:** `POST {PUBLIC_BASE_URL}/v1/webhooks/payment`

**Events to enable:**
- `payment.captured`
- `payment.failed`
- `refund.processed`

Mobile app receives `razorpay_key_id` from API responses — no Razorpay key is compiled into the app.

---

## 5. KYC vendor

The API uses a generic adapter. Your vendor must expose (or you must proxy) these endpoints:

| Endpoint | Purpose |
|---|---|
| `POST {KYC_PROVIDER_BASE_URL}/aadhaar/send-otp` | `{ aadhaar_number }` → `{ session_id }` |
| `POST {KYC_PROVIDER_BASE_URL}/aadhaar/verify-otp` | `{ aadhaar_number, otp }` → `{ verified, name_on_aadhaar }` |
| `POST {KYC_PROVIDER_BASE_URL}/pan/verify` | `{ pan_number }` → `{ verified, name_on_pan, pan_type }` |
| `POST {KYC_PROVIDER_BASE_URL}/selfie/verify` | `{ image_base64, mime_type }` → `{ face_detected, liveness_score? }` |

| Variable | Value |
|---|---|
| `KYC_PROVIDER_MODE` | `live` |
| `KYC_PROVIDER_BASE_URL` | Vendor base URL |
| `KYC_PROVIDER_API_KEY` | Bearer token |
| `KYC_WEBHOOK_SECRET` | HMAC secret for optional async events |

**Optional webhook URL:** `POST {PUBLIC_BASE_URL}/v1/webhooks/kyc`

Admin still manually approves/rejects KYC after provider checks.

---

## 6. Push notifications — Firebase

| Variable | Firebase Console |
|---|---|
| `FIREBASE_MODE` | `live` |
| `FIREBASE_PROJECT_ID` | Project settings |
| `FIREBASE_CLIENT_EMAIL` | Service account JSON |
| `FIREBASE_PRIVATE_KEY` | Service account JSON (escape newlines as `\n`) |

**Mobile (separate from API):**
1. Register Android + iOS apps in Firebase.
2. Build with dart-defines from `apps/mobile/.env.production.example`:
   - `API_BASE_URL`
   - `PUSH_ENABLED=true`
   - `FIREBASE_PROJECT_ID`, `FIREBASE_API_KEY`, `FIREBASE_APP_ID`, `FIREBASE_MESSAGING_SENDER_ID`
3. Optional: add `google-services.json` / `GoogleService-Info.plist` for native tooling; manual `FirebaseOptions` init is already wired.

---

## 7. Gold rates

| Variable | Value |
|---|---|
| `GOLD_RATE_WEBHOOK_SECRET` | Random HMAC secret |

**Webhook URL:** `POST {PUBLIC_BASE_URL}/v1/webhooks/gold-rate`

Alternatively, finance team sets daily rates in Admin → Gold Rates.

---

## 8. Admin portal

Build with:

```bash
VITE_API_BASE=https://api.moozhayil.com npm run build --prefix apps/admin
```

Host `apps/admin/dist/` on HTTPS (S3+CloudFront or nginx).

Create first admin (one time):

```bash
cd apps/api
ADMIN_SEED_EMAIL=ops@moozhayil.com \
ADMIN_SEED_PASSWORD='...' \
ADMIN_SEED_NAME='Ops Admin' \
ADMIN_SEED_ROLE=super_admin \
ADMIN_SEED_CONFIRM=yes \
npm run seed:admin
```

---

## 9. Mobile app release

```bash
flutter build apk --release \
  --dart-define=API_BASE_URL=https://api.moozhayil.com/v1 \
  --dart-define=PUSH_ENABLED=true \
  --dart-define=APP_VERSION=1.0.0
```

Signing keys (keystore / Apple certificates) are configured in Android Studio / Xcode — not stored in this repo.

---

## 10. Processes to run in production

| Process | Command |
|---|---|
| API | `npm run start:prod` (migrate + serve) |
| Worker | `npm run worker:start` |

Both require the same env vars. Worker health: `GET :3081` when using Docker staging (host port).

---

## 11. Post-deploy smoke tests

1. `GET /v1/health` → `status: ok`
2. OTP login with real phone
3. KYC flow through vendor + admin approve
4. Product browse → checkout → Razorpay → order confirmed
5. Golden Wish contribute → Razorpay → gold credited
6. Admin refund → Razorpay refund webhook → customer notified
7. Load serviceable pincodes + store locations in Admin → Operations

---

## 12. Staging with Docker (no live credentials)

See root `docker-compose.yml` and `docker/staging.api.env`. Uses mock providers + MinIO.

```bash
docker compose up --build
```

API: http://localhost:3080  
Admin: http://localhost:5180  
MinIO console: http://localhost:9001

Host ports are defined in [`config/local-ports.md`](./config/local-ports.md) so Moozhayil does not use `3000–3005`.
