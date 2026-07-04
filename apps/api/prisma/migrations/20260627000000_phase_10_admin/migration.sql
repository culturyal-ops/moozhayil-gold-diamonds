-- Phase 10: Admin platform, ledger adjustments, SAR reviews

CREATE TYPE "ledger_adjustment_status" AS ENUM ('pending', 'approved', 'rejected', 'posted');
CREATE TYPE "sar_review_status" AS ENUM ('pending', 'approved', 'rejected');

ALTER TABLE "admin_users" ADD COLUMN "password_hash" VARCHAR(255);

CREATE TABLE "ledger_adjustments" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "grams_delta" DECIMAL(10,4) NOT NULL,
    "amount_paise" INTEGER,
    "reason" TEXT NOT NULL,
    "status" "ledger_adjustment_status" NOT NULL DEFAULT 'pending',
    "requested_by_admin_id" UUID NOT NULL,
    "approved_by_admin_id" UUID,
    "idempotency_key" VARCHAR(100) NOT NULL,
    "approved_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "ledger_adjustments_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "sar_reviews" (
    "id" UUID NOT NULL,
    "order_id" UUID NOT NULL,
    "status" "sar_review_status" NOT NULL DEFAULT 'pending',
    "decision_reason" TEXT,
    "decided_by_admin_id" UUID,
    "decided_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "sar_reviews_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "ledger_adjustments_idempotency_key_key" ON "ledger_adjustments"("idempotency_key");
CREATE INDEX "idx_ledger_adjustments_user_id" ON "ledger_adjustments"("user_id");
CREATE INDEX "idx_ledger_adjustments_status" ON "ledger_adjustments"("status");

CREATE UNIQUE INDEX "sar_reviews_order_id_key" ON "sar_reviews"("order_id");
CREATE INDEX "idx_sar_reviews_status" ON "sar_reviews"("status");

ALTER TABLE "ledger_adjustments" ADD CONSTRAINT "ledger_adjustments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "ledger_adjustments" ADD CONSTRAINT "ledger_adjustments_requested_by_admin_id_fkey" FOREIGN KEY ("requested_by_admin_id") REFERENCES "admin_users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "ledger_adjustments" ADD CONSTRAINT "ledger_adjustments_approved_by_admin_id_fkey" FOREIGN KEY ("approved_by_admin_id") REFERENCES "admin_users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "sar_reviews" ADD CONSTRAINT "sar_reviews_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "orders"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "sar_reviews" ADD CONSTRAINT "sar_reviews_decided_by_admin_id_fkey" FOREIGN KEY ("decided_by_admin_id") REFERENCES "admin_users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
