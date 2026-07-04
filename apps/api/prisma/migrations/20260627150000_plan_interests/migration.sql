CREATE TABLE IF NOT EXISTS "plan_interests" (
  "id" UUID NOT NULL DEFAULT gen_random_uuid(),
  "user_id" UUID NOT NULL,
  "scheme_type" "scheme_type" NOT NULL,
  "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "plan_interests_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX IF NOT EXISTS "plan_interests_user_id_scheme_type_key"
  ON "plan_interests"("user_id", "scheme_type");

CREATE INDEX IF NOT EXISTS "idx_plan_interests_scheme_type"
  ON "plan_interests"("scheme_type");

ALTER TABLE "plan_interests"
  ADD CONSTRAINT "plan_interests_user_id_fkey"
  FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
