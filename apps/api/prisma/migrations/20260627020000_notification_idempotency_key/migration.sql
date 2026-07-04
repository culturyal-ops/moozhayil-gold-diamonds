-- Add idempotency_key to notifications to prevent duplicate sends (med-2).
ALTER TABLE "notifications"
  ADD COLUMN "idempotency_key" VARCHAR(200);

CREATE UNIQUE INDEX "notifications_idempotency_key_key"
  ON "notifications"("idempotency_key")
  WHERE "idempotency_key" IS NOT NULL;
