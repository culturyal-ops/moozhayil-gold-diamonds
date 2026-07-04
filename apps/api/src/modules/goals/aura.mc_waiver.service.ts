import Decimal from "decimal.js";
import type { Goal } from "@prisma/client";
import { prisma } from "../../db/prisma";
import { AURA_MC_WAIVER_MAX_PCT } from "../../config/aura.constants";
import {
  computeMcWaiverEligible,
  countCompletedAuraInstallments,
  isAuraScheme,
  isWithinAuraRedemptionWindow,
} from "./aura.service";
import { formatPaise } from "../../utils/money";
import {
  calculateProductPrice,
  type ProductPriceDto,
  type ProductPriceInput,
} from "../products/price";

export interface AuraMcWaiverBreakdown {
  waived_making_paise: number;
  payable_making_paise: number;
  waiver_pct_of_gold: number;
}

function toPaise(value: Decimal): number {
  return value.toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toNumber();
}

/** Waive making charges up to [maxPct]% of gold value — showroom Aura rule. */
export function calculateAuraMcWaiver(input: {
  goldValuePaise: number;
  makingChargePct: Decimal.Value;
  makingChargePaise: number;
  maxWaiverPct?: number;
}): AuraMcWaiverBreakdown {
  const capPct = new Decimal(input.maxWaiverPct ?? AURA_MC_WAIVER_MAX_PCT);
  const makingPct = new Decimal(input.makingChargePct);
  const waiverPctOfGold = Decimal.min(makingPct, capPct);
  const waivedMakingPaise = toPaise(
    new Decimal(input.goldValuePaise).mul(waiverPctOfGold).div(100),
  );
  const payableMakingPaise = Math.max(
    input.makingChargePaise - waivedMakingPaise,
    0,
  );

  return {
    waived_making_paise: waivedMakingPaise,
    payable_making_paise: payableMakingPaise,
    waiver_pct_of_gold: waiverPctOfGold.toNumber(),
  };
}

export type AuraProductPriceDto = ProductPriceDto & {
  mc_waiver_paise: number;
  mc_waiver_display: string;
  mc_waiver_applied: boolean;
};

export function calculateProductPriceWithAuraMcWaiver(
  input: ProductPriceInput,
): AuraProductPriceDto {
  const base = calculateProductPrice(input);
  const waiver = calculateAuraMcWaiver({
    goldValuePaise: base.gold_value_paise,
    makingChargePct: input.makingChargePct,
    makingChargePaise: base.making_charge_paise,
  });

  if (waiver.waived_making_paise <= 0) {
    return {
      ...base,
      mc_waiver_paise: 0,
      mc_waiver_display: "₹0",
      mc_waiver_applied: false,
    };
  }

  const goldValuePaise = base.gold_value_paise;
  const wastagePaise = base.wastage_paise;
  const stoneValuePaise = input.stoneValuePaise;
  const basePricePaise =
    goldValuePaise +
    waiver.payable_making_paise +
    wastagePaise +
    stoneValuePaise;
  const gstPaise = toPaise(
    new Decimal(basePricePaise).mul(input.gstPct).div(100),
  );
  const totalPaise = basePricePaise + gstPaise;

  return {
    ...base,
    making_charge_paise: waiver.payable_making_paise,
    making_charge_display: formatPaise(waiver.payable_making_paise),
    gst_paise: gstPaise,
    gst_display: formatPaise(gstPaise),
    total_paise: totalPaise,
    total_display: formatPaise(totalPaise),
    mc_waiver_paise: waiver.waived_making_paise,
    mc_waiver_display: formatPaise(waiver.waived_making_paise),
    mc_waiver_applied: true,
  };
}

export async function isAuraMcWaiverActive(
  goal: Goal,
  today = new Date(),
): Promise<boolean> {
  if (!isAuraScheme(goal.schemeType)) {
    return false;
  }

  const completedInstallments = await countCompletedAuraInstallments(goal.id);

  return (
    computeMcWaiverEligible(goal, completedInstallments) &&
    isWithinAuraRedemptionWindow(goal.startDate, today)
  );
}

export async function findActiveAuraMcWaiverGoal(
  userId: string,
  today = new Date(),
): Promise<Goal | null> {
  const goals = await prisma.goal.findMany({
    where: {
      userId,
      schemeType: "aura",
      status: "completed",
      deletedAt: null,
    },
    orderBy: { completedAt: "desc" },
  });

  for (const goal of goals) {
    if (await isAuraMcWaiverActive(goal, today)) {
      return goal;
    }
  }

  return null;
}
