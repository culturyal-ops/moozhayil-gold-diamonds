# KYC review runbook

## Symptoms
- Users stuck in `in_review`
- KYC provider webhook failures
- Support tickets about verification delays

## Steps
1. Open admin KYC queue: `GET /v1/admin/kyc/reviews`.
2. Verify document flags (`aadhaar_verified`, `pan_verified`, `selfie_verified`).
3. Approve or reject with documented reason (audit logged automatically).
4. For provider-side events, inspect `webhook_events` where `provider = kyc_provider`.
5. Confirm user receives push/in-app notification after decision.

## SLA
- Target review within 24 business hours for `in_review` submissions.

## Escalation
- Rejected resubmissions follow mobile cooldown rules; do not bypass without audit reason.
