import { randomUUID } from "crypto";
import type { Prisma } from "@prisma/client";
import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import type {
  RegisterDeviceInput,
  SaveIntentInput,
  UpdateMeInput,
} from "./users.schema";
import { goalsService } from "../goals/goals.service";

async function userDto(user: {
  id: string;
  name: string | null;
  phone: string;
  email: string | null;
  city: string | null;
  kycStatus: string;
  memberSince: Date;
  intents: { intentType: string; isActive: boolean }[];
}) {
  const activeGoalsCount = await goalsService.countActiveGoals(user.id);

  return {
    id: user.id,
    name: user.name,
    phone: user.phone,
    email: user.email,
    city: user.city,
    kyc_status: user.kycStatus,
    kyc_display:
      user.kycStatus === "basic_verified" || user.kycStatus === "enhanced_verified"
        ? "Verified Member"
        : "Complete KYC",
    member_since: user.memberSince.toISOString().slice(0, 10),
    intent_tags: user.intents
      .filter((intent) => intent.isActive)
      .map((intent) => intent.intentType),
    active_goals_count: activeGoalsCount,
  };
}

export class UsersService {
  async getMe(userId: string) {
    const user = await prisma.user.findUnique({
      where: { id: userId },
      include: {
        intents: true,
      },
    });

    if (!user || user.deletedAt) {
      throw new AppError(404, "NOT_FOUND", "User does not exist");
    }

    return userDto(user);
  }

  async updateMe(userId: string, input: UpdateMeInput) {
    const user = await prisma.user.update({
      where: { id: userId },
      data: {
        ...(input.name !== undefined ? { name: input.name } : {}),
        ...(input.email !== undefined ? { email: input.email } : {}),
        ...(input.city !== undefined ? { city: input.city } : {}),
        lastActiveAt: new Date(),
      },
      include: {
        intents: true,
      },
    });

    return userDto(user);
  }

  async saveIntents(userId: string, input: SaveIntentInput) {
    const uniqueIntents = [...new Set(input.intents)];
    const now = new Date();

    await prisma.$transaction(async (tx) => {
      await tx.userIntent.updateMany({
        where: {
          userId,
          isActive: true,
          intentType: { notIn: uniqueIntents },
        },
        data: {
          isActive: false,
        },
      });

      for (const intent of uniqueIntents) {
        await tx.userIntent.upsert({
          where: {
            // Prisma cannot infer the partial unique index from PostgreSQL, so
            // this composite lookup is intentionally performed by find/update.
            id: await this.findActiveIntentId(tx, userId, intent),
          },
          create: {
            userId,
            intentType: intent,
            selectedAt: now,
            isActive: true,
          },
          update: {
            selectedAt: now,
            isActive: true,
          },
        });
      }
    });

    return {
      success: true,
      intents: uniqueIntents,
    };
  }

  async registerDevice(userId: string, input: RegisterDeviceInput) {
    const device = await prisma.userDevice.upsert({
      where: { pushToken: input.push_token },
      create: {
        userId,
        pushToken: input.push_token,
        platform: input.platform,
        deviceFingerprint: input.device_fingerprint ?? null,
        appVersion: input.app_version ?? null,
        lastSeenAt: new Date(),
      },
      update: {
        userId,
        platform: input.platform,
        deviceFingerprint: input.device_fingerprint ?? null,
        appVersion: input.app_version ?? null,
        lastSeenAt: new Date(),
        disabledAt: null,
      },
      select: {
        id: true,
      },
    });

    return {
      device_id: device.id,
      success: true,
    };
  }

  async deleteDevice(userId: string, deviceId: string) {
    const device = await prisma.userDevice.findFirst({
      where: { id: deviceId, userId },
    });

    if (!device) {
      throw new AppError(404, "NOT_FOUND", "Device does not exist");
    }

    await prisma.userDevice.update({
      where: { id: deviceId },
      data: { disabledAt: new Date() },
    });

    return { success: true };
  }

  private async findActiveIntentId(
    tx: Prisma.TransactionClient,
    userId: string,
    intentType: SaveIntentInput["intents"][number],
  ) {
    const existing = await tx.userIntent.findFirst({
      where: { userId, intentType, isActive: true },
      select: { id: true },
    });

    return existing?.id ?? randomUUID();
  }
}

export const usersService = new UsersService();
