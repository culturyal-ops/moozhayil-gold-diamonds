# Payment reconciliation runbook

## Symptoms
- Pending payments older than 15 minutes
- Webhook delivery failures
- Orders stuck in `pending_payment`

## Steps
1. Check `/v1/health` and worker health on port 3001.
2. Review `webhook_events` for failed or duplicate Razorpay events.
3. Run admin reconcile: `POST /v1/payments/reconcile` (finance_manager token).
4. Verify BullMQ `payments` queue depth in Redis.
5. Confirm order transitions to `confirmed` and payment transaction is `captured` or `reconciled`.
6. Audit log should contain reconciliation actions for manual overrides.

## Escalation
- If provider outage: pause checkout banner, notify support, retry reconciliation hourly.
