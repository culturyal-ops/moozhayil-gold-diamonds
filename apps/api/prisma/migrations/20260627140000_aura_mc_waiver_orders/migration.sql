ALTER TABLE "orders"
  ADD COLUMN IF NOT EXISTS "making_charge_waiver_paise" INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS "aura_plan_goal_id" UUID;
