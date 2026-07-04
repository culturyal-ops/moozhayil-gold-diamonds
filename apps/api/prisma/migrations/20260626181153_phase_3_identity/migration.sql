-- AlterTable
ALTER TABLE "auth_sessions" ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "otp_sessions" ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "user_devices" ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "user_intents" ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "users" ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "member_since" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "updated_at" DROP DEFAULT;

-- RenameForeignKey
ALTER TABLE "auth_sessions" RENAME CONSTRAINT "fk_auth_sessions_device_id_user_devices" TO "auth_sessions_device_id_fkey";

-- RenameForeignKey
ALTER TABLE "auth_sessions" RENAME CONSTRAINT "fk_auth_sessions_user_id_users" TO "auth_sessions_user_id_fkey";

-- RenameForeignKey
ALTER TABLE "otp_sessions" RENAME CONSTRAINT "fk_otp_sessions_user_id_users" TO "otp_sessions_user_id_fkey";

-- RenameForeignKey
ALTER TABLE "user_devices" RENAME CONSTRAINT "fk_user_devices_user_id_users" TO "user_devices_user_id_fkey";

-- RenameForeignKey
ALTER TABLE "user_intents" RENAME CONSTRAINT "fk_user_intents_user_id_users" TO "user_intents_user_id_fkey";
