# Moozhayil — Deployment Guide

Operational reference for running the API, background worker, admin portal, and mobile app in local, staging, and production environments.

For release sign-off items (security, smoke tests, monitoring), also see [`RELEASE_CHECKLIST.md`](./RELEASE_CHECKLIST.md).

---

## 1. Architecture overview

| Surface | Path | Runtime |
|---------|------|---------|
| REST API | `apps/api` | Node 20, Express, Prisma |
| Background worker | `apps/api` (`npm run worker`) | BullMQ + Redis |
| Admin portal | `apps/admin` | Static Vite build (React) |
| Customer app | `apps/mobile` | Flutter (iOS / Android) |

Shared infrastructure in production: **PostgreSQL 15**, **Redis**, **S3** (KYC uploads, static assets), **Secrets Manager** (env vars).

---

## 2. Local development

### Prerequisites

- Node 20 (`nvm use` — see `.nvmrc`)
- PostgreSQL 15 and Redis (local install or Docker)
- Flutter SDK (mobile only)

### Environment files

```bash
cp .env.example apps/api/.env
cp apps/admin/.env.example apps/admin/.env
```

Edit `apps/api/.env` with your local `DATABASE_URL` and `REDIS_URL`. Mock provider modes (`PAYMENT_PROVIDER_MODE=mock`, etc.) are fine for local dev.

### Database

```bash
cd apps/api
npm ci
npx prisma migrate dev
```

### Seed initial admin operator

Set credentials in `apps/api/.env` (never commit real passwords):

```env
ADMIN_SEED_EMAIL=you@company.com
ADMIN_SEED_PASSWORD=your-strong-password-here
ADMIN_SEED_NAME=Your Name
ADMIN_SEED_ROLE=super_admin
```

Then run:

```bash
cd apps/api
npm run seed:admin
```

The script is idempotent — it skips if the email already exists. Passwords are **never** printed to stdout.

### Start services

Open three terminals:

```bash
# Terminal 1 — API
cd apps/api && npm run dev

# Terminal 2 — Worker (queues: payments, notifications, autopay, etc.)
cd apps/api && npm run worker

# Terminal 3 — Admin portal (http://localhost:5180)
cd apps/admin && npm ci && npm run dev
```

The admin dev server proxies `/v1` to `http://localhost:3080`, so `VITE_API_BASE` can stay empty locally.

### Mobile (optional)

```bash
cd apps/mobile
flutter pub get
flutter run
```

Point the app at your local API base URL in its environment/config layer.

---

## 3. Staging / production — API & worker

### Build

```bash
cd apps/api
npm ci
npm run build
npx prisma migrate deploy
```

Run migrations **before** starting new API/worker tasks.

### Environment (required)

See [`.env.example`](../.env.example) for the full list. Production **must** have:

- `NODE_ENV=production`
- Strong secrets: `JWT_SECRET`, `JWT_REFRESH_SECRET`, `OTP_HASH_SECRET`, `PII_ENCRYPTION_SECRET`, `ADMIN_JWT_SECRET` (each ≥ 32 chars)
- Live provider modes: `PAYMENT_PROVIDER_MODE=live`, `KYC_PROVIDER_MODE=live`, `FIREBASE_MODE=live`
- Live Razorpay, KYC provider, and Firebase credentials
- Webhook secrets: `RAZORPAY_WEBHOOK_SECRET`, `KYC_WEBHOOK_SECRET`, `GOLD_RATE_WEBHOOK_SECRET`

Store secrets in AWS Secrets Manager (or equivalent) — do not bake into images.

### Processes

| Process | Command | Notes |
|---------|---------|-------|
| API server | `node dist/server.js` | Behind ALB / load balancer |
| Worker | `node dist/jobs/worker.js` | Scale independently; requires Redis |
| Health | `GET /v1/health` | Load balancer target |
| Worker health | port `WORKER_HEALTH_PORT` (default 3001) | Optional sidecar check |

Deploy API and worker as separate ECS services (or equivalent) sharing the same image with different entry commands.

### First admin in production

Run the seed script **once** from a secure shell with production env loaded:

```bash
export ADMIN_SEED_EMAIL=ops@yourdomain.com
export ADMIN_SEED_PASSWORD='...from secrets manager...'
export ADMIN_SEED_ROLE=super_admin
export ADMIN_SEED_CONFIRM=yes
npm run seed:admin
```

Rotate the password after first login if the seed value was shared broadly. Create additional operators via database or a future invite flow.

---

## 4. Staging / production — Admin portal

### Build

```bash
cd apps/admin
npm ci
VITE_API_BASE=https://api.yourdomain.com npm run build
```

Output: `apps/admin/dist/` — static files only.

### Hosting

Serve `dist/` via S3 + CloudFront, nginx, or any static host. Requirements:

- SPA fallback to `index.html` for client routes (`/users`, `/orders/:id`, etc.)
- `VITE_API_BASE` must point to the public API origin **at build time**
- API CORS must allow the admin origin

### Operator login flow

1. Open admin URL → login with seeded credentials
2. **Settings → Issue step-up token** before sensitive actions (KYC approve/reject, refunds, gold rate override, ledger adjustments, showroom payments)

---

## 5. CI validation

GitHub Actions (`.github/workflows/ci.yml`) runs on every push/PR to `main`:

| Job | Checks |
|-----|--------|
| `api` | lint, typecheck, test |
| `admin` | production build (`tsc` + Vite) |
| `mobile` | format, analyze, test |

Run locally before pushing:

```bash
cd apps/api && npm run lint && npm run typecheck && npm test
cd apps/admin && npm run build
cd apps/mobile && dart format --set-exit-if-changed . && flutter analyze && flutter test
```

---

## 6. Common operations

| Task | Command / location |
|------|-------------------|
| Apply DB migrations | `cd apps/api && npx prisma migrate deploy` |
| Create admin user | `cd apps/api && npm run seed:admin` |
| KYC review runbook | [`kyc_review.md`](./kyc_review.md) |
| Payment reconciliation | [`payment_reconciliation.md`](./payment_reconciliation.md) |
| Stale gold rates | [`gold_rate_stale.md`](./gold_rate_stale.md) |
| Release sign-off | [`RELEASE_CHECKLIST.md`](./RELEASE_CHECKLIST.md) |

---

## 7. Troubleshooting

| Symptom | Likely cause |
|---------|----------------|
| Admin login 401 | Wrong credentials or `ADMIN_JWT_SECRET` mismatch across API restarts |
| KYC approve 403 | Missing step-up token (`X-Admin-Step-Up` header) |
| Payments stuck in mock | `PAYMENT_PROVIDER_MODE=mock` in production |
| Jobs not running | Worker not deployed or `REDIS_URL` unreachable |
| Admin API calls fail in prod | `VITE_API_BASE` not set at build time, or CORS blocked |

---

*Last updated: Phase H — admin portal production readiness.*
