-- Aura Plan lifecycle fields and discontinued status.
ALTER TYPE "goal_status" ADD VALUE IF NOT EXISTS 'discontinued';

ALTER TABLE "goals"
  ADD COLUMN IF NOT EXISTS "discontinued_at" TIMESTAMPTZ(6),
  ADD COLUMN IF NOT EXISTS "discontinued_reason" VARCHAR(500);
