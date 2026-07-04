-- CreateEnum
CREATE TYPE "scheme_type" AS ENUM ('aura', 'crest', 'dhanam', 'gold_nidhi');

-- AlterTable
ALTER TABLE "goals" ADD COLUMN "scheme_type" "scheme_type" NOT NULL DEFAULT 'aura';

-- CreateIndex
CREATE INDEX "idx_goals_scheme_type" ON "goals"("scheme_type");
