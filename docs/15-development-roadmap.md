# 15 - Development Roadmap
## Moozhayil Gold & Diamonds - Build Plan From Day 1 to Production

This roadmap follows `14-final-architecture.md`.

No phase should begin until the previous phase meets its Definition of Done unless explicitly approved.

---

## Phase 1 - Architecture Foundation

### Goal

Create the production-ready repository structure, shared conventions, environment configuration, and quality gates without building product features.

### Folders Involved

- `apps/mobile/`
- `apps/api/`
- `docs/`
- `.github/`

### Files to Create

- `apps/mobile/pubspec.yaml`
- `apps/mobile/lib/main.dart`
- `apps/mobile/lib/app.dart`
- `apps/mobile/lib/core/routing/app_routes.dart`
- `apps/mobile/lib/core/routing/app_router.dart`
- `apps/api/package.json`
- `apps/api/tsconfig.json`
- `apps/api/src/app.ts`
- `apps/api/src/server.ts`
- `apps/api/src/config/env.ts`
- `apps/api/src/middleware/error.middleware.ts`
- `apps/api/src/middleware/request_id.middleware.ts`
- `.github/workflows/ci.yml`
- `.env.example`

### Backend Work

- Initialize Node.js 20 TypeScript Express app.
- Add request ID middleware.
- Add global error response shape.
- Add environment validation.
- Add health endpoint.
- Add lint, typecheck, and test scripts.

### Flutter Work

- Initialize Flutter app.
- Add `go_router`, Riverpod, Dio, Hive, secure storage, cached images, SVG, reactive forms, Freezed, and JSON serialization dependencies.
- Define route constants only.
- Add empty app shell placeholder.

### Database Work

- Initialize Prisma.
- Add empty migration baseline.
- Configure PostgreSQL connection.

### Testing

- Backend health endpoint test.
- Backend error middleware test.
- Flutter smoke test.
- CI runs backend lint, backend typecheck, backend tests, Flutter analyze, Flutter tests.

### Definition of Done

- CI passes.
- Backend starts locally.
- Flutter app starts locally.
- No product screens implemented.
- Environment variables documented in `.env.example`.

### Dependencies

- Approved `14-final-architecture.md`.

### Risk Level

Low.

### Estimated Complexity

Medium.

---

## Phase 2 - Design System and App Shell

### Goal

Implement the locked premium visual system, navigation shell, shared UI primitives, loading/error/offline behavior, and routing skeleton.

### Folders Involved

- `apps/mobile/lib/core/constants/`
- `apps/mobile/lib/components/`
- `apps/mobile/lib/features/*/screens/`
- `apps/mobile/lib/core/services/`

### Files to Create

- `colors.dart`
- `typography.dart`
- `spacing.dart`
- `radii.dart`
- `shadows.dart`
- `animations.dart`
- `top_app_bar.dart`
- `bottom_tab_bar.dart`
- `navigation_drawer.dart`
- `primary_button.dart`
- `secondary_button.dart`
- `ghost_button.dart`
- `destructive_button.dart`
- `text_input.dart`
- `slider_input.dart`
- `loading_shimmer.dart`
- `empty_state.dart`
- `error_state.dart`
- `offline_banner.dart`
- `confirmation_bottom_sheet.dart`
- `connectivity_service.dart`

### Backend Work

- None beyond serving `/health`.

### Flutter Work

- Implement all design tokens exactly once.
- Implement shared navigation components.
- Implement shared buttons, inputs, feedback, and overlay primitives.
- Implement root connectivity wrapper.
- Create placeholder screens for all canonical routes.
- Use shimmer for content loading states.
- Use route constants only.

### Database Work

- None.

### Testing

- Widget tests for buttons, offline banner, app shell, and routing.
- Golden tests for core visual primitives if tooling is available.
- Accessibility checks for minimum tap targets and text scaling.

### Definition of Done

- Every canonical route can be opened.
- No route string literals outside routing definitions.
- No hardcoded colors, spacing, typography, radii, or animation durations in widgets.
- Offline banner appears globally.

### Dependencies

- Phase 1.

### Risk Level

Low.

### Estimated Complexity

Medium.

---

## Phase 3 - Database, Auth, Users, and Sessions

### Goal

Build the identity foundation: phone OTP auth, sessions, user profile, onboarding intent persistence, device registration, and secure token handling.

### Folders Involved

- `apps/api/src/modules/auth/`
- `apps/api/src/modules/users/`
- `apps/api/prisma/`
- `apps/mobile/lib/features/auth/`
- `apps/mobile/lib/features/onboarding/`
- `apps/mobile/lib/core/services/`
- `apps/mobile/lib/core/models/`

### Files to Create

- `auth.routes.ts`
- `auth.controller.ts`
- `auth.service.ts`
- `auth.schema.ts`
- `auth.middleware.ts`
- `users.routes.ts`
- `users.controller.ts`
- `users.service.ts`
- `users.schema.ts`
- `schema.prisma`
- `user.dart`
- `auth_service.dart`
- `api_service.dart`
- `storage_service.dart`
- `auth_provider.dart`
- `onboarding_provider.dart`
- `auth_screen.dart`
- `otp_screen.dart`
- `splash_screen.dart`
- `intent_screen.dart`
- `name_screen.dart`
- `kyc_intro_screen.dart`

### Backend Work

- Implement OTP send and verify flow.
- Implement access and refresh tokens.
- Store hashed refresh tokens in `auth_sessions`.
- Implement logout and refresh.
- Implement `GET /user/me`, `PATCH /user/me`, `POST /user/intent`.
- Implement `POST /user/devices`.
- Add rate limiting for OTP endpoints.

### Flutter Work

- Implement onboarding splash, intent, name, and KYC intro screens.
- Implement phone auth and OTP screens.
- Store tokens in secure storage.
- Add Dio auth interceptor with refresh and retry.
- Restore intended route after auth.
- Store partial multi-step form state if refresh fails.

### Database Work

- Create `users`.
- Create `auth_sessions`.
- Create `user_intents`.
- Create `user_devices`.
- Add indexes on phone, sessions, and user devices.

### Testing

- Backend auth unit and integration tests.
- Token refresh tests.
- Rate-limit tests.
- Flutter auth flow widget tests.
- Secure storage and route guard tests.

### Definition of Done

- New user can complete onboarding and land on Home.
- Existing user can log in and restore session.
- Logout revokes current session.
- Multi-device sessions are supported.
- Push device token can be registered.

### Dependencies

- Phase 2.

### Risk Level

Medium.

### Estimated Complexity

High.

---

## Phase 4 - Catalog, CMS, Gold Rates, and Search

### Goal

Build the browseable jewellery catalog with live server-computed pricing, CMS banners, categories, collections, occasions, product detail, and launch search.

### Folders Involved

- `apps/api/src/modules/products/`
- `apps/api/src/modules/catalog/`
- `apps/api/src/modules/gold_rates/`
- `apps/api/src/modules/cms/`
- `apps/api/src/modules/admin/`
- `apps/mobile/lib/features/shop/`
- `apps/mobile/lib/features/home/`
- `apps/mobile/lib/components/cards/`
- `apps/mobile/lib/components/product/`

### Files to Create

- `products.routes.ts`
- `products.controller.ts`
- `products.service.ts`
- `products.schema.ts`
- `catalog.routes.ts`
- `catalog.service.ts`
- `gold_rates.routes.ts`
- `gold_rates.service.ts`
- `cms.routes.ts`
- `cms.service.ts`
- `money.ts`
- `gold.ts`
- `product.dart`
- `product_card.dart`
- `collection_card.dart`
- `occasion_chip.dart`
- `product_image_gallery.dart`
- `product_specs_row.dart`
- `price_breakdown_sheet.dart`
- `shop_screen.dart`
- `search_screen.dart`
- `product_list_screen.dart`
- `product_detail_screen.dart`
- `collection_screen.dart`
- `occasion_screen.dart`
- `products_provider.dart`
- `search_provider.dart`
- `product_detail_provider.dart`

### Backend Work

- Implement gold rate storage and current-rate lookup.
- Implement product price calculation using Decimal.js.
- Implement product list, detail, similar, and search endpoints.
- Implement categories, collections, occasions.
- Implement CMS banners.
- Add Redis cache for catalog and gold rates.
- Add admin-only product and CMS management APIs as backend capability, even if admin UI comes later.

### Flutter Work

- Implement Shop, product listing, search, product detail, collection, and occasion screens.
- Implement ProductCard and related catalog components.
- Implement price validity and product detail refetch behavior.
- Implement image fallback placeholder.
- Implement search recent terms locally.
- Implement home CMS sections: HeroBanner, OccasionDiscovery, FeaturedCollections, TrustAnchors.

### Database Work

- Create `gold_rate_history`.
- Create `products`.
- Create `product_images`.
- Create `categories`.
- Create `collections`.
- Create `occasions`.
- Create `product_occasion_tags`.
- Create `cms_banners`.
- Create product search indexes.

### Testing

- Price calculation unit tests with paise-correct examples.
- Product API integration tests.
- Search sanitization tests.
- Flutter product card state tests.
- Product detail price refresh tests.
- Cache invalidation tests.

### Definition of Done

- Product list and detail use server-computed paise values.
- ₹84,966 is represented as `8496600` paise everywhere.
- Product cards handle loading, out of stock, new badge, and vault state placeholders.
- Search works for products, categories, and collections.
- CMS banners render and cache correctly.

### Dependencies

- Phase 3.

### Risk Level

Medium.

### Estimated Complexity

High.

---

## Phase 5 - Dream Vault, Cart, Addresses, and Guest Handoff

### Goal

Build desire capture and purchase preparation: Dream Vault, cart, address management, serviceability, and unauthenticated save handoff.

### Folders Involved

- `apps/api/src/modules/vault/`
- `apps/api/src/modules/cart/`
- `apps/api/src/modules/addresses/`
- `apps/mobile/lib/features/vault/`
- `apps/mobile/lib/features/cart/`
- `apps/mobile/lib/features/profile/`
- `apps/mobile/lib/components/overlays/`

### Files to Create

- `vault.routes.ts`
- `vault.controller.ts`
- `vault.service.ts`
- `vault.schema.ts`
- `cart.routes.ts`
- `cart.controller.ts`
- `cart.service.ts`
- `addresses.routes.ts`
- `addresses.controller.ts`
- `addresses.service.ts`
- `vault_item.dart`
- `address.dart`
- `dream_vault_screen.dart`
- `dream_vault_card.dart`
- `dream_vault_preview_row.dart`
- `goal_start_bottom_sheet.dart`
- `cart_screen.dart`
- `addresses_screen.dart`
- `vault_provider.dart`
- `cart_provider.dart`
- `addresses_provider.dart`

### Backend Work

- Implement `GET /vault`, `POST /vault`, `DELETE /vault/:itemId`.
- Implement guest handoff contract: client syncs locally stored product IDs after auth.
- Implement `GET /cart`, `POST /cart/items`, `DELETE /cart/items/:productId`, `DELETE /cart`.
- Implement addresses and pincode validation.
- Ensure cart and vault return current prices.

### Flutter Work

- Replace wishlist naming with Dream Vault naming.
- Implement Save to Dream Vault actions from product cards and product detail.
- Implement guest auth prompt and post-auth vault sync.
- Implement Dream Vault screen and preview row.
- Implement cart screen.
- Implement address management screens.

### Database Work

- Create `dream_vault_items`.
- Create `cart_items`.
- Create `addresses`.
- Create `serviceable_pincodes`.
- Add unique active vault and cart constraints.

### Testing

- Vault add/remove integration tests.
- Duplicate vault conflict tests.
- Guest handoff tests.
- Cart current-price tests.
- Address validation tests.
- Flutter Dream Vault state tests.

### Definition of Done

- Product can be saved to Dream Vault from all specified entry points.
- No user-facing wishlist copy remains.
- Guest save survives auth and syncs exactly once.
- Cart handles out-of-stock products gracefully.
- Address serviceability is enforced.

### Dependencies

- Phase 4.

### Risk Level

Medium.

### Estimated Complexity

Medium.

---

## Phase 6 - KYC, Profile, Admin Review, and Compliance Gates

### Goal

Build production KYC tiers, profile management, admin review workflow, compliance gating, and PII-safe storage.

### Folders Involved

- `apps/api/src/modules/kyc/`
- `apps/api/src/modules/admin/`
- `apps/api/src/utils/audit.ts`
- `apps/mobile/lib/features/profile/`

### Files to Create

- `kyc.routes.ts`
- `kyc.controller.ts`
- `kyc.service.ts`
- `kyc.schema.ts`
- `admin.routes.ts`
- `admin.controller.ts`
- `admin.service.ts`
- `audit.ts`
- `kyc_provider.dart`
- `profile_provider.dart`
- `profile_screen.dart`
- `kyc_landing_screen.dart`
- `aadhaar_screen.dart`
- `aadhaar_otp_screen.dart`
- `pan_screen.dart`
- `selfie_screen.dart`
- `kyc_review_screen.dart`
- `kyc_pending_screen.dart`

### Backend Work

- Implement KYC status endpoint.
- Implement Aadhaar OTP send and verify.
- Implement PAN verify.
- Implement selfie upload via signed S3 URL or multipart endpoint.
- Implement submit for review.
- Implement admin review decision APIs.
- Enforce KYC gates in backend middleware.
- Encrypt Aadhaar and PAN.
- Redact PII from logs.

### Flutter Work

- Implement KYC flow.
- Implement profile screen.
- Implement KYC gate bottom sheet for goal creation, contribution, redemption, and high-value checkout.
- Return user to intended route after KYC.
- Show rejection reason and resubmission cooldown.

### Database Work

- Create `kyc_documents`.
- Create `admin_users`.
- Create `audit_logs`.
- Add encrypted fields for Aadhaar and PAN.
- Add KYC tier fields to `users`.

### Testing

- KYC state transition tests.
- KYC gate tests.
- PII redaction tests.
- Admin audit log tests.
- Flutter KYC flow tests.

### Definition of Done

- Basic and enhanced KYC tiers work.
- PAN requirement above ₹2,00,000 is enforced.
- Enhanced KYC requirement above ₹50,000 monthly contribution is enforced.
- Admin KYC decisions are audited.
- No PII appears in logs.

### Dependencies

- Phase 3.
- Phase 5 for return-to-checkout/cart behavior.

### Risk Level

High.

### Estimated Complexity

High.

---

## Phase 7 - Goals, Contributions, Gold Ledger, and My Gold

### Goal

Build the gold accumulation engine: goal creation, manual contributions, autopay scheduling model, gold ledger, balance snapshots, progress rings, My Gold, and milestones.

### Folders Involved

- `apps/api/src/modules/goals/`
- `apps/api/src/modules/contributions/`
- `apps/api/src/modules/gold_ledger/`
- `apps/api/src/jobs/processors/`
- `apps/mobile/lib/features/goals/`
- `apps/mobile/lib/features/my_gold/`
- `apps/mobile/lib/components/progress/`

### Files to Create

- `goals.routes.ts`
- `goals.controller.ts`
- `goals.service.ts`
- `goals.schema.ts`
- `contributions.service.ts`
- `gold_ledger.routes.ts`
- `gold_ledger.service.ts`
- `gold_balance.service.ts`
- `autopay.processor.ts`
- `balance_snapshot.processor.ts`
- `goal.dart`
- `contribution.dart`
- `gold_balance.dart`
- `gold_ledger_entry.dart`
- `progress_ring.dart`
- `linear_progress_bar.dart`
- `milestone_timeline.dart`
- `goal_card.dart`
- `completed_goal_card.dart`
- `goals_screen.dart`
- `goal_detail_screen.dart`
- `moment_screen.dart`
- `piece_screen.dart`
- `amount_screen.dart`
- `payment_screen.dart`
- `confirmation_screen.dart`
- `my_gold_screen.dart`
- `redeem_screen.dart`
- `my_gold_hero.dart`
- `gold_rate_row.dart`
- `gold_ledger.dart`
- `all_goal_rings_row.dart`
- `milestone_celebration_overlay.dart`
- `goals_provider.dart`
- `goal_create_provider.dart`
- `gold_balance_provider.dart`

### Backend Work

- Implement goal CRUD and lifecycle.
- Implement manual contribution initiation.
- Implement contribution completion ledger credit.
- Implement bonus eligibility and bonus credit.
- Implement balance snapshot refresh.
- Implement `GET /gold-balance`, ledger, and redeemable products.
- Implement milestone detection and celebration queue.
- Implement contribution due and paused status jobs.

### Flutter Work

- Implement Goals screen and GoalCard.
- Implement full goal creation flow.
- Implement My Gold screen, ledger, progress rings, and milestone overlay.
- Implement Contribution Due UX.
- Implement cached read-only state for goals and My Gold offline.

### Database Work

- Create `goals`.
- Create `contributions`.
- Create `gold_ledger_entries`.
- Create `gold_balance_snapshots`.
- Create `user_milestones`.
- Add relevant indexes.

### Testing

- Ledger correctness tests.
- Contribution-to-ledger transaction tests.
- Goal lifecycle tests.
- Bonus eligibility tests.
- Balance display flooring tests.
- Flutter goal creation tests.
- Progress ring state tests.

### Definition of Done

- Goal creation works for KYC users.
- Contributions create posted ledger entries.
- Gold balance is ledger-derived.
- Redemptions are not implemented yet, but balance and redeemable-products preview are accurate.
- Goal due, paused, completed, and cancelled states work.

### Dependencies

- Phase 4 for product pricing.
- Phase 6 for KYC gates.

### Risk Level

High.

### Estimated Complexity

Very High.

---

## Phase 8 - Payments, Orders, Redemption, Refunds, and Reconciliation

### Goal

Build the transactional core: payment methods, Razorpay integration, idempotent orders, stock locking, gold redemption, partial payment, cancellation, refunds, and reconciliation.

### Folders Involved

- `apps/api/src/modules/payments/`
- `apps/api/src/modules/orders/`
- `apps/api/src/modules/webhooks/`
- `apps/api/src/jobs/processors/`
- `apps/mobile/lib/features/orders/`
- `apps/mobile/lib/features/cart/`
- `apps/mobile/lib/features/my_gold/`
- `apps/mobile/lib/features/profile/`

### Files to Create

- `payments.routes.ts`
- `payments.controller.ts`
- `payments.service.ts`
- `payments.schema.ts`
- `orders.routes.ts`
- `orders.controller.ts`
- `orders.service.ts`
- `orders.schema.ts`
- `webhooks.routes.ts`
- `payment_webhook.processor.ts`
- `payment_reconciliation.processor.ts`
- `refund.processor.ts`
- `idempotency.ts`
- `order.dart`
- `payment_method.dart`
- `orders_screen.dart`
- `order_detail_screen.dart`
- `order_confirmation_screen.dart`
- `payment_methods_screen.dart`
- `checkout_screen.dart`

### Backend Work

- Implement payment method creation and UPI verification.
- Implement Razorpay order/payment integration.
- Implement `POST /orders` with idempotency.
- Implement atomic stock decrement.
- Implement inventory reservation expiry if needed for pending payment.
- Implement full and partial gold redemption.
- Implement order cancellation and refunds.
- Implement payment webhook signature verification.
- Implement reconciliation for pending transactions.
- Implement delivery failure status and admin restoration path.

### Flutter Work

- Implement checkout.
- Implement payment method management.
- Implement order list, detail, and confirmation screens.
- Implement Buy Now.
- Implement Buy With My Gold.
- Implement partial payment flow.
- Implement price changed confirmation.
- Implement payment pending and resume behavior.

### Database Work

- Create `payment_methods`.
- Create `payment_transactions`.
- Create `payment_mandates`.
- Create `orders`.
- Create `order_items`.
- Create `idempotency_keys`.
- Create `webhook_events`.
- Create `inventory_reservations`.

### Testing

- Idempotency tests.
- Payment webhook tests with signature verification.
- Stock race-condition tests.
- Gold redemption ledger tests.
- Partial payment tests.
- Refund tests.
- Flutter checkout and payment resume tests.

### Definition of Done

- Duplicate order requests return the same order.
- Stock cannot oversell.
- Gold balance cannot go negative.
- Payment webhooks are auditable and retry-safe.
- Refund restores gold ledger or initiates gateway refund correctly.

### Dependencies

- Phase 5.
- Phase 6.
- Phase 7.

### Risk Level

Very High.

### Estimated Complexity

Very High.

---

## Phase 9 - Notifications, Aura, Referrals, Store Locator, and Polish Features

### Goal

Build the engagement layer after core transactions are safe: notifications, Aura advisor flows, referrals, store locator, and premium lifecycle messaging.

### Folders Involved

- `apps/api/src/modules/notifications/`
- `apps/api/src/modules/aura/`
- `apps/api/src/modules/referrals/`
- `apps/api/src/modules/stores/`
- `apps/api/src/jobs/processors/`
- `apps/mobile/lib/features/notifications/`
- `apps/mobile/lib/features/aura/`
- `apps/mobile/lib/features/referrals/`
- `apps/mobile/lib/features/store/`

### Files to Create

- `notifications.routes.ts`
- `notifications.controller.ts`
- `notifications.service.ts`
- `aura.routes.ts`
- `aura.controller.ts`
- `aura.service.ts`
- `aura.schema.ts`
- `referrals.routes.ts`
- `referrals.service.ts`
- `stores.routes.ts`
- `stores.service.ts`
- `notification.processor.ts`
- `aura_insight.processor.ts`
- `notification.dart`
- `aura_session.dart`
- `notifications_screen.dart`
- `aura_screen.dart`
- `aura_conversation_screen.dart`
- `aura_goal_planning_screen.dart`
- `aura_product_discovery_screen.dart`
- `aura_gold_insights_screen.dart`
- `aura_action_card.dart`
- `aura_conversation_card.dart`
- `aura_option_button.dart`
- `referrals_screen.dart`
- `store_locator_screen.dart`

### Backend Work

- Implement notifications list and read endpoints.
- Implement queued Firebase push sending.
- Implement milestone, contribution, KYC, order, and rate alert notification triggers.
- Implement Aura insight, plan, discover, sessions, and messages endpoints.
- Implement Aura rate limiting and session expiry.
- Implement referral code generation, apply, and reward trigger.
- Implement store locator.

### Flutter Work

- Implement notifications screen and deep-link handling.
- Implement Aura landing and structured flows.
- Implement Aura cached insight behavior.
- Implement referral screen.
- Implement store locator screen.
- Implement notification tap routing from cold start.

### Database Work

- Create `notifications`.
- Create `aura_sessions`.
- Create `aura_messages`.
- Create `product_views`.
- Create `referrals`.
- Create `store_locations`.

### Testing

- Notification queue tests.
- Push payload deep-link tests.
- Aura safety filter tests.
- Aura timeout fallback tests.
- Referral self-referral prevention tests.
- Store locator filtering tests.
- Flutter Aura structured-flow tests.

### Definition of Done

- Aura behaves as a jewellery advisor, not generic chat support.
- Recommendations never include out-of-stock or deleted products.
- Notifications are queued, persisted, readable, and deep-link correctly.
- Referral rewards trigger only after first goal enrollment and successful first contribution.

### Dependencies

- Phase 4.
- Phase 7.
- Phase 8.

### Risk Level

High.

### Estimated Complexity

High.

---

## Phase 10 - Admin UI, Operations, Observability, and Security Hardening

### Goal

Make the system operable by the business: admin tooling, audit logs, monitoring, incident visibility, security hardening, and compliance workflows.

### Folders Involved

- `apps/admin/`
- `apps/api/src/modules/admin/`
- `apps/api/src/utils/`
- `apps/api/src/jobs/`
- `.github/`
- `docs/`

### Files to Create

- `apps/admin/package.json`
- `apps/admin/src/main.tsx`
- `apps/admin/src/app.tsx`
- `apps/admin/src/pages/products.tsx`
- `apps/admin/src/pages/kyc.tsx`
- `apps/admin/src/pages/orders.tsx`
- `apps/admin/src/pages/gold-rates.tsx`
- `apps/admin/src/pages/cms.tsx`
- `apps/admin/src/pages/users.tsx`
- `apps/admin/src/pages/audit-logs.tsx`
- `admin_auth.middleware.ts`
- `audit.routes.ts`
- `audit.service.ts`
- `gold_rate_override.service.ts`
- `runbooks/payment_reconciliation.md`
- `runbooks/gold_rate_stale.md`
- `runbooks/kyc_review.md`

### Backend Work

- Implement admin auth and role checks.
- Implement product publishing and image management APIs.
- Implement KYC review UI APIs.
- Implement order status, delivery failure, refund, and SAR review APIs.
- Implement CMS banner management.
- Implement gold rate override with audit.
- Implement audit log query APIs.
- Add CloudWatch metrics and alarms.
- Add Sentry release tracking.

### Flutter Work

- Add app version/debug info route in Profile.
- Confirm user-facing errors are premium, calm, and non-technical.
- Confirm all production logs avoid PII.

### Database Work

- Finalize `admin_users`.
- Finalize `audit_logs`.
- Add any missing indexes from load testing.

### Testing

- Admin role authorization tests.
- Audit log tests.
- Security tests for PII redaction.
- Webhook replay tests.
- Queue failure tests.
- Manual runbook dry runs.

### Definition of Done

- Business can manage products, KYC, orders, CMS, refunds, SAR reviews, and gold rates.
- Every admin action that affects money, KYC, catalog, orders, or rates is audited.
- Alerts exist for stale gold rate, queue backlog, webhook failures, payment reconciliation failures, high API error rate, and high latency.
- Runbooks exist for operational failures.

### Dependencies

- Phases 4 through 9.

### Risk Level

High.

### Estimated Complexity

High.

---

## Phase 11 - Performance, Load, QA, and Production Readiness

### Goal

Validate that the app and backend meet premium UX, scalability, correctness, and release-readiness standards.

### Folders Involved

- `apps/mobile/`
- `apps/api/`
- `apps/admin/`
- `docs/`
- `.github/`

### Files to Create

- `docs/test-plan.md`
- `docs/release-checklist.md`
- `docs/security-checklist.md`
- `docs/performance-baselines.md`
- `docs/privacy-and-data-retention.md`
- `apps/api/tests/load/`
- `apps/mobile/integration_test/`

### Backend Work

- Run load tests for product listing, product detail, auth, home payload, goals, gold balance, order creation, and webhooks.
- Tune indexes.
- Tune Redis caching.
- Verify queue worker concurrency.
- Verify database transaction isolation on order creation.
- Verify backup and restore.

### Flutter Work

- Test all screens at 320px width.
- Test large text accessibility.
- Test slow network behavior.
- Test offline cached states.
- Test image fallback states.
- Test payment resume from killed app.
- Test cold-start notification deep links.

### Database Work

- Run migration dry run on staging.
- Verify rollback plan.
- Verify RDS backup policy.
- Verify audit data retention.

### Testing

- End-to-end tests for onboarding, auth, KYC, browse, vault, goal creation, contribution, order, redemption, refund, Aura, and notifications.
- Load tests targeting 100,000 registered users and realistic concurrent active users.
- Security review.
- Accessibility pass.
- Manual QA on iOS and Android.

### Definition of Done

- P95 API latency meets agreed thresholds.
- Product list and product detail feel instant with cache.
- No known P0/P1 bugs.
- Payment and ledger reconciliation pass.
- Legal and compliance review complete.
- Production release checklist approved.

### Dependencies

- All prior phases.

### Risk Level

Very High.

### Estimated Complexity

Very High.

---

## Phase 12 - Production Launch and Post-Launch Stabilization

### Goal

Launch safely, monitor behavior, and stabilize the system under real customer usage.

### Folders Involved

- `docs/`
- `.github/`
- Infrastructure configuration.

### Files to Create

- `docs/launch-plan.md`
- `docs/support-playbook.md`
- `docs/incident-response.md`
- `docs/post-launch-metrics.md`

### Backend Work

- Deploy production API and workers to ECS Fargate.
- Configure production RDS, Redis, S3, CloudFront, secrets, alarms, and dashboards.
- Enable payment, KYC, gold-rate, and push provider production credentials.
- Enable scheduled jobs.

### Flutter Work

- Configure production API base URL.
- Configure release signing.
- Configure Sentry release.
- Submit iOS and Android builds.
- Validate store deep links and push notification permissions.

### Database Work

- Run production migrations.
- Seed required catalog reference data, stores, serviceable pincodes, admin users, and initial gold rates.
- Verify backups.

### Testing

- Production smoke test.
- Payment live small-value test.
- KYC provider live test.
- Push notification live test.
- Gold rate update live test.
- Admin operational test.

### Definition of Done

- App is live.
- Monitoring dashboards are green.
- Payment, KYC, push, gold rate, catalog, Dream Vault, goals, and orders work in production.
- Support team has runbooks.
- Post-launch review is scheduled.

### Dependencies

- Phase 11.
- Business approval.
- Legal approval.
- Store approval.

### Risk Level

Very High.

### Estimated Complexity

High.

---

## Required Build Order Summary

1. Foundation.
2. Design system and app shell.
3. Auth, users, and sessions.
4. Catalog, CMS, gold rates, and search.
5. Dream Vault, cart, addresses, and guest handoff.
6. KYC and compliance gates.
7. Goals, contributions, ledger, and My Gold.
8. Payments, orders, redemption, refunds, and reconciliation.
9. Notifications, Aura, referrals, and store locator.
10. Admin, operations, observability, and security.
11. Performance, QA, and production readiness.
12. Launch and stabilization.

This order keeps the premium user experience intact while ensuring that financial correctness, identity, ledger integrity, and operational safety are ready before production traffic.
