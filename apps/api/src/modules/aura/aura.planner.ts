import type { AuraContext } from "./aura.context";
import { gramsRemaining } from "./aura.safety";
import { formatPaise } from "../../utils/money";

export function buildInsight(context: AuraContext) {
  const primaryGoal = context.activeGoals[0];
  if (!primaryGoal) {
    return {
      insight_text:
        "Start a Gold Goal to turn everyday saving into something you can wear.",
      insight_type: "onboarding",
      link_route: "/aura/goal-planning",
      data: {
        total_gold_grams: context.totalGoldGrams,
        rate_change_pct: context.rateChangePct,
      },
    };
  }

  const remaining = gramsRemaining(
    primaryGoal.currentGrams,
    primaryGoal.targetGrams,
  );

  const ratePhrase =
    context.rateChangePct === 0
      ? "Gold is steady today."
      : context.rateChangePct < 0
        ? `Gold eased ${Math.abs(context.rateChangePct)}% today.`
        : `Gold rose ${context.rateChangePct}% today.`;

  const insightText =
    remaining && remaining !== "0.0000"
      ? `You're ${remaining}g away from your ${primaryGoal.name} goal. ${ratePhrase}`
      : `Your ${primaryGoal.name} goal is nearly complete. ${ratePhrase}`;

  return {
    insight_text: insightText,
    insight_type: "goal",
    link_route: "/aura/goal-planning",
    data: {
      goal_name: primaryGoal.name,
      grams_remaining: remaining,
      rate_change_pct: context.rateChangePct,
    },
  };
}

export function buildPlan(context: AuraContext, input: {
  occasion: string;
  targetDate: string;
  budgetPaise: number;
}) {
  const months = Math.max(
    3,
    Math.ceil(
      (new Date(input.targetDate).getTime() - Date.now()) /
        (30 * 24 * 60 * 60 * 1000),
    ),
  );
  const monthlyPaise = Math.ceil(input.budgetPaise / months);

  return {
    plan: {
      occasion: input.occasion,
      target_date: input.targetDate,
      budget_display: formatPaise(input.budgetPaise),
      suggested_monthly_display: formatPaise(monthlyPaise),
      duration_months: months,
      rationale: `Based on your ${input.occasion} timeline and budget, saving ${formatPaise(monthlyPaise)} monthly keeps you on track without rushing.`,
    },
    recommended_products: [],
    context_summary: {
      intent_tags: context.intentTags,
      existing_goals: context.activeGoals.length,
    },
  };
}

export function buildDiscoveryIntro(context: AuraContext, input: {
  forPerson: string;
  occasion: string;
}) {
  return `For ${input.forPerson}'s ${input.occasion}, I looked at pieces that match your taste and current gold savings of ${context.totalGoldGrams}g.`;
}

export function buildChatResponse(context: AuraContext, message: string) {
  const lower = message.toLowerCase();

  if (lower.includes("goal") || lower.includes("save")) {
    return {
      text: "A monthly Gold Goal keeps saving gentle and purposeful. I can help you choose an amount that fits your timeline.",
      products: [] as string[],
      action: {
        type: "suggest_goal",
        cta_label: "Start saving for this",
        route: "/goals/create",
      },
    };
  }

  if (lower.includes("gold") || lower.includes("rate")) {
    return {
      text: `22K gold is at ${context.goldRateDisplay}. Your saved gold is ${context.totalGoldGrams}g.`,
      products: [] as string[],
      action: {
        type: "open_insights",
        cta_label: "View gold insights",
        route: "/aura/gold-insights",
      },
    };
  }

  return {
    text: "I can help you plan a Gold Goal, discover jewellery within budget, or review your gold progress.",
    products: [] as string[],
    action: null,
  };
}
