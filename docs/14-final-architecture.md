# 14 - Final Architecture
## Moozhayil Gold & Diamonds - Architecture Lock

This document is the single source of truth for implementation.

It resolves contradictions across the existing Markdown documents while preserving the product vision, premium UX, feature scope, and business intent. If any earlier document conflicts with this file, this file wins.

No production code should be written until this document and `15-development-roadmap.md` are approved.

---

## 1. Architecture Principles

### 1.1 Product Philosophy

The app exists to help modern Indian families own gold for life's important moments. The experience must feel calm, premium, emotionally intelligent, and trustworthy.

Decision: Keep the goal-led product model. Jewellery, gold accumulation, Dream Vault, My Gold, and Aura all remain part of the product.

Why: The philosophy document makes clear that the business is not only selling jewellery or schemes. The app must convert desire into ownership through trust, progress, and aspiration.

### 1.2 Technical Principle

Decision: Build a production-grade modular monolith first.

Implementation:
- Flutter app for iOS and Android.
- Node.js 20 LTS backend.
- Express 4 REST API.
- PostgreSQL 15 on AWS RDS.
- Prisma ORM.
- Redis-backed BullMQ queues.
- AWS S3 + CloudFront for media.
- Razorpay for payments and mandates.
- Firebase Admin SDK for push notifications.
- Winston + CloudWatch for backend logs.
- Sentry for Flutter and backend error reporting.

Why: This supports 100,000+ users without premature distributed-system complexity. Domain boundaries can later be split into services only after traffic, team size, and operational data justify it.

### 1.3 Product Constraints

Decision: No feature is simplified or removed in Architecture Lock.

Implementation:
- Aura remains.
- Dream Vault remains.
- Premium motion remains.
- AR Try-On remains.
- Referral remains.
- Admin and CMS are explicitly specified.
- Reconciliation, queues, caching, and audit logs are added as production necessities.

Why: The user's instruction is to fix inconsistencies, not redesign or reduce scope.

---

## 2. Naming and File Conventions

### 2.1 Flutter File Names

Decision: Flutter file names are always `snake_case.dart`.

Examples:
- Component class: `ProductCard`
- File: `product_card.dart`
- Path: `lib/components/cards/product_card.dart`

Why: `09-cursor-rules.md` requires snake_case file names, while `03-component-library.md` used PascalCase file paths. Dart and Flutter convention favors snake_case file names, while class names stay PascalCase.

### 2.2 Component Ownership

Decision: Reusable components live in `lib/components/`; feature-only widgets live inside `lib/features/{feature}/widgets/`.

Implementation:
- Shared reusable component: `lib/components/cards/product_card.dart`
- Feature-specific widget: `lib/features/home/widgets/hero_banner.dart`

Why: This resolves the conflict between the component library and the feature folder structure without duplicating widgets.

### 2.3 Backend File Names

Decision: Backend files use `snake_case.role.ts` if TypeScript is used, or `snake_case.role.js` if JavaScript is used. The project will use TypeScript.

Canonical backend names:
- `auth.routes.ts`
- `auth.controller.ts`
- `auth.service.ts`
- `auth.schema.ts`
- `auth.middleware.ts`

Why: TypeScript gives stronger contracts for financial and API code while preserving the Express architecture.

---

## 3. Canonical Folder Structure

### 3.1 Repository Structure

Decision: The repository contains separate `apps/mobile` and `apps/api` folders.

```
apps/
  mobile/
    lib/
    test/
    integration_test/
  api/
    src/
    prisma/
    tests/
docs/
```

Why: The original docs define Flutter and backend architecture but do not define repository-level boundaries. Separate app folders keep mobile and backend concerns clean without creating unnecessary microservices.

### 3.2 Flutter Structure

Canonical Flutter structure:

```
apps/mobile/lib/
  main.dart
  app.dart

  core/
    constants/
      colors.dart
      typography.dart
      spacing.dart
      radii.dart
      shadows.dart
      animations.dart
    models/
      user.dart
      goal.dart
      product.dart
      contribution.dart
      gold_balance.dart
      gold_ledger_entry.dart
      order.dart
      vault_item.dart
      notification.dart
      aura_session.dart
      address.dart
      payment_method.dart
    services/
      api_service.dart
      auth_service.dart
      storage_service.dart
      connectivity_service.dart
      notification_service.dart
    utils/
      currency_formatter.dart
      gold_formatter.dart
      date_formatter.dart
      validators.dart
    routing/
      app_routes.dart
      app_router.dart

  components/
    navigation/
    progress/
    cards/
    buttons/
    inputs/
    feedback/
    overlays/
    aura/
    product/

  features/
    auth/
    onboarding/
    home/
    shop/
    vault/
    goals/
    my_gold/
    aura/
    profile/
    orders/
    cart/
    notifications/
    store/
    referrals/
```

Why: The earlier docs listed most feature folders but missed `orders`, `cart`, `store`, and `referrals` despite defining routes and APIs for them.

### 3.3 Backend Structure

Canonical backend structure:

```
apps/api/src/
  app.ts
  server.ts

  config/
  db/
    prisma.ts
  middleware/
    auth.middleware.ts
    rate_limit.middleware.ts
    error.middleware.ts
    request_id.middleware.ts
  modules/
    auth/
    users/
    kyc/
    gold_rates/
    products/
    catalog/
    goals/
    contributions/
    gold_ledger/
    vault/
    cart/
    orders/
    payments/
    addresses/
    notifications/
    aura/
    cms/
    stores/
    referrals/
    admin/
  jobs/
    queues.ts
    processors/
  utils/
    money.ts
    gold.ts
    dates.ts
    idempotency.ts
    audit.ts
```

Why: The API spec contains many modules, webhooks, and jobs, but the original backend structure was not specified. This gives every feature exactly one backend home.

---

## 4. Routes and Navigation

### 4.1 Route System

Decision: Flutter uses `go_router`; all routes are constants in `core/routing/app_routes.dart`.

Why: This matches Cursor rules and prevents string-literal route drift.

### 4.2 Canonical App Routes

```
/onboarding
/onboarding/intent
/onboarding/name
/onboarding/kyc-intro

/auth
/auth/otp

/home
/shop
/shop/search
/shop/category/:categoryId
/shop/occasion/:occasionId
/shop/collection/:collectionId
/shop/product/:productId

/dream-vault

/goals
/goals/:goalId
/goals/:goalId/contribute
/goals/create
/goals/create/moment
/goals/create/piece
/goals/create/amount
/goals/create/payment
/goals/create/confirmation

/my-gold
/my-gold/redeem

/aura
/aura/conversation/:sessionId
/aura/goal-planning
/aura/product-discovery
/aura/gold-insights

/profile
/profile/kyc
/profile/kyc/aadhaar
/profile/kyc/aadhaar/otp
/profile/kyc/pan
/profile/kyc/selfie
/profile/kyc/review
/profile/kyc/pending
/profile/addresses
/profile/payment-methods

/orders
/orders/:orderId
/orders/confirmation/:orderId

/cart
/notifications
/store-locator
/referrals
```

### 4.3 Deep Links

Canonical inbound deep links:

```
/product/:productId       -> /shop/product/:productId
/collection/:collectionId -> /shop/collection/:collectionId
/vault                    -> /dream-vault
/goals/create             -> /goals/create
/aura                     -> /aura
```

Decision: `/dream-vault` is the only in-app route for the Dream Vault screen. `/vault` is accepted only as an inbound deep-link alias and immediately redirects.

Why: Earlier docs used both `/dream-vault` and `/vault`. This preserves compatibility while keeping one internal route.

---

## 5. API Conventions

### 5.1 API Base

Decision: Base URL is `https://api.moozhayil.com/v1`.

All responses are JSON.
All timestamps are ISO 8601 UTC.
All list endpoints use cursor pagination unless explicitly marked as small static reference data.

### 5.2 Money Units

Decision: All stored and API monetary values are integer paise.

Rules:
- ₹1 = `100` paise.
- ₹84,966 = `8496600` paise.
- ₹2,360 = `236000` paise.
- ₹6,240/g = `624000` paise per gram.

Why: Earlier docs had examples such as `84966000` with display `₹84,966`. That is incorrect. Integer paise avoids floating-point money errors and must be corrected everywhere.

### 5.3 Gold Units

Decision: Gold weights are decimal strings in API responses and `DECIMAL(10,4)` in PostgreSQL.

Rules:
- Internal gold precision: 4 decimal places.
- Display gold precision: exactly 1 decimal place.
- Display rounding: floor, never round up.
- Example: `37.4892` displays as `37.4g`.
- Example: `10.0000` displays as `10.0g`.

Why: Flooring avoids overstating customer-owned gold.

### 5.4 Price Calculation

Decision: Product prices are computed server-side from current gold rate at query time, cached briefly, and snapshotted at transaction time.

Formula:

```
gold_value_paise      = weight_grams * rate_per_gram_paise
making_charge_paise   = gold_value_paise * making_charge_pct / 100
wastage_paise         = gold_value_paise * wastage_pct / 100
base_price_paise      = gold_value_paise + making_charge_paise + wastage_paise + stone_value_paise
gst_paise             = base_price_paise * gst_pct / 100
total_paise           = base_price_paise + gst_paise
```

Rounding:
- Use Decimal.js for all price math.
- Round each monetary component to nearest paise using half-up rounding.
- Sum rounded components for the displayed total.
- Store order-time rounded component snapshots.

Why: Query-time pricing preserves live gold rates; transaction snapshots preserve legal and financial auditability.

### 5.5 Price Validity

Decision: Product API responses include `price_valid_until`.

Rules:
- Price validity window: 15 minutes after response generation.
- Product detail refetch interval: 10 minutes while the user remains on page.
- Before Buy Now, Add to Cart, Create Goal from product, or Confirm Redemption, the client must refresh if `price_valid_until` has passed.
- If price changes during checkout, backend returns `PRICE_CHANGED` with old and new price; client shows the premium confirmation UI.

Why: This reconciles 10-minute product polling with 15-minute transaction validity.

---

## 6. Canonical API Routes

### 6.1 Auth

```
POST /auth/send-otp
POST /auth/verify-otp
POST /auth/refresh
POST /auth/logout
```

Decision: Access tokens live for 1 hour. Refresh tokens are stored server-side as hashed session records and can be revoked.

Why: Earlier docs mentioned token refresh but did not specify revocation storage. Server-side sessions enable logout, admin revocation, and device tracking.

### 6.2 Users

```
GET /user/me
PATCH /user/me
POST /user/intent
POST /user/devices
DELETE /user/devices/:deviceId
GET /user/milestones/uncelebrated
POST /user/milestones/:id/celebrate
```

Decision: Replace single `push_token` on user with `user_devices`.

Why: Edge cases allow simultaneous sessions but previous schema only stored one push token. Multi-device requires one device row per install.

### 6.3 KYC

```
GET /kyc/status
POST /kyc/aadhaar/send-otp
POST /kyc/aadhaar/verify
POST /kyc/pan/verify
POST /kyc/selfie
POST /kyc/submit
```

Decision: KYC v1 supports two verification tiers:
- `basic_verified`: PAN + selfie OR Aadhaar + selfie.
- `enhanced_verified`: Aadhaar + PAN + selfie with name match.

For app gating, `basic_verified` counts as verified except:
- Monthly contribution above ₹50,000 requires `enhanced_verified`.
- Single transaction above ₹2,00,000 requires PAN, so Aadhaar-only users must add PAN before checkout.
- Transactions above ₹10,00,000 require admin SAR review before fulfillment.

Why: Earlier docs conflicted between optional Aadhaar/PAN and flows that collected both. Tiers preserve the full KYC flow while honoring regulatory distinctions.

### 6.4 Products and Catalog

```
GET /products
GET /products/:id
GET /products/:id/similar
GET /products/search
GET /categories
GET /collections
GET /occasions
```

Decision: `GET /products/search` uses PostgreSQL full-text search for launch, with a documented upgrade path to OpenSearch after measured need.

Why: This avoids premature search infrastructure while still giving one clear implementation.

### 6.5 Goals and Contributions

```
GET /goals
POST /goals
GET /goals/:id
PATCH /goals/:id
DELETE /goals/:id
POST /goals/:id/contribute
GET /contributions/pending
```

Decision: There is no client-facing `POST /contributions`. Autopay contributions are created by backend queue workers. Manual contributions use `POST /goals/:id/contribute`.

Why: User flows referenced `POST /contributions`, while the API spec used `POST /goals/:id/contribute`. Backend-owned autopay is safer and clearer.

### 6.6 Dream Vault

```
GET /vault
POST /vault
DELETE /vault/:itemId
```

Decision: API path is `/vault`; product language is "Dream Vault"; Flutter route is `/dream-vault`.

Why: Short API routes are fine internally. User-facing naming must follow the philosophy document.

### 6.7 Cart

```
GET /cart
POST /cart/items
DELETE /cart/items/:productId
DELETE /cart
```

Decision: Cart remains, even though the product page prioritizes Dream Vault and Buy Now.

Why: The top bar and edge cases require cart behavior. The premium UX can keep cart secondary without removing it.

### 6.8 Orders

```
GET /orders
GET /orders/:id
POST /orders
POST /orders/:id/cancel
```

Decision: Payment callbacks are not under `/orders`. Server-to-server callbacks use `/webhooks/payment`.

Why: Earlier docs had both `POST /orders/:id/payment-callback` and `/webhooks/payment`. Webhooks should be provider-facing and verified independently.

### 6.9 Payments

```
POST /payments/upi/verify
POST /payments/methods
GET /payments/methods
DELETE /payments/methods/:id
POST /payments/reconcile
```

Decision: Add explicit payment endpoints required by the goal creation flow.

Why: The flow referenced UPI verification, but the API spec omitted payment-method endpoints.

### 6.10 Addresses, Notifications, CMS, Stores, Referrals

```
GET /addresses
POST /addresses
PATCH /addresses/:id
DELETE /addresses/:id
POST /addresses/validate-pincode

GET /notifications
POST /notifications/:id/read
POST /notifications/read-all

GET /banners
GET /stores

GET /referrals/my-code
POST /referrals/apply
```

### 6.11 Webhooks

```
POST /webhooks/payment
POST /webhooks/kyc
POST /webhooks/gold-rate
```

Decision: Webhooks must verify provider signatures, persist raw payloads, and enqueue processing jobs.

Why: Financial and KYC webhooks must be auditable and retry-safe.

---

## 7. Database Architecture

### 7.1 Required Schema Corrections

Decision: The original schema is retained conceptually but must add missing production tables.

Required additional tables:
- `auth_sessions`
- `user_devices`
- `gold_ledger_entries`
- `idempotency_keys`
- `payment_transactions`
- `payment_mandates`
- `webhook_events`
- `admin_users`
- `audit_logs`
- `cms_banners`
- `serviceable_pincodes`
- `inventory_reservations`
- `job_runs`

Why: The existing schema covers product features but not production-grade auth, payments, auditability, idempotency, reconciliation, admin, or device behavior.

### 7.2 Gold Ledger

Decision: `gold_ledger_entries` is the authoritative balance source, not `contributions` alone.

Canonical balance:

```
SUM(gold_ledger_entries.grams_delta)
WHERE user_id = :userId
AND status = 'posted'
```

Ledger entry types:
- `contribution_credit`
- `bonus_credit`
- `redemption_debit`
- `refund_credit`
- `manual_adjustment_credit`
- `manual_adjustment_debit`

Why: Earlier docs said balance is the sum of completed contributions, but redemption and refunds require negative and positive ledger entries. A ledger is the only correct financial model.

### 7.3 Contributions

Decision: Contributions remain as domain records for goal payments, but every completed contribution creates a `gold_ledger_entries` credit.

Contribution statuses:
- `scheduled`
- `pending_payment`
- `processing`
- `completed`
- `payment_failed`
- `cancelled`
- `refunded`

Contribution types:
- `autopay`
- `manual`
- `bonus`
- `adjustment`

Why: Previous statuses missed scheduled autopay and conflated failure with goal state.

### 7.4 Goal Status

Database goal statuses:
- `active`
- `contribution_due`
- `paused`
- `completed`
- `cancelled`

UI display labels:
- `active` -> "On Track"
- `contribution_due` -> "Contribution Due"
- `paused` -> "Paused"
- `completed` -> "Goal Achieved"
- `cancelled` -> not shown in active list

Why: UI used `on_track` while DB used `active`. The DB stores lifecycle truth; UI maps it into emotional language.

### 7.5 Order Status

Canonical order statuses:
- `draft`
- `pending_payment`
- `confirmed`
- `processing`
- `shipped`
- `delivered`
- `delivery_failed`
- `cancelled`
- `refund_initiated`
- `refunded`

Why: Edge cases require `delivery_failed` and refund states, while the original schema omitted them.

### 7.6 KYC Status

Canonical user KYC statuses:
- `not_started`
- `in_progress`
- `in_review`
- `basic_verified`
- `enhanced_verified`
- `rejected`

For UI:
- `basic_verified` and `enhanced_verified` show as "Verified Member" unless enhanced KYC is specifically required.

Why: This resolves `pending`, `none`, `verified`, and `in_review` inconsistencies.

### 7.7 Product Purity

Decision: Product purity enum is `14k`, `18k`, `22k`, `24k`, but gold goal accumulation and redemption use the current `22k` rate.

Why: Product catalog may include 14K, but goals are defined as 22K gold accumulation in business rules.

---

## 8. Business Rules

### 8.1 Goals

Rules:
- Only KYC-verified users can create goals.
- Goal duration options: 12, 18, 24, 36 months.
- Maximum active goals: 5.
- Minimum monthly contribution: ₹1,000.
- Standard maximum monthly contribution with `basic_verified`: ₹50,000.
- Enhanced KYC maximum monthly contribution: ₹2,00,000.
- Same product may be attached to multiple goals.
- Product attachment is not a stock reservation.

Decision: The amount slider shows ₹1,000 to ₹50,000 by default. If the user has enhanced KYC, the UI can expose an advanced amount path up to ₹2,00,000.

Why: This preserves the premium simple flow while honoring the larger verified-user limit.

### 8.2 Missed Contributions

Rules:
- Scheduled contribution date passes with no payment: contribution remains `scheduled`.
- After 7 days: goal status becomes `contribution_due`.
- After 30 days: goal status becomes `paused`.
- Making up payment within 30 days preserves bonus eligibility.
- Pausing manually forfeits bonus eligibility.

Why: This reconciles grace period, UI badge, and paused-goal edge cases.

### 8.3 Bonus

Decision: Bonus is credited as a `bonus` contribution and a `bonus_credit` ledger entry within 24 hours after eligible completion.

Why: This keeps bonus visible in contribution history and financially correct in ledger.

### 8.4 Redemption

Decision: Redemptions create order records and `redemption_debit` ledger entries in one transaction after stock and price validation.

Rules:
- Full gold redemption requires sufficient gold balance.
- Partial redemption is allowed with UPI/card for the remainder.
- Current 22K rate values the user's gold.
- Order snapshots preserve product price, gold rate, ledger impact, and address.

Why: This resolves the earlier balance formula that could not represent making charges, GST, refunds, or partial payment safely.

---

## 9. KYC and Compliance

### 9.1 Feature Gating

No KYC required:
- Browse products.
- Save to Dream Vault.
- Add to cart.
- Place cash/card/UPI orders up to ₹50,000.

KYC required:
- Create goal.
- Make contribution.
- Redeem gold.
- Place any order above ₹50,000.

Enhanced KYC required:
- Monthly contribution above ₹50,000.
- Transactions requiring both PAN and Aadhaar by policy.

PAN required:
- Jewellery transaction above ₹2,00,000.

Admin review required:
- Transaction above ₹10,00,000 before fulfillment.

Why: This reconciles product flow, API auth markers, business rules, and regulatory notes.

### 9.2 PII Handling

Decision: Aadhaar, PAN, selfie references, webhook payloads, and KYC provider responses are encrypted at rest and redacted from logs.

Why: KYC data is sensitive and must never appear in logs or analytics.

---

## 10. Payments

### 10.1 Payment Provider

Decision: Razorpay is the canonical payment provider for UPI, cards, netbanking, refunds, and autopay mandates.

Why: It is already specified and covers the required payment surfaces.

### 10.2 Payment Transactions

Decision: Every payment attempt creates a `payment_transactions` row.

Statuses:
- `created`
- `pending`
- `authorized`
- `captured`
- `failed`
- `refund_initiated`
- `refunded`
- `reconciled`

Why: Orders and contributions should not store gateway state directly as their only source of payment truth.

### 10.3 Idempotency

Decision: Idempotency keys are required on:
- `POST /orders`
- `POST /goals`
- `POST /goals/:id/contribute`

Why: The docs required keys for orders and goals, and contribution timeouts have the same double-debit risk.

### 10.4 Reconciliation

Decision: A queue job reconciles pending payment transactions older than 10 minutes and webhook events that are received out of order.

Why: This directly implements the payment timeout edge case.

---

## 11. Dream Vault

Decision: The product concept is always "Dream Vault". The word "wishlist" is banned from user-facing copy.

Implementation:
- UI component may be named `VaultHeartButton`, not `WishlistHeart`.
- API fields: `is_in_vault`, not `is_wishlisted`.
- Profile row: "Dream Vault", not "My Wishlist".
- Icon may remain heart-like if visually premium, but code and copy must use vault naming.

Why: The philosophy document explicitly says Dream Vault is not a wishlist.

---

## 12. Aura

Decision: Aura is a structured jewellery advisor with optional conversational follow-up.

Implementation:
- Aura never presents itself as ChatGPT, support, or a bot.
- Structured flows are first-class: goal planning, product discovery, gold insights.
- Chat sessions expire after 24 hours.
- Session return shows summary, not full replay.
- Aura recommendations must filter out out-of-stock and deleted products.
- Budget may expand up to 20% only for "closest options".

Why: This preserves the premium advisor experience and resolves open-ended chat risk with bounded recommendation rules.

---

## 13. Admin Panel and CMS

Decision: Admin is required for production and lives in the backend domain. A web admin UI may be added under `apps/admin` after API foundations.

Admin capabilities:
- Product CRUD and publishing.
- Product image upload and ordering.
- Category, collection, occasion management.
- Banner CMS management.
- Gold rate manual override and audit.
- KYC review and rejection reasons.
- Order status updates.
- Refund and delivery failure handling.
- SAR review for high-value transactions.
- User support account lookup.
- Manual gold ledger adjustments with mandatory reason.

Why: Existing edge cases already depend on admin behavior, but the original docs did not specify the admin implementation.

---

## 14. Caching

Decision: Redis is the canonical backend cache; Hive is the canonical Flutter cache.

Backend cache:
- Current gold rates: 60 seconds.
- Categories, collections, occasions: 10 minutes.
- Banners: 5 minutes.
- Product listing pages: 60 seconds by filter key.
- Product details: 60 seconds.
- Aura home insight: 15 minutes per user.

Frontend cache:
- Secure tokens in `flutter_secure_storage`.
- Non-sensitive cache in Hive.
- Last successful home payload cached for offline display.
- Dream Vault and goals can show cached read-only state offline.

Why: This satisfies premium performance without stale transaction decisions.

---

## 15. Queue Jobs

Decision: BullMQ with Redis is the canonical queue implementation.

Queues:
- `payments`
- `autopay`
- `notifications`
- `gold_rates`
- `kyc`
- `aura`
- `reconciliation`
- `cms`

Required jobs:
- Process autopay contributions.
- Reconcile pending payments.
- Send push notifications.
- Refresh gold rates.
- Alert on stale rates older than 8 hours.
- Process KYC webhooks.
- Generate Aura insight cache.
- Recompute gold balance snapshots.
- Expire stale inventory reservations.

Why: Pushes, payments, KYC, and Aura must not block request handlers.

---

## 16. Infrastructure

Decision: Production runs on AWS ECS Fargate, not unmanaged EC2.

Canonical infrastructure:
- ECS Fargate service for API.
- ECS scheduled tasks or worker services for queues.
- RDS PostgreSQL 15.
- ElastiCache Redis.
- S3 for media.
- CloudFront CDN.
- CloudWatch logs and alarms.
- AWS Secrets Manager for secrets.
- Route 53 and ACM for DNS/TLS.

Why: Earlier docs allowed EC2 or ECS. ECS is the locked choice because it is easier to scale and operate safely for a small team.

---

## 17. Observability and Audit

Decision: Production must include logs, metrics, traces, alerts, and audit logs before launch.

Required:
- Request ID on every backend request.
- Structured JSON logs.
- Sentry for exceptions.
- CloudWatch alarms for error rate, latency, queue depth, stale gold rate, webhook failures, payment reconciliation failures.
- Audit log for admin actions, gold rate changes, KYC decisions, ledger adjustments, refunds, and order status changes.

Why: Financial and KYC systems cannot rely on ad hoc debugging.

---

## 18. Security

Decision: Security controls are part of MVP production readiness.

Rules:
- JWT access tokens contain only `userId`, `sessionId`, and coarse KYC tier.
- Refresh tokens are stored hashed in `auth_sessions`.
- Aadhaar/PAN never appear in JWTs, logs, analytics, notifications, or Aura prompts.
- Rate limits apply to all sensitive endpoints.
- Webhooks require signature verification.
- Admin routes require admin auth and role checks.
- S3 uploads use signed URLs.

Why: The app handles payments, gold ownership, and regulated identity data.

---

## 19. Principal Engineer Hardening Addendum

This section was added after a destructive design review of the locked architecture. These decisions are not optional. They close production failure modes that would otherwise appear after launch.

### 19.1 Database Connections and Pooling

Decision: API and worker services must connect to PostgreSQL through RDS Proxy or PgBouncer. Direct unbounded Prisma-to-RDS connections are forbidden in production.

Rules:
- Each ECS task has a strict Prisma connection limit.
- API and worker pools are configured separately.
- RDS connection saturation alarms are mandatory.
- Load tests must prove connection stability at expected concurrency before launch.

Why: ECS Fargate horizontal scaling plus Prisma can exhaust PostgreSQL connections long before CPU or memory become bottlenecks.

### 19.2 Transactional Outbox

Decision: Any database transaction that must trigger asynchronous side effects writes an outbox row in the same transaction.

Outbox applies to:
- Contribution completed.
- Ledger entry posted.
- Order confirmed.
- Refund initiated.
- KYC status changed.
- Goal completed.
- Milestone reached.
- Product went out of stock.

Why: Without an outbox, the system can commit money or status changes while losing the notification, queue job, analytics event, or reconciliation task.

### 19.3 Queue Worker Semantics

Decision: All queue processors must be idempotent.

Rules:
- Jobs have stable deduplication keys.
- Retried jobs must be safe.
- Poison jobs move to a dead-letter queue after configured retries.
- Queue depth, retry rate, and dead-letter count have alarms.
- Queue workers do not trust job payloads as source of truth; they reload authoritative database state.

Why: BullMQ guarantees delivery attempts, not exactly-once business effects.

### 19.4 Append-Only Ledger

Decision: `gold_ledger_entries` is append-only in production.

Rules:
- Posted ledger entries are never updated or deleted.
- Corrections use reversal entries and new corrected entries.
- Every ledger entry has `correlation_id`, `source_type`, `source_id`, `idempotency_key`, and `posted_at`.
- Ledger entries require a non-zero `grams_delta` except explicit audit marker entries approved by architecture.
- Manual ledger adjustments require admin maker-checker approval.

Why: A mutable ledger destroys auditability, dispute resolution, and customer trust.

### 19.5 PostgreSQL Indexing, Partitioning, and Retention

Decision: Append-heavy tables must have partition and retention plans before production.

Partition candidates:
- `gold_ledger_entries`
- `payment_transactions`
- `webhook_events`
- `notifications`
- `product_views`
- `audit_logs`
- `job_runs`

Rules:
- `product_views` retention is 90 days unless converted into aggregated analytics.
- `webhook_events`, `audit_logs`, ledger, payment, KYC, and order records follow legal retention requirements and are not casually purged.
- Every high-traffic endpoint must have an `EXPLAIN ANALYZE` review before launch.

Why: These tables grow continuously. Without partitioning and retention, queries and maintenance degrade slowly until production becomes expensive and fragile.

### 19.6 Inventory Reservation Lifecycle

Decision: Checkout uses explicit inventory reservations.

Lifecycle:
- `reserved`: stock held for a pending checkout or pending payment.
- `confirmed`: reservation converted into order ownership after payment or gold redemption succeeds.
- `released`: reservation released after cancellation, failed payment, timeout, or admin action.
- `expired`: reservation automatically expired by job.

Rules:
- Reservation creation is atomic and conditional on available stock.
- Reservation expiry is enforced by a queue job.
- Order confirmation consumes an existing reservation, not raw product stock.
- Admin stock edits account for active reservations.

Why: Atomic decrement alone is insufficient for pending-payment flows, and reservations without lifecycle rules create stuck stock.

### 19.7 Payment and Webhook State Machines

Decision: Payment, order, contribution, KYC, and refund state transitions must be monotonic and validated.

Rules:
- Webhook provider event IDs are unique.
- Duplicate webhook events are acknowledged but ignored after first processing.
- Out-of-order events are stored and reconciled against provider state.
- A later weaker state cannot overwrite a stronger final state.
- Refund and capture events are correlated to internal `payment_transactions`.

Why: Payment providers can send duplicate, delayed, or out-of-order events. The app cannot trust webhook arrival order.

### 19.8 API Compatibility and Versioning

Decision: `/v1` APIs are backward-compatible for released mobile clients.

Rules:
- Existing response fields are not removed or type-changed inside `/v1`.
- New fields must be optional from the mobile client's perspective.
- Breaking changes require `/v2`.
- Deprecation window is at least two supported mobile app releases.
- API contract tests are required between backend DTOs and Flutter models.

Why: Mobile clients remain in the wild after backend deploys. Backend-only compatibility thinking will break users.

### 19.9 Flutter State and Riverpod Policy

Decision: Riverpod providers must have explicit lifetime and invalidation rules.

Rules:
- Network-backed feature state uses generated `AsyncNotifier` or `FutureProvider` patterns.
- Mutations invalidate only the providers they affect.
- No API calls occur inside widget `build()` methods.
- Long-lived providers are reserved for auth, app configuration, connectivity, and current user session.
- Feature providers are scoped by route or family parameters where appropriate.
- Payment, KYC, and goal-creation flows persist draft state outside widget state.

Why: Without provider discipline, the app will develop stale balances, duplicate network calls, excessive rebuilds, and fragile multi-step flows.

### 19.10 GoRouter Auth and Deep-Link State Machine

Decision: Navigation guards must be implemented as a single auth and KYC redirect state machine.

Rules:
- Auth redirect stores exactly one intended route.
- Token refresh runs before redirecting to auth when possible.
- Deep links survive auth and KYC completion.
- Payment and KYC routes are protected against redirect loops.
- Unknown routes land on a premium not-found screen with safe navigation back to Home.

Why: Auth, KYC, payment resume, and push deep links intersect. Ad hoc guards will create loops and lost user intent.

### 19.11 Cache Invalidation

Decision: TTL caching is not enough. Cache invalidation must be event-driven for mutable business data.

Rules:
- Product publish, product stock change, price-affecting gold rate change, CMS banner update, category update, collection update, and occasion update invalidate affected Redis keys.
- Product list cache keys include filters, cursor, auth personalization bit, and price version.
- Transaction endpoints never trust cached price, stock, balance, KYC, or payment state.
- Flutter cache is read-only offline and must refresh after mutations.

Why: Stale cached catalog data is acceptable briefly for browsing, but stale transaction data causes financial and trust failures.

### 19.12 Redis Failure Mode

Decision: Redis is never the source of truth.

Rules:
- If Redis is unavailable, core browse APIs may degrade to database reads.
- Payment, ledger, order, KYC, and auth correctness must not depend solely on Redis.
- Rate limiting may fail closed for sensitive endpoints and fail open only for low-risk public catalog endpoints.
- Queue outage triggers operational alerts and pauses non-critical async work.

Why: Redis improves speed and queueing, but correctness must remain in PostgreSQL and provider reconciliation.

### 19.13 S3 and CDN Controls

Decision: All original uploads are private in S3. Public access is through CloudFront only.

Rules:
- Product images are served via CloudFront.
- KYC selfies and documents are never public.
- Admin uploads use signed URLs with content type and size limits.
- Image derivatives are generated for mobile-friendly sizes.
- CloudFront cache invalidation is required for replaced product and CMS images.

Why: Public buckets and oversized images create security, cost, and performance failures.

### 19.14 Admin Risk Controls

Decision: Admin actions that affect money, KYC, gold rates, refunds, stock, or ledger require stronger controls.

Rules:
- Admin roles are least-privilege.
- Maker-checker approval is required for manual ledger adjustments, gold rate overrides, high-value refunds, and SAR decisions.
- Step-up authentication is required for sensitive actions.
- Admin sessions are shorter than customer sessions.
- Every sensitive action records before and after values in `audit_logs`.

Why: Admin is the highest-risk surface in the system. One compromised admin account can cause financial and reputational damage.

### 19.15 Disaster Recovery

Decision: Production must define and test recovery targets.

Targets:
- RPO: 5 minutes for PostgreSQL.
- RTO: 4 hours for API and database service restoration.

Rules:
- RDS point-in-time recovery is enabled.
- Daily snapshots are retained according to business and legal policy.
- Restore drills happen before launch and quarterly after launch.
- Runbooks exist for database restore, Redis loss, queue backlog, stale gold rate, webhook outage, payment provider outage, and KYC provider outage.

Why: Backups that are never restored are not a recovery plan.

### 19.16 CI/CD and Database Migrations

Decision: Deployments use progressive rollout and expand-contract migrations.

Rules:
- Migrations are backward-compatible with the currently released backend.
- Destructive schema changes require a separate cleanup release after all code stops using old fields.
- Staging deploys run smoke tests before production deploys.
- Production deploys can roll back application code without rolling back already-applied migrations.
- Mobile releases use feature flags for backend-dependent features.

Why: Bad migrations and incompatible deploys are among the most common causes of avoidable outages.

### 19.17 API Testing and Contract Testing

Decision: Contract tests are mandatory for API DTOs and Flutter models.

Required test classes:
- Price calculation tests.
- Ledger invariant tests.
- Payment state transition tests.
- Webhook replay tests.
- KYC state transition tests.
- Order stock concurrency tests.
- API response contract tests.
- Flutter parsing tests for unknown and missing non-critical fields.

Why: Unit tests alone will not catch backend/mobile contract drift or financial invariants.

### 19.18 Analytics

Decision: Privacy-safe analytics are required from the first production release.

Rules:
- No Aadhaar, PAN, phone number, address, raw chat text, or payment identifiers in analytics.
- Define event taxonomy for onboarding, KYC, product view, Dream Vault save, goal creation, contribution, checkout, redemption, Aura flow, referral, and support contact.
- Critical business metrics are computed server-side from authoritative tables where possible.

Why: Without analytics, the business cannot understand conversion, trust drop-offs, goal creation, redemption behavior, or Aura value.

### 19.19 Aura Safety and Cost Boundary

Decision: Aura uses a backend context builder and structured response schemas.

Rules:
- Aura never receives raw KYC identifiers, full addresses, payment tokens, or phone numbers.
- Product recommendations are post-filtered by backend business rules after model output.
- Free chat and structured flows have separate quotas.
- LLM cost is tracked per user and per flow.
- Cached insight generation is preferred over real-time generation for Home.
- Aura responses that imply investment, legal, or guaranteed returns are blocked or rewritten.

Why: Aura can create privacy, safety, and cost failures if treated as a normal chat endpoint.

### 19.20 Real-Time Updates

Decision: V1 does not use WebSockets. Real-time-like behavior is implemented with app resume refresh, targeted polling, push notifications, and cache invalidation.

Rules:
- Product detail polls price every 10 minutes while visible.
- Payment and contribution pending states refresh on app resume and via explicit pending endpoints.
- Push notifications carry deep links, not authoritative state.
- WebSockets can be reconsidered only after measured need.

Why: WebSockets add operational complexity that is not required for the current product interactions.

### 19.21 Cost Controls

Decision: Cost controls are part of production readiness.

Rules:
- CloudWatch log retention is explicitly configured.
- S3 lifecycle policies clean unused derivatives and failed uploads.
- CloudFront image sizes are optimized for mobile.
- Aura and KYC provider usage have budget alarms.
- RDS and Redis instance sizes are reviewed after load testing.

Why: Premium UX should not mean uncontrolled infrastructure or AI costs.

---

## 20. Final Contradiction Resolutions

| Area | Final Decision | Why |
|---|---|---|
| Money examples | Correct paise math everywhere; ₹84,966 = `8496600` paise | Prevent financial defects |
| Product file paths | Snake_case files, PascalCase classes | Dart convention and Cursor rules |
| Dream Vault route | App route `/dream-vault`, API `/vault` | User-facing clarity, compact API |
| Wishlist naming | Remove user-facing wishlist; use Dream Vault | Philosophy requires it |
| KYC states | `not_started`, `in_progress`, `in_review`, `basic_verified`, `enhanced_verified`, `rejected` | Resolves pending/none/verified drift |
| KYC requirements | Basic and enhanced tiers | Reconciles UX and regulation |
| Orders KYC | KYC only above ₹50,000 or gold redemption | Matches business rules |
| Contributions API | Manual via `/goals/:id/contribute`; autopay via jobs | Prevents unsafe client-owned autopay |
| Gold balance | Ledger is authoritative | Redemptions and refunds require debits/credits |
| Order status | Add `delivery_failed`, `refund_initiated` | Edge cases require them |
| Push tokens | `user_devices`, not one user field | Supports multi-device sessions |
| Payment callback | `/webhooks/payment` only | Provider-facing webhooks must be separate |
| Queue library | BullMQ | Modern Redis queue implementation |
| Infrastructure | ECS Fargate | One scalable deployment path |
| Search | PostgreSQL full-text for launch | One implementation without premature infra |
| Admin | Required production domain | Existing flows depend on it |
| CMS | Backend-managed banner/catalog content | Home and catalog depend on dynamic content |
| Database pooling | RDS Proxy or PgBouncer required | Prevent connection exhaustion under ECS scaling |
| Ledger mutability | Append-only ledger with reversals | Preserve auditability and customer trust |
| Webhooks | Idempotent, ordered state machines | Handle duplicate and out-of-order provider events |
| Inventory | Reservation lifecycle required | Prevent oversell and stuck stock |
| API versioning | `/v1` backward-compatible for released mobile apps | Prevent backend deploys from breaking installed clients |
| Cache invalidation | TTL plus event-driven invalidation | Prevent stale product, stock, price, and CMS data |
| Redis | Cache and queue only, never source of truth | Preserve correctness during Redis failures |
| Admin risk | RBAC, maker-checker, step-up auth | Reduce financial and operational blast radius |
| Disaster recovery | RPO 5 minutes, RTO 4 hours, restore drills | Make backups operationally real |
| Aura safety | Redacted context, schemas, quotas, post-filters | Prevent privacy, hallucination, and cost failures |

---

## 21. Architecture Lock Rule

Any future request that changes the following requires explicit approval before implementation:
- Architecture.
- Folder structure.
- Routes.
- Design tokens.
- Typography.
- Providers.
- Models.
- Backend API.
- Authentication.
- Database schema.
- Navigation hierarchy.
- Gold ledger rules.
- Payment lifecycle.
- KYC lifecycle.
- Order lifecycle.
- Database pooling.
- Ledger immutability.
- Webhook state machines.
- Inventory reservation lifecycle.
- API compatibility policy.
- Disaster recovery targets.

Why: These are now locked foundations. Changing them casually would reintroduce architectural debt.
