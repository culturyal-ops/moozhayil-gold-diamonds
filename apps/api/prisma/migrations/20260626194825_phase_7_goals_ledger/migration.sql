-- CreateEnum
CREATE TYPE "goal_type" AS ENUM ('wedding', 'investment', 'festival', 'gift', 'family', 'other');

-- CreateEnum
CREATE TYPE "goal_status" AS ENUM ('active', 'contribution_due', 'paused', 'completed', 'cancelled');

-- CreateEnum
CREATE TYPE "contribution_status" AS ENUM ('scheduled', 'pending_payment', 'processing', 'completed', 'payment_failed', 'cancelled', 'refunded');

-- CreateEnum
CREATE TYPE "contribution_type" AS ENUM ('autopay', 'manual', 'bonus', 'adjustment');

-- CreateEnum
CREATE TYPE "ledger_entry_type" AS ENUM ('contribution_credit', 'bonus_credit', 'redemption_debit', 'refund_credit', 'manual_adjustment_credit', 'manual_adjustment_debit');

-- CreateEnum
CREATE TYPE "ledger_status" AS ENUM ('pending', 'posted', 'reversed');

-- CreateEnum
CREATE TYPE "payment_method_type" AS ENUM ('upi', 'card', 'netbanking');

-- CreateEnum
CREATE TYPE "payment_provider" AS ENUM ('razorpay');

-- CreateTable
CREATE TABLE "payment_methods" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "type" "payment_method_type" NOT NULL,
    "display_label" VARCHAR(100) NOT NULL,
    "provider" "payment_provider" NOT NULL DEFAULT 'razorpay',
    "provider_token" VARCHAR(500) NOT NULL,
    "is_default" BOOLEAN NOT NULL DEFAULT false,
    "is_autopay_enabled" BOOLEAN NOT NULL DEFAULT false,
    "deleted_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "payment_methods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "goals" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "goal_type" "goal_type" NOT NULL,
    "status" "goal_status" NOT NULL DEFAULT 'active',
    "target_product_id" UUID,
    "target_amount_paise" INTEGER,
    "target_grams" DECIMAL(10,4),
    "monthly_amount_paise" INTEGER NOT NULL,
    "duration_months" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "next_contribution_date" DATE NOT NULL,
    "payment_method_id" UUID,
    "completed_at" TIMESTAMPTZ(6),
    "paused_at" TIMESTAMPTZ(6),
    "cancelled_at" TIMESTAMPTZ(6),
    "bonus_eligible" BOOLEAN NOT NULL DEFAULT true,
    "aura_created" BOOLEAN NOT NULL DEFAULT false,
    "deleted_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "goals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contributions" (
    "id" UUID NOT NULL,
    "goal_id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "payment_transaction_id" UUID,
    "amount_paise" INTEGER NOT NULL,
    "gold_rate_per_gram_paise" INTEGER NOT NULL,
    "grams_credited" DECIMAL(10,4),
    "contribution_month" DATE NOT NULL,
    "type" "contribution_type" NOT NULL,
    "status" "contribution_status" NOT NULL DEFAULT 'scheduled',
    "payment_method_id" UUID,
    "completed_at" TIMESTAMPTZ(6),
    "failed_at" TIMESTAMPTZ(6),
    "failure_reason" TEXT,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "contributions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gold_ledger_entries" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "entry_type" "ledger_entry_type" NOT NULL,
    "status" "ledger_status" NOT NULL DEFAULT 'posted',
    "grams_delta" DECIMAL(10,4) NOT NULL,
    "amount_paise" INTEGER,
    "gold_rate_per_gram_paise" INTEGER NOT NULL,
    "source_type" VARCHAR(50) NOT NULL,
    "source_id" UUID NOT NULL,
    "correlation_id" UUID NOT NULL,
    "idempotency_key" VARCHAR(100),
    "reversal_of_ledger_entry_id" UUID,
    "posted_at" TIMESTAMPTZ(6) NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "gold_ledger_entries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gold_balance_snapshots" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "total_grams" DECIMAL(10,4) NOT NULL,
    "total_value_paise" INTEGER NOT NULL,
    "gold_rate_used_paise" INTEGER NOT NULL,
    "snapshot_at" TIMESTAMPTZ(6) NOT NULL,
    "reason" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "gold_balance_snapshots_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_milestones" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "milestone_type" VARCHAR(50) NOT NULL,
    "reached_at" TIMESTAMPTZ(6) NOT NULL,
    "celebrated_at" TIMESTAMPTZ(6),
    "goal_id" UUID,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "user_milestones_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "idempotency_keys" (
    "id" UUID NOT NULL,
    "user_id" UUID,
    "key" VARCHAR(100) NOT NULL,
    "scope" VARCHAR(100) NOT NULL,
    "request_hash" VARCHAR(255) NOT NULL,
    "response_snapshot" JSONB,
    "resource_type" VARCHAR(50),
    "resource_id" UUID,
    "expires_at" TIMESTAMPTZ(6) NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "idempotency_keys_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "idx_payment_methods_user_id" ON "payment_methods"("user_id");

-- CreateIndex
CREATE INDEX "idx_payment_methods_user_id_is_default" ON "payment_methods"("user_id", "is_default");

-- CreateIndex
CREATE INDEX "idx_goals_user_id_status" ON "goals"("user_id", "status");

-- CreateIndex
CREATE INDEX "idx_goals_target_product_id" ON "goals"("target_product_id");

-- CreateIndex
CREATE INDEX "idx_goals_next_contribution_date" ON "goals"("next_contribution_date");

-- CreateIndex
CREATE INDEX "idx_contributions_goal_id_contribution_month" ON "contributions"("goal_id", "contribution_month" DESC);

-- CreateIndex
CREATE INDEX "idx_contributions_user_id_status" ON "contributions"("user_id", "status");

-- CreateIndex
CREATE INDEX "idx_contributions_contribution_month" ON "contributions"("contribution_month");

-- CreateIndex
CREATE INDEX "idx_gold_ledger_entries_user_id_posted_at" ON "gold_ledger_entries"("user_id", "posted_at" DESC);

-- CreateIndex
CREATE INDEX "idx_gold_ledger_entries_user_id_status" ON "gold_ledger_entries"("user_id", "status");

-- CreateIndex
CREATE INDEX "idx_gold_ledger_entries_source_type_source_id" ON "gold_ledger_entries"("source_type", "source_id");

-- CreateIndex
CREATE INDEX "idx_gold_ledger_entries_correlation_id" ON "gold_ledger_entries"("correlation_id");

-- CreateIndex
CREATE UNIQUE INDEX "gold_ledger_entries_idempotency_key_key" ON "gold_ledger_entries"("idempotency_key");

-- CreateIndex
CREATE INDEX "idx_gold_balance_snapshots_user_id_snapshot_at" ON "gold_balance_snapshots"("user_id", "snapshot_at" DESC);

-- CreateIndex
CREATE INDEX "idx_user_milestones_user_id_celebrated_at" ON "user_milestones"("user_id", "celebrated_at");

-- CreateIndex
CREATE UNIQUE INDEX "user_milestones_user_id_milestone_type_key" ON "user_milestones"("user_id", "milestone_type");

-- CreateIndex
CREATE INDEX "idx_idempotency_keys_expires_at" ON "idempotency_keys"("expires_at");

-- CreateIndex
CREATE UNIQUE INDEX "idempotency_keys_scope_key_key" ON "idempotency_keys"("scope", "key");

-- AddForeignKey
ALTER TABLE "dream_vault_items" ADD CONSTRAINT "dream_vault_items_goal_id_fkey" FOREIGN KEY ("goal_id") REFERENCES "goals"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_methods" ADD CONSTRAINT "payment_methods_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "goals" ADD CONSTRAINT "goals_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "goals" ADD CONSTRAINT "goals_target_product_id_fkey" FOREIGN KEY ("target_product_id") REFERENCES "products"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "goals" ADD CONSTRAINT "goals_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "payment_methods"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contributions" ADD CONSTRAINT "contributions_goal_id_fkey" FOREIGN KEY ("goal_id") REFERENCES "goals"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contributions" ADD CONSTRAINT "contributions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contributions" ADD CONSTRAINT "contributions_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "payment_methods"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gold_ledger_entries" ADD CONSTRAINT "gold_ledger_entries_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gold_ledger_entries" ADD CONSTRAINT "gold_ledger_entries_reversal_of_ledger_entry_id_fkey" FOREIGN KEY ("reversal_of_ledger_entry_id") REFERENCES "gold_ledger_entries"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gold_balance_snapshots" ADD CONSTRAINT "gold_balance_snapshots_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_milestones" ADD CONSTRAINT "user_milestones_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_milestones" ADD CONSTRAINT "user_milestones_goal_id_fkey" FOREIGN KEY ("goal_id") REFERENCES "goals"("id") ON DELETE SET NULL ON UPDATE CASCADE;
