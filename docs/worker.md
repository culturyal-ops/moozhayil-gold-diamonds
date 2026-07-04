# BullMQ worker

The API process handles HTTP only. Background jobs run in a separate worker process.

## Start locally

```bash
cd apps/api
npm run worker
```

Requires Redis (`REDIS_URL`) and the same `.env` as the API.

## Health check

Worker exposes `GET http://localhost:3001/` (override with `WORKER_HEALTH_PORT`).

Response:

```json
{ "status": "ok", "workers": 2, "timestamp": "..." }
```

## Queues

| Queue | Jobs |
|-------|------|
| `notifications` | send, contribution_reminders, scheduled, gold_rate_alerts |
| `aura` | insight |

Webhook processors (payment, KYC, gold-rate) run inline on ingest in the API process; failed events are persisted in `webhook_events`.

## Production

Run worker as a separate ECS service sharing Redis and database credentials with the API task.
