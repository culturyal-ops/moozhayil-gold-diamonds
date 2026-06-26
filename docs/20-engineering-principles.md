# 20 - Engineering Principles
## Moozhayil Gold & Diamonds - How Engineers Build Forever

This document defines how engineers build Moozhayil over time.

It protects the product philosophy, architecture lock, and production safety rules.

---

## 1. Coding Philosophy

Code must be predictable, readable, modular, reusable, documented where necessary, and easy to extend.

Rules:
- Understand existing docs before implementation.
- Prefer established patterns over new abstractions.
- Keep business logic out of UI widgets.
- Keep financial logic out of clients.
- Prefer explicit state machines over scattered conditionals.
- Do not take shortcuts that create future financial, security, or operational debt.

Why: Moozhayil is not a prototype. It handles trust, gold, money, KYC, and family milestones.

---

## 2. Architecture Philosophy

Moozhayil starts as a modular monolith with strict internal boundaries.

Rules:
- Backend domains live in modules.
- Database remains shared but domain ownership is clear.
- Queues are used for side effects and long-running work.
- Transactional outbox is required for reliable async behavior.
- Service extraction happens only after measured operational need.

Why: A modular monolith is simpler to build, test, and operate while still scaling through horizontal API workers, background workers, caching, partitioning, and database tuning.

---

## 3. Naming Conventions

### 3.1 Product Language

- Use "Dream Vault", never user-facing "wishlist".
- Use "Gold Goals", not "schemes" as primary language.
- Use "My Gold" or "Gold Reserve" for owned balance.
- Use "Aura" as a jewellery advisor, not chatbot/support.

### 3.2 Flutter

- Files: `snake_case.dart`.
- Classes: `PascalCase`.
- Providers: `snake_case_provider.dart`.
- Models: `snake_case.dart`.
- Routes: constants only.

### 3.3 Backend

- Language: TypeScript.
- Files: `snake_case.role.ts`.
- Examples: `auth.routes.ts`, `auth.controller.ts`, `auth.service.ts`, `auth.schema.ts`.
- Modules: plural or domain nouns in `apps/api/src/modules/{domain}`.

### 3.4 Database

- Tables: `snake_case`.
- Columns: `snake_case`.
- Enums: lowercase snake_case.
- Indexes: `idx_{table}_{columns}`.
- Unique constraints: `uq_{table}_{columns}`.

---

## 4. Folder Philosophy

### 4.1 Mobile

Shared reusable widgets live in `lib/components`.

Feature-specific widgets live in `lib/features/{feature}/widgets`.

Core cross-feature services live in `lib/core`.

Why: Shared components stay reusable while feature complexity remains local.

### 4.2 Backend

Each domain module owns:
- Routes.
- Controller.
- Service.
- Schema validation.
- Tests.

Shared infrastructure lives in:
- `config`
- `db`
- `middleware`
- `jobs`
- `utils`

Why: Domain ownership prevents feature logic from spreading across unrelated files.

### 4.3 Repositories

Use separate repositories:
- `moozhayil-mobile`
- `moozhayil-backend`
- `moozhayil-web`
- `moozhayil-admin`

Why: Release cycles, access controls, and deployment risks differ by surface.

---

## 5. Component Philosophy

Components must feel premium, calm, and restrained.

Rules:
- Use design tokens.
- Implement all documented states.
- Prefer whitespace and hierarchy over decoration.
- Never hardcode colors, spacing, typography, radii, or motion.
- Loading states use shimmer for content.
- Spinners only for button loading and blocking payment processing.
- Components must respect accessibility text scaling and tap targets.

Why: The UI must feel more like a premium brand experience than a generic marketplace or fintech dashboard.

---

## 6. Flutter Rules

- Use Riverpod code generation.
- No API calls inside widget `build()`.
- No `setState` for production data screens.
- Use GoRouter route constants.
- Use Dio interceptors for auth and refresh.
- Store access/refresh tokens only in secure storage.
- Store non-sensitive cache in Hive.
- Use Freezed and JSON serialization for models.
- Parse unknown fields safely.
- Treat missing critical fields as item-level errors where possible.
- Never compute transaction prices client-side.
- Persist draft state for payment, KYC, and goal creation flows.
- Offline state is global and read-only for cached business data.
- Image fallbacks are mandatory.

Provider lifetime rules:
- Auth/session/config/connectivity providers may be long-lived.
- Feature providers are scoped or parameterized.
- Mutations invalidate only affected providers.
- Payment and contribution pending states refresh on app resume.

---

## 7. Backend Rules

- Runtime: Node.js 20 LTS.
- Framework: Express 4.
- Language: TypeScript.
- Validate all inputs with Zod.
- Use Prisma for normal DB access.
- Raw SQL allowed only for full-text search, materialized view refresh, and performance-critical queries with explanation.
- Use Decimal.js for gold and price calculations.
- Use integer paise for money.
- Use transactions for multi-table financial changes.
- Use idempotency for risky mutations.
- Use request IDs.
- Use structured logs.
- Redact PII.
- Send push notifications through queues.
- Verify webhook signatures.
- Store webhook events before processing.
- Workers reload authoritative database state.

---

## 8. Database Rules

- PostgreSQL is source of truth.
- Use UUID primary keys.
- Use `TIMESTAMPTZ` UTC for timestamps.
- Use `INTEGER` paise for money.
- Use `DECIMAL(10,4)` for gold grams.
- Ledger is append-only.
- Posted ledger entries are never updated or deleted.
- Corrections use reversal entries.
- Orders store snapshots.
- Product prices are computed server-side and snapshotted at transaction time.
- Inventory uses reservations.
- High-growth tables have partition and retention plans.
- Every high-traffic endpoint gets `EXPLAIN ANALYZE` review before launch.

---

## 9. API Rules

- Base path is `/v1`.
- Released `/v1` contracts are backward-compatible.
- Breaking changes require `/v2`.
- Errors use standard error format.
- Lists use cursor pagination.
- Unknown filters and sorts return `422`.
- Mutations requiring idempotency reject missing idempotency keys.
- Webhooks persist before processing.
- Transaction endpoints never trust cached price, balance, stock, KYC, or payment state.
- Mobile clients treat new fields as optional.

---

## 10. Testing Philosophy

Tests protect trust-critical behavior first.

Required test categories:
- Unit tests for pure business logic.
- Integration tests for API and database behavior.
- Contract tests between backend DTOs and Flutter models.
- Ledger invariant tests.
- Price calculation tests.
- Payment webhook replay tests.
- KYC state transition tests.
- Order stock concurrency tests.
- Queue idempotency tests.
- Flutter widget tests for key components.
- End-to-end tests for critical journeys.
- Load tests for launch readiness.

Why: The highest risk is not visual defects. It is incorrect money, gold, KYC, order, or provider state.

---

## 11. Documentation Rules

- Architecture decisions must explain why.
- No two documents should leave two possible implementations.
- Docs must be updated in the same PR as contract or behavior changes.
- API changes update `18-api-contract.md`.
- Database changes update `17-database-bible.md`.
- Operational changes update `19-operational-playbook.md`.
- Engineering process changes update this document.
- User-facing product meaning must preserve `design philosophy.md`.

---

## 12. Git Workflow

Branch from main.

Branch naming:
- `feature/{short-name}`
- `fix/{short-name}`
- `docs/{short-name}`
- `chore/{short-name}`
- `release/{version}`

Rules:
- Main is always releasable.
- PRs must be small enough to review.
- Database migrations are isolated or clearly marked.
- No direct production deploy from unreviewed branch.

---

## 13. Commit Message Standard

Format:

```text
type(scope): summary
```

Types:
- `feat`
- `fix`
- `docs`
- `test`
- `refactor`
- `chore`
- `perf`
- `security`

Examples:
- `docs(api): lock v1 order contract`
- `feat(goals): add contribution due state`
- `fix(payments): prevent duplicate webhook processing`

---

## 14. Branch Strategy

Default: trunk-based development with short-lived branches.

Release branches exist only for mobile release stabilization or emergency backend hotfixes.

Why: Long-lived branches drift from contracts, migrations, and product decisions.

---

## 15. Pull Request Checklist

Every PR answers:
- What changed?
- Why is it needed?
- Which docs/contracts changed?
- What tests were added or updated?
- What is the rollback plan?
- Does it affect money, gold, KYC, payments, orders, inventory, auth, or admin?
- Does it introduce a migration?
- Does it require a feature flag?
- Does it affect privacy or logs?

---

## 16. Code Review Checklist

Reviewers check:
- Product language preserved.
- Architecture boundaries respected.
- Inputs validated.
- Errors standardized.
- Idempotency applied where required.
- Financial math correct.
- Ledger invariants preserved.
- PII redacted.
- Tests meaningful.
- Performance reasonable.
- UI states complete.
- Accessibility respected.
- Docs updated.

---

## 17. Performance Budget

Mobile:
- App shell feels immediate.
- Product images use cached loading and correct derivatives.
- No unnecessary rebuilds.
- No API calls in build methods.
- 320px width supported.
- Large text supported.

Backend:
- P95 public catalog endpoints target under 500ms with cache.
- P95 authenticated dashboard endpoints target under 800ms.
- Transaction endpoints favor correctness over latency but should target under 1500ms before provider redirect.
- Slow queries reviewed before launch.

Media:
- Product list image derivatives optimized for mobile.
- CloudFront used for all public media.

---

## 18. Accessibility Standards

- Minimum tap target: 40px, preferably 44px or more.
- Text respects system scaling.
- Critical text wraps instead of truncating.
- Product names may truncate to 2 lines.
- Color cannot be the only state indicator.
- Loading, error, empty, offline, and disabled states must be understandable.
- Motion must be subtle and not required for comprehension.

---

## 19. Security Standards

- No secrets in repo.
- No raw KYC data in logs.
- No raw payment data stored.
- JWTs contain no PII.
- Refresh tokens stored hashed server-side.
- Admin MFA required.
- Admin roles least privilege.
- Sensitive admin actions require step-up auth.
- S3 originals private.
- Webhooks verified.
- Rate limits enabled.
- Dependency vulnerabilities reviewed.

---

## 20. Privacy Standards

- Collect only required user data.
- Redact PII in logs and analytics.
- Do not send Aadhaar, PAN, phone, address, payment tokens, or raw KYC data to Aura.
- Use provider tokens instead of raw payment details.
- Respect data retention policies.
- Support deletion/anonymization only where legal and financial retention allows.

---

## 21. Scalability Standards

Before production:
- RDS Proxy or PgBouncer enabled.
- API and worker pools capped separately.
- Redis is not source of truth.
- Queue workers idempotent.
- High-growth tables reviewed for partitioning.
- Load tests run for critical endpoints.
- Cache invalidation event-driven for mutable catalog data.
- CloudFront serves public media.

Future service extraction criteria:
- Clear domain ownership.
- Measured bottleneck.
- Operational team readiness.
- Contract stability.

---

## 22. Design Principles

The product must feel:
- Calm.
- Premium.
- Trustworthy.
- Emotionally intelligent.
- Precise.

Avoid:
- Cheap fintech dashboards.
- Marketplace clutter.
- Excessive gold.
- Confetti.
- Cartoon illustrations.
- Loud animation.
- Generic Material defaults.

---

## 23. Technical Debt Policy

Debt is acceptable only when:
- It is explicit.
- It has an owner.
- It has a removal plan.
- It does not affect money, gold, KYC, payments, auth, orders, inventory, or security.

Debt is not acceptable in:
- Ledger.
- Payments.
- KYC.
- Auth.
- Admin risk controls.
- Database migrations.
- API contracts.
- Privacy.

---

## 24. Deprecation Policy

API:
- No breaking changes in released `/v1`.
- Deprecation window is at least two supported mobile releases.
- New fields optional.
- Breaking changes require `/v2`.

Mobile:
- Feature flags support backend rollout.
- App versions in the wild are treated as real clients.

Database:
- Use expand-contract.
- Cleanup only after no code reads old fields.

---

## 25. Definition of Done

A task is done when:
- Behavior matches docs and acceptance criteria.
- Tests pass.
- Relevant docs are updated.
- Errors and edge cases are handled.
- Logs are safe.
- No unrelated refactor is included.
- Code review is complete.

---

## 26. Definition of Production Ready

A feature is production ready when:
- It is behind a feature flag if rollout risk exists.
- It has monitoring.
- It has alerts if failure matters.
- It has rollback or mitigation.
- It handles provider failures if applicable.
- It has data migration safety if applicable.
- It has support/admin visibility where needed.
- It has load, integration, and contract coverage appropriate to risk.

---

## 27. Definition of Complete

A product capability is complete only when:
- User experience is polished.
- Backend contract is stable.
- Database model is durable.
- Operational path exists.
- Support path exists.
- Security and privacy are reviewed.
- Analytics are privacy-safe.
- Documentation is updated.
- The feature can survive real production edge cases.

---

## 28. Non-Negotiables

- Do not mutate posted ledger entries.
- Do not compute transaction prices on the client.
- Do not expose S3 KYC documents.
- Do not skip webhook signature verification.
- Do not store raw card data.
- Do not log Aadhaar or PAN.
- Do not break `/v1` for released mobile clients.
- Do not bypass KYC gates.
- Do not release payment or ledger changes without tests.
- Do not use user-facing "wishlist" language.
