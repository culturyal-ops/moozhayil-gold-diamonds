# Gold rate stale runbook

## Symptoms
- `is_stale: true` on public gold rate API
- Gold rate alerts job firing
- Product prices diverge from market

## Steps
1. Check latest `gold_rate_history` rows per purity (`effective_to IS NULL`).
2. Verify gold-rate provider webhook delivery (`POST /webhooks/gold-rate`).
3. If provider unavailable, finance manager applies manual override via admin:
   `POST /v1/admin/gold-rates/override` with step-up token.
4. Confirm Redis cache key `gold-rates:current` invalidated.
5. Review audit log entries with action `gold_rate_override`.

## Escalation
- Halt new orders if rates are stale > 8 hours and override cannot be applied.
