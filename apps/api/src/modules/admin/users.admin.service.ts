import Decimal from "decimal.js";
import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import { writeAuditLog } from "../../utils/audit";
import { SCHEME_DISPLAY_NAMES } from "../../config/schemes.constants";
import { goldLedgerService } from "../gold_ledger/gold_ledger.service";
import { goldBalanceService } from "../gold_ledger/gold_balance.service";
import { mapOrderToDto } from "../orders/order.mapper";
import type { AdminUserCreateInput } from "./admin.schema";

function maskPhone(phone: string): string {
  return phone.replace(/(\+\d{2})(\d{2})\d{4}(\d{4})/, "$1$2****$3");
}

const ACTIVE_GOAL_STATUSES = ["active", "contribution_due", "paused"] as const;

export class UsersAdminService {
  async supportSummary(userId: string) {
    const user = await prisma.user.findUnique({
      where: { id: userId },
      select: {
        id: true,
        name: true,
        phone: true,
        email: true,
        city: true,
        kycStatus: true,
        kycVerifiedAt: true,
        memberSince: true,
        lastActiveAt: true,
      },
    });

    if (!user) {
      throw new AppError(404, "NOT_FOUND", "User does not exist");
    }

    const [orderSummary, balanceGrams, goalsCount] = await Promise.all([
      prisma.order.groupBy({
        by: ["status"],
        where: { userId },
        _count: { _all: true },
      }),
      goldLedgerService.getPostedBalanceGrams(userId),
      prisma.goal.count({ where: { userId, deletedAt: null } }),
    ]);

    const phoneMasked = maskPhone(user.phone);

    return {
      user: {
        id: user.id,
        name: user.name,
        phone_masked: phoneMasked,
        email: user.email,
        city: user.city,
        kyc_status: user.kycStatus,
        kyc_verified_at: user.kycVerifiedAt?.toISOString() ?? null,
        member_since: user.memberSince.toISOString().slice(0, 10),
        last_active_at: user.lastActiveAt?.toISOString() ?? null,
      },
      gold_balance_grams: balanceGrams.toFixed(4),
      active_goals: goalsCount,
      orders_by_status: Object.fromEntries(
        orderSummary.map((row) => [row.status, row._count._all]),
      ),
    };
  }

  async getCustomerDetail(userId: string) {
    const user = await prisma.user.findFirst({
      where: { id: userId, deletedAt: null },
      select: {
        id: true,
        name: true,
        phone: true,
        email: true,
        city: true,
        kycStatus: true,
        kycVerifiedAt: true,
        memberSince: true,
        lastActiveAt: true,
        referralCode: true,
        createdAt: true,
      },
    });

    if (!user) {
      throw new AppError(404, "NOT_FOUND", "User does not exist");
    }

    const [
      balanceGrams,
      goals,
      orders,
      addresses,
      dreamVaultCount,
      ledgerEntries,
      orderSummary,
    ] = await Promise.all([
      goldLedgerService.getPostedBalanceGrams(userId),
      prisma.goal.findMany({
        where: { userId, deletedAt: null },
        orderBy: { createdAt: "desc" },
        take: 20,
        select: {
          id: true,
          name: true,
          schemeType: true,
          status: true,
          monthlyAmountPaise: true,
          startDate: true,
          nextContributionDate: true,
        },
      }),
      prisma.order.findMany({
        where: { userId },
        include: { items: true },
        orderBy: { createdAt: "desc" },
        take: 10,
      }),
      prisma.address.findMany({
        where: { userId, deletedAt: null },
        orderBy: [{ isDefault: "desc" }, { createdAt: "desc" }],
      }),
      prisma.dreamVaultItem.count({
        where: { userId, removedAt: null },
      }),
      prisma.goldLedgerEntry.findMany({
        where: { userId, status: "posted" },
        orderBy: { postedAt: "desc" },
        take: 10,
        select: {
          id: true,
          entryType: true,
          gramsDelta: true,
          amountPaise: true,
          postedAt: true,
          sourceType: true,
        },
      }),
      prisma.order.groupBy({
        by: ["status"],
        where: { userId },
        _count: { _all: true },
      }),
    ]);

    return {
      user: {
        id: user.id,
        name: user.name,
        phone_masked: maskPhone(user.phone),
        email: user.email,
        city: user.city,
        kyc_status: user.kycStatus,
        kyc_verified_at: user.kycVerifiedAt?.toISOString() ?? null,
        member_since: user.memberSince.toISOString().slice(0, 10),
        last_active_at: user.lastActiveAt?.toISOString() ?? null,
        referral_code: user.referralCode,
        created_at: user.createdAt.toISOString(),
      },
      my_gold: {
        balance_grams: balanceGrams.toFixed(4),
      },
      active_schemes: goals
        .filter((goal) =>
          (ACTIVE_GOAL_STATUSES as readonly string[]).includes(goal.status),
        )
        .map((goal) => ({
          id: goal.id,
          name: goal.name,
          scheme_type: goal.schemeType,
          scheme_display:
            SCHEME_DISPLAY_NAMES[goal.schemeType] ?? goal.schemeType,
          status: goal.status,
          monthly_amount_paise: goal.monthlyAmountPaise,
          start_date: goal.startDate.toISOString().slice(0, 10),
          next_contribution_date: goal.nextContributionDate
            .toISOString()
            .slice(0, 10),
        })),
      schemes: goals.map((goal) => ({
        id: goal.id,
        name: goal.name,
        scheme_type: goal.schemeType,
        scheme_display: SCHEME_DISPLAY_NAMES[goal.schemeType] ?? goal.schemeType,
        status: goal.status,
        monthly_amount_paise: goal.monthlyAmountPaise,
        start_date: goal.startDate.toISOString().slice(0, 10),
      })),
      orders: orders.map(mapOrderToDto),
      orders_by_status: Object.fromEntries(
        orderSummary.map((row) => [row.status, row._count._all]),
      ),
      addresses: addresses.map((address) => ({
        id: address.id,
        label: address.label,
        full_name: address.fullName,
        phone: maskPhone(address.phone),
        line1: address.line1,
        line2: address.line2,
        city: address.city,
        state: address.state,
        pincode: address.pincode,
        is_default: address.isDefault,
      })),
      dream_vault_items: dreamVaultCount,
      ledger_entries: ledgerEntries.map((entry) => ({
        id: entry.id,
        entry_type: entry.entryType,
        grams_delta: entry.gramsDelta.toString(),
        amount_paise: entry.amountPaise,
        posted_at: entry.postedAt?.toISOString() ?? null,
        source_type: entry.sourceType,
      })),
    };
  }

  async createCustomer(
    adminId: string,
    input: AdminUserCreateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const existing = await prisma.user.findUnique({
      where: { phone: input.phone },
      select: { id: true },
    });

    if (existing) {
      throw new AppError(409, "CONFLICT", "A customer with this phone already exists");
    }

    if (input.email) {
      const emailTaken = await prisma.user.findUnique({
        where: { email: input.email },
        select: { id: true },
      });

      if (emailTaken) {
        throw new AppError(409, "CONFLICT", "A customer with this email already exists");
      }
    }

    const user = await prisma.user.create({
      data: {
        phone: input.phone,
        name: input.name,
        email: input.email,
        city: input.city,
      },
      select: {
        id: true,
        name: true,
        phone: true,
        kycStatus: true,
        memberSince: true,
      },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "admin_customer_created",
      entityType: "user",
      entityId: user.id,
      after: {
        phone_masked: maskPhone(user.phone),
        name: user.name,
      },
      requestId,
      ipAddress,
    });

    return {
      user: {
        id: user.id,
        name: user.name,
        phone_masked: maskPhone(user.phone),
        kyc_status: user.kycStatus,
        member_since: user.memberSince.toISOString().slice(0, 10),
      },
    };
  }

  async listUsers(input: { cursor?: string; limit: number; query?: string }) {
    const users = await prisma.user.findMany({
      where: input.query
        ? {
            OR: [
              { phone: { contains: input.query } },
              { name: { contains: input.query, mode: "insensitive" } },
              { email: { contains: input.query, mode: "insensitive" } },
            ],
          }
        : undefined,
      select: {
        id: true,
        name: true,
        phone: true,
        kycStatus: true,
        memberSince: true,
        lastActiveAt: true,
      },
      orderBy: { createdAt: "desc" },
      cursor: input.cursor ? { id: input.cursor } : undefined,
      skip: input.cursor ? 1 : 0,
      take: input.limit + 1,
    });

    const pageUsers = users.slice(0, input.limit);
    const userIds = pageUsers.map((user) => user.id);

    const [goalCounts, orderCounts, balances] = await Promise.all([
      userIds.length
        ? prisma.goal.groupBy({
            by: ["userId"],
            where: {
              userId: { in: userIds },
              deletedAt: null,
              status: { in: [...ACTIVE_GOAL_STATUSES] },
            },
            _count: { _all: true },
          })
        : Promise.resolve([]),
      userIds.length
        ? prisma.order.groupBy({
            by: ["userId"],
            where: { userId: { in: userIds } },
            _count: { _all: true },
          })
        : Promise.resolve([]),
      Promise.all(
        userIds.map(async (userId) => ({
          userId,
          grams: (await goldLedgerService.getPostedBalanceGrams(userId)).toFixed(4),
        })),
      ),
    ]);

    const goalCountByUser = Object.fromEntries(
      goalCounts.map((row) => [row.userId, row._count._all]),
    );
    const orderCountByUser = Object.fromEntries(
      orderCounts.map((row) => [row.userId, row._count._all]),
    );
    const balanceByUser = Object.fromEntries(
      balances.map((row) => [row.userId, row.grams]),
    );

    return {
      users: pageUsers.map((user) => ({
        id: user.id,
        name: user.name,
        phone: maskPhone(user.phone),
        kyc_status: user.kycStatus,
        member_since: user.memberSince.toISOString().slice(0, 10),
        last_active_at: user.lastActiveAt?.toISOString() ?? null,
        active_schemes: goalCountByUser[user.id] ?? 0,
        orders_count: orderCountByUser[user.id] ?? 0,
        gold_balance_grams: balanceByUser[user.id] ?? "0.0000",
      })),
      next_cursor: users.length > input.limit ? users[input.limit].id : null,
    };
  }
}

export const usersAdminService = new UsersAdminService();

export class LedgerAdjustmentsService {
  async create(
    adminId: string,
    input: {
      user_id: string;
      grams_delta: string;
      amount_paise?: number;
      reason: string;
    },
    idempotencyKey: string,
    requestId?: string,
    ipAddress?: string,
  ) {
    const grams = new Decimal(input.grams_delta);
    if (grams.isZero()) {
      throw new AppError(400, "BAD_REQUEST", "grams_delta must be non-zero");
    }

    const adjustment = await prisma.ledgerAdjustment.create({
      data: {
        userId: input.user_id,
        gramsDelta: grams.toFixed(4),
        amountPaise: input.amount_paise,
        reason: input.reason,
        requestedByAdminId: adminId,
        idempotencyKey,
      },
    });

    const { writeAuditLog } = await import("../../utils/audit");
    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "ledger_adjustment_requested",
      entityType: "ledger_adjustment",
      entityId: adjustment.id,
      after: {
        user_id: input.user_id,
        grams_delta: grams.toFixed(4),
      },
      reason: input.reason,
      requestId,
      ipAddress,
    });

    return {
      adjustment: {
        id: adjustment.id,
        status: adjustment.status,
        grams_delta: adjustment.gramsDelta.toString(),
        reason: adjustment.reason,
      },
    };
  }

  async approve(
    adjustmentId: string,
    approverAdminId: string,
    requestId?: string,
    ipAddress?: string,
  ) {
    const adjustment = await prisma.ledgerAdjustment.findUnique({
      where: { id: adjustmentId },
    });

    if (!adjustment) {
      throw new AppError(404, "NOT_FOUND", "Ledger adjustment does not exist");
    }

    if (adjustment.status !== "pending") {
      throw new AppError(409, "CONFLICT", "Ledger adjustment is not pending");
    }

    if (adjustment.requestedByAdminId === approverAdminId) {
      throw new AppError(
        403,
        "FORBIDDEN",
        "Approver must differ from requester",
      );
    }

    const grams = new Decimal(adjustment.gramsDelta.toString());
    const now = new Date();

    await prisma.$transaction(async (tx) => {
      await tx.ledgerAdjustment.update({
        where: { id: adjustmentId },
        data: {
          status: "posted",
          approvedByAdminId: approverAdminId,
          approvedAt: now,
        },
      });

      const entryType = grams.gt(0)
        ? "manual_adjustment_credit"
        : "manual_adjustment_debit";

      await tx.goldLedgerEntry.create({
        data: {
          userId: adjustment.userId,
          entryType,
          status: "posted",
          gramsDelta: grams.toFixed(4),
          amountPaise: adjustment.amountPaise,
          goldRatePerGramPaise: adjustment.amountPaise
            ? Math.round(
                Math.abs(adjustment.amountPaise) /
                  Math.abs(grams.toNumber() || 1),
              )
            : 0,
          sourceType: "manual_adjustment",
          sourceId: adjustment.id,
          correlationId: adjustment.id,
          idempotencyKey: `manual_adjustment:${adjustment.id}`,
          postedAt: now,
        },
      });
    });

    await goldBalanceService.refreshSnapshot(adjustment.userId, "adjustment");

    const { writeAuditLog } = await import("../../utils/audit");
    await writeAuditLog({
      actorType: "admin",
      actorId: approverAdminId,
      action: "ledger_adjustment_approved",
      entityType: "ledger_adjustment",
      entityId: adjustmentId,
      before: { status: "pending" },
      after: { status: "posted" },
      reason: adjustment.reason,
      requestId,
      ipAddress,
    });

    return { success: true, status: "posted" as const };
  }

  async list() {
    const adjustments = await prisma.ledgerAdjustment.findMany({
      orderBy: { createdAt: "desc" },
      take: 100,
    });

    return {
      adjustments: adjustments.map((row) => ({
        id: row.id,
        user_id: row.userId,
        grams_delta: row.gramsDelta.toString(),
        status: row.status,
        reason: row.reason,
        requested_by_admin_id: row.requestedByAdminId,
        approved_by_admin_id: row.approvedByAdminId,
        created_at: row.createdAt.toISOString(),
      })),
    };
  }
}

export const ledgerAdjustmentsService = new LedgerAdjustmentsService();

export class SarReviewsService {
  async decide(
    reviewId: string,
    adminId: string,
    input: { decision: "approved" | "rejected"; reason?: string },
    requestId?: string,
    ipAddress?: string,
  ) {
    const review = await prisma.sarReview.findUnique({
      where: { id: reviewId },
      include: { order: true },
    });

    if (!review) {
      throw new AppError(404, "NOT_FOUND", "SAR review does not exist");
    }

    if (review.status !== "pending") {
      throw new AppError(409, "CONFLICT", "SAR review is already decided");
    }

    const now = new Date();
    const status = input.decision === "approved" ? "approved" : "rejected";

    await prisma.sarReview.update({
      where: { id: reviewId },
      data: {
        status,
        decisionReason: input.reason,
        decidedByAdminId: adminId,
        decidedAt: now,
      },
    });

    const { writeAuditLog } = await import("../../utils/audit");
    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "sar_review_decided",
      entityType: "sar_review",
      entityId: reviewId,
      before: { status: "pending" },
      after: { status, order_id: review.orderId },
      reason: input.reason,
      requestId,
      ipAddress,
    });

    return { success: true, status };
  }
}

export const sarReviewsService = new SarReviewsService();
