-- Phase 9: Notifications, Aura, Referrals, Store Locator

CREATE TYPE "notification_type" AS ENUM (
  'contribution_due',
  'contribution_success',
  'contribution_failed',
  'milestone_reached',
  'goal_completed',
  'order_confirmed',
  'order_shipped',
  'order_delivered',
  'kyc_verified',
  'kyc_rejected',
  'gold_rate_alert',
  'aura_suggestion',
  'product_back_in_stock',
  'refund_initiated',
  'refund_completed',
  'referral_reward'
);

CREATE TYPE "aura_flow_type" AS ENUM (
  'goal_planning',
  'product_discovery',
  'gold_insights',
  'chat'
);

CREATE TYPE "aura_role" AS ENUM ('aura', 'user');

CREATE TYPE "referral_status" AS ENUM ('pending', 'registered', 'rewarded');

ALTER TABLE "users" ADD COLUMN "referral_code" VARCHAR(20);
CREATE UNIQUE INDEX "users_referral_code_key" ON "users"("referral_code");

CREATE TABLE "notifications" (
  "id" UUID NOT NULL,
  "user_id" UUID NOT NULL,
  "type" "notification_type" NOT NULL,
  "title" VARCHAR(255) NOT NULL,
  "body" TEXT NOT NULL,
  "deep_link" VARCHAR(500),
  "metadata" JSONB,
  "is_read" BOOLEAN NOT NULL DEFAULT false,
  "is_sent" BOOLEAN NOT NULL DEFAULT false,
  "sent_at" TIMESTAMPTZ(6),
  "read_at" TIMESTAMPTZ(6),
  "scheduled_for" TIMESTAMPTZ(6),
  "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ(6) NOT NULL,
  CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "notification_preferences" (
  "id" UUID NOT NULL,
  "user_id" UUID NOT NULL,
  "push_enabled" BOOLEAN NOT NULL DEFAULT true,
  "contributions_enabled" BOOLEAN NOT NULL DEFAULT true,
  "milestones_enabled" BOOLEAN NOT NULL DEFAULT true,
  "orders_enabled" BOOLEAN NOT NULL DEFAULT true,
  "kyc_enabled" BOOLEAN NOT NULL DEFAULT true,
  "aura_enabled" BOOLEAN NOT NULL DEFAULT true,
  "gold_rate_alert_enabled" BOOLEAN NOT NULL DEFAULT false,
  "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ(6) NOT NULL,
  CONSTRAINT "notification_preferences_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "aura_sessions" (
  "id" UUID NOT NULL,
  "user_id" UUID NOT NULL,
  "flow_type" "aura_flow_type" NOT NULL,
  "summary" TEXT,
  "started_at" TIMESTAMPTZ(6) NOT NULL,
  "ended_at" TIMESTAMPTZ(6),
  "expires_at" TIMESTAMPTZ(6) NOT NULL,
  "goal_created" BOOLEAN NOT NULL DEFAULT false,
  "products_added_to_vault" INTEGER NOT NULL DEFAULT 0,
  "goal_id_created" UUID,
  "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ(6) NOT NULL,
  CONSTRAINT "aura_sessions_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "aura_messages" (
  "id" UUID NOT NULL,
  "session_id" UUID NOT NULL,
  "role" "aura_role" NOT NULL,
  "content" TEXT NOT NULL,
  "metadata" JSONB,
  "sequence" INTEGER NOT NULL,
  "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "aura_messages_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "product_views" (
  "id" UUID NOT NULL,
  "user_id" UUID,
  "anonymous_id" VARCHAR(100),
  "product_id" UUID NOT NULL,
  "source" VARCHAR(50),
  "viewed_at" TIMESTAMPTZ(6) NOT NULL,
  "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "product_views_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "referrals" (
  "id" UUID NOT NULL,
  "referrer_user_id" UUID NOT NULL,
  "referred_user_id" UUID,
  "referral_code" VARCHAR(20) NOT NULL,
  "status" "referral_status" NOT NULL DEFAULT 'pending',
  "registered_at" TIMESTAMPTZ(6),
  "rewarded_at" TIMESTAMPTZ(6),
  "reward_type" VARCHAR(50),
  "reward_value_paise" INTEGER,
  "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ(6) NOT NULL,
  CONSTRAINT "referrals_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "store_locations" (
  "id" UUID NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "address" TEXT NOT NULL,
  "city" VARCHAR(100) NOT NULL,
  "state" VARCHAR(100) NOT NULL,
  "pincode" VARCHAR(6) NOT NULL,
  "phone" VARCHAR(15) NOT NULL,
  "latitude" DECIMAL(9,6) NOT NULL,
  "longitude" DECIMAL(9,6) NOT NULL,
  "opening_hours" JSONB NOT NULL,
  "is_active" BOOLEAN NOT NULL DEFAULT true,
  "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ(6) NOT NULL,
  CONSTRAINT "store_locations_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "notification_preferences_user_id_key" ON "notification_preferences"("user_id");
CREATE INDEX "idx_notifications_user_id_created_at" ON "notifications"("user_id", "created_at" DESC);
CREATE INDEX "idx_notifications_user_id_is_read" ON "notifications"("user_id", "is_read");
CREATE INDEX "idx_notifications_scheduled_for" ON "notifications"("scheduled_for");

CREATE INDEX "idx_aura_sessions_user_id_started_at" ON "aura_sessions"("user_id", "started_at" DESC);
CREATE INDEX "idx_aura_sessions_expires_at" ON "aura_sessions"("expires_at");
CREATE UNIQUE INDEX "aura_messages_session_id_sequence_key" ON "aura_messages"("session_id", "sequence");
CREATE INDEX "idx_aura_messages_session_id_sequence" ON "aura_messages"("session_id", "sequence");

CREATE INDEX "idx_product_views_user_id_viewed_at" ON "product_views"("user_id", "viewed_at" DESC);
CREATE INDEX "idx_product_views_product_id_viewed_at" ON "product_views"("product_id", "viewed_at" DESC);
CREATE INDEX "idx_product_views_anonymous_id" ON "product_views"("anonymous_id");

CREATE UNIQUE INDEX "referrals_referred_user_id_key" ON "referrals"("referred_user_id");
CREATE INDEX "idx_referrals_referrer_user_id" ON "referrals"("referrer_user_id");
CREATE INDEX "idx_referrals_status" ON "referrals"("status");
CREATE INDEX "idx_referrals_referral_code" ON "referrals"("referral_code");

CREATE INDEX "idx_store_locations_city" ON "store_locations"("city");
CREATE INDEX "idx_store_locations_pincode" ON "store_locations"("pincode");
CREATE INDEX "idx_store_locations_is_active" ON "store_locations"("is_active");
CREATE INDEX "idx_store_locations_lat_lng" ON "store_locations"("latitude", "longitude");

ALTER TABLE "notifications" ADD CONSTRAINT "notifications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "notification_preferences" ADD CONSTRAINT "notification_preferences_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "aura_sessions" ADD CONSTRAINT "aura_sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "aura_sessions" ADD CONSTRAINT "aura_sessions_goal_id_created_fkey" FOREIGN KEY ("goal_id_created") REFERENCES "goals"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "aura_messages" ADD CONSTRAINT "aura_messages_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "aura_sessions"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "product_views" ADD CONSTRAINT "product_views_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "product_views" ADD CONSTRAINT "product_views_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "referrals" ADD CONSTRAINT "referrals_referrer_user_id_fkey" FOREIGN KEY ("referrer_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "referrals" ADD CONSTRAINT "referrals_referred_user_id_fkey" FOREIGN KEY ("referred_user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

INSERT INTO "store_locations" (
  "id", "name", "address", "city", "state", "pincode", "phone",
  "latitude", "longitude", "opening_hours", "is_active", "updated_at"
) VALUES (
  gen_random_uuid(),
  'Moozhayil Gold & Diamonds, Thrissur',
  'Round North, Thrissur, Kerala 680001',
  'Thrissur',
  'Kerala',
  '680001',
  '+914872123456',
  10.527600,
  76.214400,
  '{"mon":"10:00-19:00","tue":"10:00-19:00","wed":"10:00-19:00","thu":"10:00-19:00","fri":"10:00-19:00","sat":"10:00-19:00","sun":"closed"}'::jsonb,
  true,
  CURRENT_TIMESTAMP
);
