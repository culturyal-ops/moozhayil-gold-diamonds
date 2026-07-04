import type { Prisma } from "@prisma/client";
import { prisma } from "../../db/prisma";
import { getJsonCache, setJsonCache } from "../../utils/cache";
import { AppError } from "../../middleware/error.middleware";
import { rateLimit } from "../../middleware/rate_limit.middleware";
import type { RequestHandler } from "express";
import { buildAuraContext, redactAuraContext } from "./aura.context";
import {
  buildChatResponse,
  buildDiscoveryIntro,
  buildInsight,
  buildPlan,
} from "./aura.planner";
import {
  filterRecommendations,
  sanitizeAuraMessage,
} from "./aura.safety";
import type {
  AuraDiscoverInput,
  AuraMessageInput,
  AuraPlanInput,
  CreateAuraSessionInput,
} from "./aura.schema";
import { processAuraInsight } from "../../jobs/processors/aura_insight.processor";

const AURA_SESSION_TTL_HOURS = 24;
const INSIGHT_CACHE_TTL_SECONDS = 3600;

export const auraChatRateLimit: RequestHandler = rateLimit({
  windowMs: 60 * 60 * 1000,
  max: 30,
  keyGenerator: (req) => `aura:chat:${req.user?.userId ?? req.ip ?? "anon"}`,
});

export class AuraService {
  async insight(userId: string) {
    const cacheKey = `aura:insight:${userId}`;
    const cached = await getJsonCache<ReturnType<typeof buildInsight>>(cacheKey);
    if (cached) {
      return cached;
    }

    const insight = await processAuraInsight(userId);
    await setJsonCache(cacheKey, insight, INSIGHT_CACHE_TTL_SECONDS);
    return insight;
  }

  async plan(userId: string, input: AuraPlanInput) {
    const context = await buildAuraContext(userId);
    const plan = buildPlan(context, {
      occasion: input.occasion,
      targetDate: input.target_date,
      budgetPaise: input.budget_paise,
    });

    const productIds = [
      ...context.vaultProductIds,
      ...context.recentProductIds,
    ].slice(0, 6);

    const recommended = await filterRecommendations({
      productIds,
      budgetPaise: input.budget_paise,
    });

    return {
      ...plan,
      recommended_products: recommended,
    };
  }

  async discover(userId: string, input: AuraDiscoverInput) {
    const context = await buildAuraContext(userId);

    const candidates = await prisma.product.findMany({
      where: {
        isPublished: true,
        deletedAt: null,
        stockQuantity: { gt: 0 },
      },
      orderBy: [{ isFeatured: "desc" }, { sortOrder: "asc" }],
      take: 12,
      select: { id: true },
    });

    const products = await filterRecommendations({
      productIds: candidates.map((product) => product.id),
      budgetPaise: input.budget_paise,
    });

    return {
      intro: buildDiscoveryIntro(context, {
        forPerson: input.for_person,
        occasion: input.occasion,
      }),
      products,
      filters_applied: {
        in_stock_only: true,
        budget_paise: input.budget_paise,
        budget_ceiling_paise: Math.floor(input.budget_paise * 1.2),
      },
    };
  }

  async createSession(userId: string, input: CreateAuraSessionInput) {
    const expiresAt = new Date();
    expiresAt.setHours(expiresAt.getHours() + AURA_SESSION_TTL_HOURS);

    const session = await prisma.auraSession.create({
      data: {
        userId,
        flowType: input.flow_type,
        startedAt: new Date(),
        expiresAt,
      },
    });

    return { session_id: session.id };
  }

  async postMessage(
    userId: string,
    sessionId: string,
    input: AuraMessageInput,
  ) {
    const session = await prisma.auraSession.findFirst({
      where: { id: sessionId, userId },
    });

    if (!session) {
      throw new AppError(404, "NOT_FOUND", "Aura session does not exist");
    }

    if (session.expiresAt.getTime() < Date.now()) {
      throw new AppError(422, "UNPROCESSABLE", "Aura session has expired");
    }

    if (session.flowType !== "chat") {
      throw new AppError(
        422,
        "UNPROCESSABLE",
        "Free-form chat is only available in chat sessions",
      );
    }

    const sanitizedUserMessage = sanitizeAuraMessage(input.message);
    const lastSequence = await prisma.auraMessage.findFirst({
      where: { sessionId },
      orderBy: { sequence: "desc" },
      select: { sequence: true },
    });
    const nextSequence = (lastSequence?.sequence ?? 0) + 1;

    await prisma.auraMessage.create({
      data: {
        sessionId,
        role: "user",
        content: sanitizedUserMessage,
        sequence: nextSequence,
      },
    });

    const context = await buildAuraContext(userId);
    const draft = buildChatResponse(context, sanitizedUserMessage);
    const productIds = draft.products.length
      ? draft.products
      : [...context.vaultProductIds, ...context.recentProductIds].slice(0, 3);

    const products = await filterRecommendations({ productIds });
    const responseText = sanitizeAuraMessage(draft.text);

    await prisma.auraMessage.create({
      data: {
        sessionId,
        role: "aura",
        content: responseText,
        metadata: draft.action
          ? (draft.action as Prisma.InputJsonValue)
          : undefined,
        sequence: nextSequence + 1,
      },
    });

    return {
      response: {
        text: responseText,
        products,
        action: draft.action,
      },
      session_id: sessionId,
      context_redacted: redactAuraContext(context),
    };
  }

  async recordProductView(userId: string, productId: string, source?: string) {
    await prisma.productView.create({
      data: {
        userId,
        productId,
        source: source ?? "product_detail",
        viewedAt: new Date(),
      },
    });
  }
}

export const auraService = new AuraService();
