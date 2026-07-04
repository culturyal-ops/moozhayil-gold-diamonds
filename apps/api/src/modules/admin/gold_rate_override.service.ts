import type { Purity } from "@prisma/client";
import { prisma } from "../../db/prisma";
import { writeAuditLog } from "../../utils/audit";
import { deleteCache } from "../../utils/cache";
import { apiPurity, dbPurity } from "../gold_rates/gold_rates.service";
import type { GoldRateOverrideInput } from "./admin.schema";

export class GoldRateOverrideService {
  async override(
    adminId: string,
    input: GoldRateOverrideInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const purity = dbPurity(input.purity) as Purity;
    const now = new Date();

    const current = await prisma.goldRateHistory.findFirst({
      where: { purity, effectiveTo: null },
      orderBy: { effectiveFrom: "desc" },
    });

    const rate = await prisma.$transaction(async (tx) => {
      if (current) {
        await tx.goldRateHistory.update({
          where: { id: current.id },
          data: { effectiveTo: now },
        });
      }

      return tx.goldRateHistory.create({
        data: {
          purity,
          ratePerGramPaise: input.rate_per_gram_paise,
          effectiveFrom: now,
          source: "admin_override",
          createdByAdminId: adminId,
        },
      });
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "gold_rate_override",
      entityType: "gold_rate",
      entityId: rate.id,
      before: current
        ? {
            purity: apiPurity(current.purity),
            rate_per_gram_paise: current.ratePerGramPaise,
          }
        : undefined,
      after: {
        purity: apiPurity(rate.purity),
        rate_per_gram_paise: rate.ratePerGramPaise,
      },
      reason: input.reason,
      requestId,
      ipAddress,
    });

    await deleteCache("gold-rates:current");

    return {
      rate: {
        purity: apiPurity(rate.purity),
        rate_per_gram_paise: rate.ratePerGramPaise,
        effective_from: rate.effectiveFrom.toISOString(),
        source: rate.source,
      },
    };
  }

  async listHistory(purity?: string) {
    const rates = await prisma.goldRateHistory.findMany({
      where: purity ? { purity: dbPurity(purity) as Purity } : undefined,
      orderBy: { effectiveFrom: "desc" },
      take: 50,
    });

    return {
      history: rates.map((rate) => ({
        id: rate.id,
        purity: apiPurity(rate.purity),
        rate_per_gram_paise: rate.ratePerGramPaise,
        effective_from: rate.effectiveFrom.toISOString(),
        effective_to: rate.effectiveTo?.toISOString() ?? null,
        source: rate.source,
        created_by_admin_id: rate.createdByAdminId,
      })),
    };
  }

  async applyWebhookRate(input: {
    purity: string;
    ratePerGramPaise: number;
    source: string;
    corrected?: boolean;
  }) {
    const purity = dbPurity(input.purity) as Purity;
    const now = new Date();

    const current = await prisma.goldRateHistory.findFirst({
      where: { purity, effectiveTo: null },
      orderBy: { effectiveFrom: "desc" },
    });

    if (
      current &&
      current.ratePerGramPaise === input.ratePerGramPaise &&
      !input.corrected
    ) {
      return { updated: false };
    }

    await prisma.$transaction(async (tx) => {
      if (current) {
        await tx.goldRateHistory.update({
          where: { id: current.id },
          data: { effectiveTo: now },
        });
      }

      await tx.goldRateHistory.create({
        data: {
          purity,
          ratePerGramPaise: input.ratePerGramPaise,
          effectiveFrom: now,
          source: input.source,
        },
      });
    });

    await deleteCache("gold-rates:current");
    return { updated: true };
  }
}

export const goldRateOverrideService = new GoldRateOverrideService();
