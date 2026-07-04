import type { Request, Response } from "express";
import { z } from "zod";
import { AppError } from "../../middleware/error.middleware";
import type { KycStatus } from "@prisma/client";
import {
  cancelOrderSchema,
  createOrderSchema,
  listOrdersQuerySchema,
} from "./orders.schema";
import { ordersService } from "./orders.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

function requireKycStatus(req: Request): KycStatus {
  return req.user?.kycStatus as KycStatus;
}

function requireIdempotencyKey(req: Request): string {
  const key = req.header("idempotency-key");
  if (!key?.trim()) {
    throw new AppError(400, "BAD_REQUEST", "Idempotency-Key header is required");
  }

  return key.trim();
}

export class OrdersController {
  async list(req: Request, res: Response): Promise<void> {
    const query = listOrdersQuerySchema.parse(req.query);
    res.status(200).json(await ordersService.list(requireUserId(req), query));
  }

  async getById(req: Request, res: Response): Promise<void> {
    const orderId = z.string().uuid().parse(req.params.id);
    res.status(200).json(await ordersService.getById(requireUserId(req), orderId));
  }

  async create(req: Request, res: Response): Promise<void> {
    const input = createOrderSchema.parse(req.body);
    res.status(201).json(
      await ordersService.create(
        requireUserId(req),
        requireKycStatus(req),
        input,
        requireIdempotencyKey(req),
      ),
    );
  }

  async cancel(req: Request, res: Response): Promise<void> {
    const orderId = z.string().uuid().parse(req.params.id);
    const input = cancelOrderSchema.parse(req.body);
    res.status(200).json(
      await ordersService.cancel(requireUserId(req), orderId, input.reason),
    );
  }
}

export const ordersController = new OrdersController();
