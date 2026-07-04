-- Phase 3 - Database, Auth, Users, and Sessions
-- Source: docs/15-development-roadmap.md Phase 3 + docs/17-database-bible.md

CREATE TYPE "kyc_status" AS ENUM (
  'not_started',
  'in_progress',
  'in_review',
  'basic_verified',
  'enhanced_verified',
  'rejected'
);

CREATE TYPE "intent_type" AS ENUM (
  'wedding',
  'investment',
  'festival',
  'gift',
  'family',
  'other'
);

CREATE TYPE "otp_session_status" AS ENUM (
  'pending',
  'verified',
  'expired',
  'blocked'
);

CREATE TYPE "device_platform" AS ENUM (
  'ios',
  'android',
  'web'
);

CREATE TABLE "users" (
  "id" UUID NOT NULL DEFAULT gen_random_uuid(),
  "phone" VARCHAR(15) NOT NULL,
  "name" VARCHAR(100),
  "email" VARCHAR(255),
  "city" VARCHAR(100),
  "kyc_status" "kyc_status" NOT NULL DEFAULT 'not_started',
  "kyc_verified_at" TIMESTAMPTZ,
  "member_since" DATE NOT NULL DEFAULT CURRENT_DATE,
  "last_active_at" TIMESTAMPTZ,
  "deleted_at" TIMESTAMPTZ,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "user_devices" (
  "id" UUID NOT NULL DEFAULT gen_random_uuid(),
  "user_id" UUID NOT NULL,
  "platform" "device_platform" NOT NULL,
  "push_token" VARCHAR(500) NOT NULL,
  "device_fingerprint" VARCHAR(255),
  "app_version" VARCHAR(50),
  "last_seen_at" TIMESTAMPTZ,
  "disabled_at" TIMESTAMPTZ,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "user_devices_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "auth_sessions" (
  "id" UUID NOT NULL DEFAULT gen_random_uuid(),
  "user_id" UUID NOT NULL,
  "refresh_token_hash" VARCHAR(255) NOT NULL,
  "device_id" UUID,
  "expires_at" TIMESTAMPTZ NOT NULL,
  "revoked_at" TIMESTAMPTZ,
  "last_used_at" TIMESTAMPTZ,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "auth_sessions_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "user_intents" (
  "id" UUID NOT NULL DEFAULT gen_random_uuid(),
  "user_id" UUID NOT NULL,
  "intent_type" "intent_type" NOT NULL,
  "selected_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "is_active" BOOLEAN NOT NULL DEFAULT true,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "user_intents_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "otp_sessions" (
  "id" UUID NOT NULL DEFAULT gen_random_uuid(),
  "phone" VARCHAR(15) NOT NULL,
  "user_id" UUID,
  "otp_hash" VARCHAR(255) NOT NULL,
  "status" "otp_session_status" NOT NULL DEFAULT 'pending',
  "attempts" INTEGER NOT NULL DEFAULT 0,
  "expires_at" TIMESTAMPTZ NOT NULL,
  "verified_at" TIMESTAMPTZ,
  "blocked_at" TIMESTAMPTZ,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "otp_sessions_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "users_phone_key" ON "users"("phone");
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");
CREATE INDEX "idx_users_kyc_status" ON "users"("kyc_status");
CREATE INDEX "idx_users_last_active_at" ON "users"("last_active_at");

CREATE UNIQUE INDEX "user_devices_push_token_key" ON "user_devices"("push_token");
CREATE INDEX "idx_user_devices_user_id" ON "user_devices"("user_id");
CREATE INDEX "idx_user_devices_last_seen_at" ON "user_devices"("last_seen_at");

CREATE UNIQUE INDEX "auth_sessions_refresh_token_hash_key" ON "auth_sessions"("refresh_token_hash");
CREATE INDEX "idx_auth_sessions_user_id" ON "auth_sessions"("user_id");
CREATE INDEX "idx_auth_sessions_device_id" ON "auth_sessions"("device_id");
CREATE INDEX "idx_auth_sessions_expires_at" ON "auth_sessions"("expires_at");

CREATE INDEX "idx_user_intents_user_id" ON "user_intents"("user_id");
CREATE INDEX "idx_user_intents_intent_type" ON "user_intents"("intent_type");
CREATE UNIQUE INDEX "uq_user_intents_user_intent_active"
  ON "user_intents"("user_id", "intent_type")
  WHERE "is_active" = true;

CREATE INDEX "idx_otp_sessions_phone" ON "otp_sessions"("phone");
CREATE INDEX "idx_otp_sessions_expires_at" ON "otp_sessions"("expires_at");
CREATE INDEX "idx_otp_sessions_status" ON "otp_sessions"("status");

ALTER TABLE "user_devices"
  ADD CONSTRAINT "fk_user_devices_user_id_users"
  FOREIGN KEY ("user_id") REFERENCES "users"("id")
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "auth_sessions"
  ADD CONSTRAINT "fk_auth_sessions_user_id_users"
  FOREIGN KEY ("user_id") REFERENCES "users"("id")
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "auth_sessions"
  ADD CONSTRAINT "fk_auth_sessions_device_id_user_devices"
  FOREIGN KEY ("device_id") REFERENCES "user_devices"("id")
  ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "user_intents"
  ADD CONSTRAINT "fk_user_intents_user_id_users"
  FOREIGN KEY ("user_id") REFERENCES "users"("id")
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "otp_sessions"
  ADD CONSTRAINT "fk_otp_sessions_user_id_users"
  FOREIGN KEY ("user_id") REFERENCES "users"("id")
  ON DELETE SET NULL ON UPDATE CASCADE;
