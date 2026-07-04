import { z } from "zod";
import type { Request, Response } from "express";
import { AppError } from "../../middleware/error.middleware";
import { goldBalanceService } from "./gold_balance.service";
import { goldLedgerService } from "./gold_ledger.service";
import { prisma } from "../../db/prisma";
import {
  mapProductToDto,
  productInclude,
} from "../products/product.mapper";

const ledgerQuerySchema = z.object({
  cursor: z.string().uuid().optional(),
  limit: z.coerce.number().int().min(1).max(50).default(20),
  goal_id: z.string().uuid().optional(),
});

const redeemableQuerySchema = z.object({
  cursor: z.string().uuid().optional(),
  limit: z.coerce.number().int().min(1).max(50).default(20),
});

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export class GoldLedgerController {
  async getBalance(req: Request, res: Response): Promise<void> {
    res.status(200).json(await goldBalanceService.getBalance(requireUserId(req)));
  }

  async listLedger(req: Request, res: Response): Promise<void> {
    const query = ledgerQuerySchema.parse(req.query);
    res.status(200).json(
      await goldLedgerService.listEntries({
        userId: requireUserId(req),
        goalId: query.goal_id,
        cursor: query.cursor,
        limit: query.limit,
      }),
    );
  }

  async listRedeemableProducts(req: Request, res: Response): Promise<void> {
    const query = redeemableQuerySchema.parse(req.query);
    const userId = requireUserId(req);
    const balance = await goldBalanceService.getBalance(userId);

    const products = await prisma.product.findMany({
      where: { isPublished: true, deletedAt: null },
      include: productInclude(),
      orderBy: { createdAt: "desc" },
      cursor: query.cursor ? { id: query.cursor } : undefined,
      skip: query.cursor ? 1 : 0,
      take: query.limit * 3,
    });

    const priced = await Promise.all(
      products.map((product) => mapProductToDto(product)),
    );

    const affordable = priced.filter(
      (product) => product.price.total_paise <= balance.total_value_paise,
    );

    const data = affordable.slice(0, query.limit);
    const hasMore = affordable.length > query.limit;

    res.status(200).json({
      data,
      next_cursor: hasMore ? data[data.length - 1]?.id ?? null : null,
      has_more: hasMore,
    });
  }
}

export const goldLedgerController = new GoldLedgerController();
