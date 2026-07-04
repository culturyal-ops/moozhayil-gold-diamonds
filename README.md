# Moozhayil Gold & Diamonds

A premium gold-ownership platform that helps modern Indian families own gold for
life's important moments. The product converts desire into ownership through
trust, progress, and aspiration — not by selling jewellery or schemes, but by
selling confidence, security, and milestones.

> This repository is the implementation of a locked architecture. The Markdown
> files in [`docs/`](./docs) are the source of truth. When documents conflict,
> follow the authority order described below.

---

## Documentation authority order

Per `docs/16-system-overview.md`, subject-specific final documents own their
decision surface:

1. `docs/14-final-architecture.md` — architecture lock (structure, routes, money/gold units, lifecycles)
2. `docs/17-database-bible.md` — database contract
3. `docs/18-api-contract.md` — API contract (v1)
4. `docs/19-operational-playbook.md` — operations
5. `docs/20-engineering-principles.md` — engineering process
6. `docs/16-system-overview.md` — cross-system explanation

Earlier documents (`01`–`08`) remain the product/design source of truth except
where a newer locked document overrides them. `docs/11-design philosophy.md`
wins on product meaning. `docs/12-donotmodify.md` gates locked surfaces:
architecture, folder structure, routes, design tokens, typography, providers,
models, backend API, authentication, database schema, and navigation hierarchy
must not change without explicit approval.

---

## Monorepo structure

```
moozhayil/
├── apps/
│   ├── mobile/   # Flutter iOS + Android app (primary product)
│   ├── api/      # Node.js 20 LTS + TypeScript + Express 4 + Prisma backend
│   ├── admin/    # Operator portal (Phase 10)
│   └── web/      # Public marketing + catalog companion site
├── packages/     # Shared, reusable packages across surfaces
├── docs/         # Locked product, design, and architecture documentation
├── runbooks/     # Operational runbooks (Phase 10)
├── .nvmrc        # Pinned Node version (20)
├── .gitignore
└── README.md
```

> `apps/web` and `packages/` extend the `apps/mobile` + `apps/api` layout defined
> in `docs/14-final-architecture.md` §3.1. `apps/admin` is the operator portal
> introduced in Phase 10 (`docs/15-development-roadmap.md`).

---

## Technology stack (locked)

**Mobile** — Flutter (latest stable), Riverpod (codegen), go_router, Dio,
flutter_secure_storage + Hive, Freezed + json_serializable.

**Backend** — Node.js 20 LTS, TypeScript, Express 4, Prisma, PostgreSQL 15,
Redis-backed BullMQ, Razorpay, Firebase Admin SDK, Winston + CloudWatch, Sentry.

**Infrastructure** — AWS ECS Fargate, RDS PostgreSQL (via RDS Proxy/PgBouncer),
ElastiCache Redis, S3 + CloudFront, Secrets Manager.

---

## Prerequisites

Install and verify the full toolchain before building any app code:

- **Node.js 20 LTS** — this repo pins `20` via `.nvmrc` (`nvm use`). Development
  may run on a newer Node, but the locked target and production runtime are
  Node 20. `apps/api/package.json` will declare `"engines": { "node": "20.x" }`.
- **Flutter SDK** + Android Studio + Android SDK + **Java 21** — run
  `flutter doctor` and resolve all critical issues.
- **Docker Desktop** — for local PostgreSQL 15 and Redis.
- **PostgreSQL 15** and **Redis** — local instances (or via Docker).
- **Git**.

---

## Status

Production hardening is complete in code: Docker staging, S3 storage adapter, inventory/refund fixes, worker jobs, admin operations tooling, and CI production builds.

**Still required before go-live:** live provider credentials and hosting — see [`PRODUCTION_HANDOFF.md`](./PRODUCTION_HANDOFF.md).

**API quick start (Docker — recommended)**

```bash
docker compose up --build
cd apps/api && npm run seed:admin   # once, with ADMIN_SEED_* env vars
```

**API quick start (local Node)**

```bash
cp .env.example apps/api/.env
cd apps/api && npm ci && npx prisma migrate deploy && npm run seed:admin && npm run dev
cd apps/api && npm run worker          # separate terminal
```

**Admin portal**

```bash
cd apps/admin && npm ci && npm run dev # http://localhost:5180
```

**Mobile app**

```bash
cd apps/mobile && flutter pub get && flutter run -d chrome
```

Release builds require `--dart-define=API_BASE_URL=https://api.example.com/v1`. Push requires `PUSH_ENABLED=true` plus Firebase dart-defines — see `apps/mobile/.env.production.example`.

Set `API_BASE_URL` / `VITE_API_BASE` to your local API (`http://localhost:3080`) when running clients against the backend. See [`config/local-ports.md`](./config/local-ports.md) — Moozhayil uses **3080–3081** and **5180**, not `3000–3005`.

**SMS OTP (local):** `SMS_PROVIDER_MODE=mock` logs the 6-digit code to the API console in development. Tests use `TEST_OTP_CODE` (default `123456`). Production requires `SMS_PROVIDER_MODE=live` plus MSG91 `MSG91_AUTH_KEY` and `MSG91_OTP_TEMPLATE_ID` (DLT-approved OTP template).

**Deployment:** see [`runbooks/DEPLOYMENT.md`](./runbooks/DEPLOYMENT.md)  
**Release sign-off:** see [`runbooks/RELEASE_CHECKLIST.md`](./runbooks/RELEASE_CHECKLIST.md)
