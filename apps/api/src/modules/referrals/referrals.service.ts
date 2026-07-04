import { randomBytes } from "crypto";
import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import { formatPaise } from "../../utils/money";
import { notifyReferralReward } from "../notifications/notifications.triggers";
import { goldLedgerService } from "../gold_ledger/gold_ledger.service";
import { goldRatesService } from "../gold_rates/gold_rates.service";
import { GOAL_ACCUMULATION_PURITY } from "../../config/goals.constants";
import { REFERRAL_REWARD_PAISE } from "../../config/referrals.constants";
import { toDateOnly } from "../../utils/dates";

function normalizeReferralCode(name: string | null, userId: string): string {
  const base = (name ?? "MOOZH")
    .replace(/[^a-zA-Z]/g, "")
    .slice(0, 6)
    .toUpperCase();
  const year = new Date().getFullYear();
  const suffix = userId.replace(/-/g, "").slice(0, 4).toUpperCase();
  return `${base}${year}${suffix}`.slice(0, 20);
}

export class ReferralsService {
  async getMyCode(userId: string) {
    const user = await prisma.user.findUniqueOrThrow({ where: { id: userId } });

    let code = user.referralCode;
    if (!code) {
      code = normalizeReferralCode(user.name, user.id);
      let attempts = 0;
      while (attempts < 5) {
        try {
          await prisma.user.update({
            where: { id: userId },
            data: { referralCode: code },
          });
          break;
        } catch {
          code = `${normalizeReferralCode(user.name, user.id)}${randomBytes(1).toString("hex").toUpperCase()}`;
          attempts += 1;
        }
      }
    }

    const successfulReferrals = await prisma.referral.count({
      where: { referrerUserId: userId, status: "rewarded" },
    });
    const pendingReferrals = await prisma.referral.count({
      where: {
        referrerUserId: userId,
        status: { in: ["pending", "registered"] },
      },
    });

    return {
      referral_code: code,
      share_url: `https://moozhayil.com/r/${code}`,
      reward_description:
        "Both you and your friend get ₹500 in gold credit",
      successful_referrals: successfulReferrals,
      pending_referrals: pendingReferrals,
    };
  }

  async apply(userId: string, referralCode: string, deviceFingerprint?: string) {
    const normalizedCode = referralCode.trim().toUpperCase();
    const user = await prisma.user.findUniqueOrThrow({ where: { id: userId } });

    if (user.referralCode === normalizedCode) {
      throw new AppError(422, "UNPROCESSABLE", "You cannot use your own referral code");
    }

    const referrer = await prisma.user.findFirst({
      where: { referralCode: normalizedCode, deletedAt: null },
    });

    if (!referrer) {
      throw new AppError(404, "NOT_FOUND", "Referral code is invalid");
    }

    if (referrer.id === userId) {
      throw new AppError(422, "UNPROCESSABLE", "You cannot use your own referral code");
    }

    if (referrer.phone === user.phone) {
      throw new AppError(422, "UNPROCESSABLE", "Self-referral is not allowed");
    }

    if (deviceFingerprint) {
      const referrerDevice = await prisma.userDevice.findFirst({
        where: {
          userId: referrer.id,
          deviceFingerprint,
          disabledAt: null,
        },
      });
      const referredDevice = await prisma.userDevice.findFirst({
        where: {
          userId,
          deviceFingerprint,
          disabledAt: null,
        },
      });

      if (referrerDevice && referredDevice) {
        throw new AppError(422, "UNPROCESSABLE", "Self-referral is not allowed");
      }
    }

    const existing = await prisma.referral.findUnique({
      where: { referredUserId: userId },
    });

    if (existing) {
      throw new AppError(409, "CONFLICT", "Referral code already applied");
    }

    await prisma.referral.create({
      data: {
        referrerUserId: referrer.id,
        referredUserId: userId,
        referralCode: normalizedCode,
        status: "registered",
        registeredAt: new Date(),
      },
    });

    return {
      success: true,
      reward: "₹500 gold credit will be applied on your first goal enrollment.",
    };
  }

  async listHistory(userId: string) {
    const referrals = await prisma.referral.findMany({
      where: { referrerUserId: userId },
      orderBy: { createdAt: "desc" },
    });

    return {
      referrals: referrals.map((referral) => ({
        id: referral.id,
        referral_code: referral.referralCode,
        status: referral.status,
        registered_at: referral.registeredAt?.toISOString() ?? null,
        rewarded_at: referral.rewardedAt?.toISOString() ?? null,
        reward_value_display:
          referral.rewardValuePaise != null
            ? formatPaise(referral.rewardValuePaise)
            : null,
      })),
    };
  }

  async processRewardForFirstContribution(userId: string) {
    const referral = await prisma.referral.findUnique({
      where: { referredUserId: userId },
    });

    if (!referral || referral.status === "rewarded") {
      return false;
    }

    const goalCount = await prisma.goal.count({
      where: { userId, deletedAt: null },
    });

    if (goalCount === 0) {
      return false;
    }

    const completedContributions = await prisma.contribution.count({
      where: { userId, status: "completed" },
    });

    if (completedContributions !== 1) {
      return false;
    }

    const referrerGoal = await prisma.goal.findFirst({
      where: {
        userId: referral.referrerUserId,
        deletedAt: null,
        status: { in: ["active", "contribution_due", "paused"] },
      },
      orderBy: { createdAt: "asc" },
    });

    if (!referrerGoal) {
      return false;
    }

    const rate = await goldRatesService.currentRateForPurity(GOAL_ACCUMULATION_PURITY);

    const bonusContribution = await prisma.contribution.create({
      data: {
        goalId: referrerGoal.id,
        userId: referral.referrerUserId,
        amountPaise: REFERRAL_REWARD_PAISE,
        goldRatePerGramPaise: rate.ratePerGramPaise,
        contributionMonth: toDateOnly(new Date()),
        type: "bonus",
        status: "completed",
        completedAt: new Date(),
      },
    });

    await prisma.referral.update({
      where: { id: referral.id },
      data: {
        status: "rewarded",
        rewardedAt: new Date(),
        rewardType: "gold_credit",
        rewardValuePaise: REFERRAL_REWARD_PAISE,
      },
    });

    await goldLedgerService.postBonusCredit({
      userId: referral.referrerUserId,
      contributionId: bonusContribution.id,
      amountPaise: REFERRAL_REWARD_PAISE,
      goldRatePerGramPaise: rate.ratePerGramPaise,
    });

    await notifyReferralReward({
      userId: referral.referrerUserId,
      rewardDisplay: formatPaise(REFERRAL_REWARD_PAISE),
    });

    return true;
  }
}

export const referralsService = new ReferralsService();
