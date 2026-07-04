-- CreateEnum
CREATE TYPE "admin_role" AS ENUM ('super_admin', 'catalog_manager', 'kyc_reviewer', 'order_manager', 'finance_manager', 'support_agent', 'auditor');

-- CreateTable
CREATE TABLE "admin_users" (
    "id" UUID NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "role" "admin_role" NOT NULL,
    "mfa_enabled" BOOLEAN NOT NULL DEFAULT false,
    "disabled_at" TIMESTAMPTZ(6),
    "last_login_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "admin_users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kyc_documents" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "aadhaar_number_encrypted" TEXT,
    "aadhaar_verified" BOOLEAN NOT NULL DEFAULT false,
    "pan_number_encrypted" TEXT,
    "pan_verified" BOOLEAN NOT NULL DEFAULT false,
    "selfie_s3_key" VARCHAR(1000),
    "selfie_verified" BOOLEAN NOT NULL DEFAULT false,
    "name_on_aadhaar_encrypted" TEXT,
    "name_on_pan_encrypted" TEXT,
    "submitted_at" TIMESTAMPTZ(6),
    "reviewed_at" TIMESTAMPTZ(6),
    "rejection_reason" TEXT,
    "reviewer_id" UUID,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "kyc_documents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kyc_aadhaar_sessions" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "aadhaar_number_encrypted" TEXT NOT NULL,
    "otp_hash" VARCHAR(255) NOT NULL,
    "attempts" INTEGER NOT NULL DEFAULT 0,
    "expires_at" TIMESTAMPTZ(6) NOT NULL,
    "verified_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "kyc_aadhaar_sessions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "audit_logs" (
    "id" UUID NOT NULL,
    "actor_type" VARCHAR(30) NOT NULL,
    "actor_id" UUID,
    "action" VARCHAR(100) NOT NULL,
    "entity_type" VARCHAR(100) NOT NULL,
    "entity_id" UUID,
    "before" JSONB,
    "after" JSONB,
    "reason" TEXT,
    "request_id" UUID,
    "ip_address" VARCHAR(45),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "audit_logs_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "admin_users_email_key" ON "admin_users"("email");

-- CreateIndex
CREATE INDEX "idx_admin_users_email" ON "admin_users"("email");

-- CreateIndex
CREATE INDEX "idx_admin_users_role" ON "admin_users"("role");

-- CreateIndex
CREATE UNIQUE INDEX "kyc_documents_user_id_key" ON "kyc_documents"("user_id");

-- CreateIndex
CREATE INDEX "idx_kyc_documents_user_id" ON "kyc_documents"("user_id");

-- CreateIndex
CREATE INDEX "idx_kyc_documents_submitted_at" ON "kyc_documents"("submitted_at");

-- CreateIndex
CREATE INDEX "idx_kyc_documents_reviewed_at" ON "kyc_documents"("reviewed_at");

-- CreateIndex
CREATE INDEX "idx_kyc_documents_reviewer_id" ON "kyc_documents"("reviewer_id");

-- CreateIndex
CREATE INDEX "idx_kyc_aadhaar_sessions_user_id" ON "kyc_aadhaar_sessions"("user_id");

-- CreateIndex
CREATE INDEX "idx_kyc_aadhaar_sessions_expires_at" ON "kyc_aadhaar_sessions"("expires_at");

-- CreateIndex
CREATE INDEX "idx_audit_logs_entity_type_entity_id" ON "audit_logs"("entity_type", "entity_id");

-- CreateIndex
CREATE INDEX "idx_audit_logs_actor_type_actor_id" ON "audit_logs"("actor_type", "actor_id");

-- CreateIndex
CREATE INDEX "idx_audit_logs_action" ON "audit_logs"("action");

-- CreateIndex
CREATE INDEX "idx_audit_logs_created_at" ON "audit_logs"("created_at");

-- AddForeignKey
ALTER TABLE "kyc_documents" ADD CONSTRAINT "kyc_documents_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kyc_documents" ADD CONSTRAINT "kyc_documents_reviewer_id_fkey" FOREIGN KEY ("reviewer_id") REFERENCES "admin_users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kyc_aadhaar_sessions" ADD CONSTRAINT "kyc_aadhaar_sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
