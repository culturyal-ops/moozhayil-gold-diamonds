# 19 - Operational Playbook
## Moozhayil Gold & Diamonds - Live Operations Manual

This document explains how engineers operate Moozhayil after launch.

The platform handles money, gold ownership, KYC data, orders, and trust. Operations must be calm, auditable, and rehearsed.

---

## 1. Operating Principles

- Customer money and gold balance correctness come before feature availability.
- PostgreSQL is source of truth.
- Redis, queues, CDN, analytics, and push are supporting systems.
- Do not mutate posted ledger entries.
- Do not manually repair production data without audit.
- Prefer degradation over incorrect behavior.
- Every incident gets a timeline, owner, mitigation, root cause, and prevention item.

---

## 2. Incident Response

### 2.1 Severity Levels

`SEV-0`: Customer balances, payments, KYC data, security, or order correctness at risk.

`SEV-1`: Core transaction path unavailable or major user-visible outage.

`SEV-2`: Important feature degraded, workaround exists.

`SEV-3`: Minor issue, limited user impact.

### 2.2 Incident Roles

- Incident Commander: Owns coordination and decisions.
- Tech Lead: Owns diagnosis and mitigation.
- Comms Lead: Owns business/support/customer updates.
- Scribe: Owns timeline.

### 2.3 Incident Process

1. Declare incident and severity.
2. Open incident channel.
3. Assign roles.
4. Freeze unrelated deploys.
5. Identify impacted systems and customers.
6. Mitigate first.
7. Preserve evidence.
8. Reconcile data if needed.
9. Write postmortem within 48 hours.

### 2.4 SEV-0 Immediate Actions

- Disable affected transaction path with kill switch.
- Stop payment/order/contribution workers if duplication or corruption is suspected.
- Preserve logs and database snapshots.
- Notify leadership and support.
- Do not run ad hoc SQL changes without approval and audit record.

---

## 3. Monitoring

### 3.1 Dashboards

Required dashboards:
- API health.
- Auth and OTP.
- Catalog and price latency.
- Goal and contribution health.
- Payment and webhook health.
- Ledger and balance reconciliation.
- Order and inventory health.
- KYC provider SLA.
- Queue health.
- RDS health.
- Redis health.
- S3/CloudFront health.
- Firebase push health.
- Aura cost and latency.

### 3.2 Golden Signals

API:
- Request rate.
- Error rate.
- P50/P95/P99 latency.
- Saturation.

Database:
- Connections.
- CPU.
- Storage.
- Replication/PITR health.
- Slow queries.
- Deadlocks.

Queues:
- Depth.
- Age of oldest job.
- Retry count.
- Dead-letter count.

Business correctness:
- Payments pending over 10 minutes.
- Webhook processing failures.
- Ledger reconciliation mismatches.
- Stale gold rate.
- Inventory reservation expiries.

---

## 4. Alerting

### 4.1 Critical Alerts

- API 5xx rate > 2% for 5 minutes.
- P95 API latency > 1500ms for 10 minutes.
- RDS connection usage > 80%.
- RDS storage free < 15%.
- Queue oldest job age > 10 minutes for critical queues.
- Dead-letter jobs > 0 for payments, ledger, KYC, or orders.
- Payment reconciliation failure.
- Webhook signature validation spike.
- Gold rate stale > 8 hours.
- Ledger mismatch detected.
- KYC documents upload failure spike.
- Admin sensitive action failure spike.

### 4.2 Warning Alerts

- Redis memory > 75%.
- CloudFront 5xx spike.
- Firebase push failure rate > 5%.
- Aura timeout rate > 5%.
- KYC review pending > 2 hours.
- Product image processing backlog.

---

## 5. Logging

### 5.1 Required Log Fields

- `timestamp`
- `level`
- `service`
- `environment`
- `request_id`
- `user_id` when safe
- `admin_id` when applicable
- `route`
- `status_code`
- `latency_ms`
- `error_code`

### 5.2 Redaction Rules

Never log:
- Aadhaar.
- PAN.
- OTP.
- Refresh tokens.
- Raw JWT.
- Full address.
- Payment tokens.
- Raw Aura chat when analytics or logs are used.

### 5.3 Log Retention

- Production API logs: 30 days hot.
- Security/audit logs: legal retention.
- Debug logs: disabled in production unless temporary incident flag is approved.

---

## 6. Backups

### 6.1 PostgreSQL

Required:
- RDS automated backups.
- Point-in-time recovery.
- Daily snapshots.
- Backup encryption.
- Quarterly restore drill.

Targets:
- RPO: 5 minutes.
- RTO: 4 hours.

### 6.2 S3

Required:
- Versioning for critical buckets.
- Lifecycle for derivatives and failed uploads.
- Private KYC objects.
- CloudFront-only public media.

### 6.3 Redis

Redis is not source of truth. Snapshot if useful for queue recovery, but correctness must be reconstructable from PostgreSQL and providers.

---

## 7. Restore Procedures

### 7.1 Database Restore

1. Declare incident.
2. Freeze writes or switch app to maintenance if corruption suspected.
3. Identify restore timestamp.
4. Restore RDS to new instance.
5. Validate schema and data.
6. Run reconciliation checks.
7. Point staging API to restored DB for smoke test.
8. Promote restored DB only after approval.
9. Reconcile payments/webhooks/ledger events after restore window.

### 7.2 Single-Record Repair

Allowed only when:
- Root cause is understood.
- Repair plan is reviewed.
- Audit log is created.
- Ledger uses reversal entries, never mutation.

---

## 8. Deployment Process

### 8.1 Backend Deployment

1. Merge approved PR.
2. CI passes lint, typecheck, tests, contract tests, migration checks.
3. Deploy to staging.
4. Run smoke tests.
5. Run migration dry run if schema changes exist.
6. Approve production.
7. Progressive deploy to ECS.
8. Monitor dashboards for 30 minutes.

### 8.2 Mobile Release

1. Feature flags prepared.
2. Backend compatibility confirmed.
3. Internal test release.
4. QA pass on iOS and Android.
5. Store submission.
6. Phased rollout.
7. Monitor crash and API error rates.

### 8.3 Admin/Web Deployment

Same as backend for tests and staging smoke. Admin sensitive workflows require manual smoke test before production.

---

## 9. Rollback Process

### 9.1 Application Rollback

1. Stop progressive rollout.
2. Roll ECS service to previous task definition.
3. Confirm health checks.
4. Confirm no migration incompatibility.
5. Monitor.

### 9.2 Migration Rollback

Production migrations are not rolled back casually.

Policy:
- Use expand-contract.
- Application rollback must work with already-applied migrations.
- Destructive cleanup only after old code is fully retired.

---

## 10. Database Migration Policy

- Every migration has a forward plan and rollback/mitigation plan.
- Large migrations are split into schema change, backfill, validation, and cleanup.
- Backfills run in batches.
- High-traffic tables require lock analysis.
- Migrations run in staging first.
- No Friday production migrations unless emergency.

---

## 11. Feature Flags

Required for:
- New payment flows.
- New KYC provider behavior.
- Aura changes.
- Admin financial actions.
- Major catalog/search changes.
- Mobile features depending on backend rollout.

Rules:
- Flags default off in production.
- Flags have owner and removal date.
- Kill switches are separate from experiment flags.

---

## 12. Kill Switches

Required kill switches:
- Disable goal creation.
- Disable manual contributions.
- Disable autopay processing.
- Disable checkout.
- Disable gold redemption.
- Disable refunds.
- Disable KYC submission.
- Disable Aura.
- Disable push notifications.
- Disable admin publishing.
- Force catalog read-only mode.

Kill switches must be controlled by privileged admin or environment config and audit logged.

---

## 13. Secrets Rotation

Rotate:
- JWT signing keys.
- Razorpay keys.
- KYC provider keys.
- Firebase private key.
- Gold rate API keys.
- CRM/ERP credentials.
- Database credentials.

Process:
1. Add new secret version.
2. Deploy services that can read both old and new if needed.
3. Switch active version.
4. Verify.
5. Revoke old secret.
6. Audit completion.

---

## 14. Key Rotation

JWT:
- Support overlapping keys using key IDs.
- New tokens signed by new key.
- Old key valid until old access tokens expire.
- Refresh tokens can be revoked by session.

KYC encryption:
- Envelope encryption preferred.
- Re-encrypt in background if key rotation requires data rewrite.

---

## 15. Failure Runbooks

### 15.1 Redis Failure

Impact:
- Cache misses.
- Queue processing degraded.
- Rate limiting affected.

Actions:
- Confirm Redis availability.
- Degrade browse APIs to database reads.
- Fail closed for sensitive rate-limited endpoints if counters unavailable.
- Pause non-critical workers.
- Alert operations.
- Resume workers after Redis health returns.

Do not:
- Treat Redis as source of truth.

### 15.2 RDS Failure

Impact:
- API cannot process most requests.

Actions:
- Confirm RDS status.
- Put API in maintenance/read-only where possible.
- Stop workers.
- Use RDS failover if configured.
- Restore from PITR if corruption or unrecoverable failure.
- Reconcile provider events after recovery.

### 15.3 CloudFront Failure

Impact:
- Images and media degrade.

Actions:
- Confirm CloudFront status.
- Keep app functional with placeholders.
- Do not expose direct public S3 for KYC or originals.
- Invalidate only if stale content is cause.

### 15.4 Payment Provider Failure

Impact:
- Checkout, contribution, refunds, mandates.

Actions:
- Enable payment kill switch for new payment attempts.
- Keep order/contribution pending states visible.
- Queue reconciliation.
- Notify support.
- Do not mark payment failed until provider state is known.

### 15.5 Firebase Failure

Impact:
- Push notifications delayed.

Actions:
- Continue writing in-app notifications.
- Queue push retries.
- Do not block transactions.

### 15.6 KYC Provider Failure

Impact:
- New KYC verification delayed.

Actions:
- Disable KYC submission if provider rejects all requests.
- Show premium delay messaging.
- Preserve drafts/uploads safely.
- Alert support if pending exceeds SLA.

### 15.7 Gold Rate API Failure

Impact:
- Rates may become stale.

Actions:
- Use last valid rate.
- Alert at 8 hours stale.
- Show stale warning after 8 hours.
- Admin may use maker-checker manual override.
- Audit override.

### 15.8 Queue Backlog

Actions:
- Identify queue and oldest job.
- Scale workers if safe.
- Pause poison job source if retries spike.
- Move unrecoverable poison jobs to dead letter.
- Reconcile affected domain.

---

## 16. Disaster Recovery

DR scenarios:
- RDS loss.
- Region-level service issue.
- S3 object deletion.
- Redis loss.
- Provider outage.

Quarterly drill must prove:
- RDS restore works.
- API can point to restored DB.
- Ledger reconciliation can run.
- Payment provider reconciliation can repair pending states.

---

## 17. Support Workflow

Support can view:
- User profile summary.
- KYC status.
- Order status.
- Payment status.
- Goal and contribution status.
- Gold balance summary.

Support cannot view:
- Raw Aadhaar.
- Raw PAN.
- Payment tokens.
- Private KYC files unless explicitly privileged.

Escalate to finance/admin for:
- Ledger mismatch.
- Refund failure.
- Gold redemption dispute.
- High-value transaction.
- Phone number transfer.

---

## 18. Admin Workflow

Sensitive admin actions require:
- Role permission.
- Step-up auth.
- Reason.
- Audit log.
- Maker-checker when required.

Maker-checker required for:
- Manual ledger adjustment.
- Gold rate override.
- High-value refund.
- SAR decision.

---

## 19. Fraud Investigation

Signals:
- Multiple accounts on same device fingerprint.
- Self-referral attempts.
- Repeated payment failures.
- High-value transactions.
- KYC mismatch.
- Rapid refund cycles.

Process:
1. Open fraud case.
2. Preserve account, device, order, payment, and KYC evidence.
3. Freeze risky actions if needed.
4. Escalate SAR review above threshold.
5. Record final decision in audit logs.

---

## 20. Chargebacks

Process:
1. Match provider dispute to `payment_transactions`.
2. Freeze affected refund path.
3. Retrieve order, delivery, KYC, and payment evidence.
4. Respond through provider portal.
5. If chargeback is lost, create financial adjustment with audit.
6. If gold was credited, perform ledger reversal only through approved flow.

---

## 21. Ledger Reconciliation

Daily checks:
- Sum posted ledger entries per user.
- Compare latest balance snapshot.
- Compare completed contributions to contribution ledger credits.
- Compare redemptions to order ledger debits.
- Compare refunds to refund ledger credits.

Mismatch actions:
- Declare SEV if customer-facing balance may be wrong.
- Disable affected transaction path.
- Investigate source event.
- Repair through reversal/correcting entries only.

---

## 22. Monthly Maintenance

- Review RDS slow queries.
- Review index usage.
- Review queue dead letters.
- Review payment reconciliation reports.
- Review KYC SLA.
- Review S3 lifecycle costs.
- Review CloudWatch log retention.
- Review Aura cost.
- Review security patches.
- Review feature flags for cleanup.

---

## 23. Security Review Checklist

- No secrets in repos.
- JWT claims contain no PII.
- Refresh token hashes only.
- KYC data encrypted.
- S3 buckets private.
- CloudFront access controlled.
- Admin MFA enabled.
- Admin roles least privilege.
- Webhook signatures verified.
- Rate limits active.
- PII redaction tested.
- Dependency vulnerabilities reviewed.

---

## 24. Production Release Checklist

- CI green.
- Contract tests green.
- Migration reviewed.
- Staging smoke passed.
- Rollback plan ready.
- Feature flags configured.
- Dashboards checked.
- Alerts enabled.
- Support briefed.
- Legal/compliance approval if needed.

---

## 25. Launch Checklist

- Production API healthy.
- Workers healthy.
- RDS backups enabled.
- Restore drill completed.
- Redis healthy.
- S3 and CloudFront configured.
- Razorpay live tested with small amount.
- KYC live tested.
- Firebase push live tested.
- Gold rate job verified.
- Admin portal access verified.
- Support workflow ready.
- Incident channel ready.

---

## 26. Post-Launch Checklist

First 24 hours:
- Monitor API error and latency.
- Monitor payment success rate.
- Monitor KYC completion.
- Monitor crashes.
- Monitor queue backlog.
- Monitor ledger reconciliation.
- Monitor support tickets.

First 7 days:
- Review funnel analytics.
- Review slow queries.
- Review provider costs.
- Review incident logs.
- Remove temporary launch flags only after stability.
