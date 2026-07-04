import type { Request, Response } from "express";
import { z } from "zod";
import { AppError } from "../../middleware/error.middleware";
import { addCartItemSchema } from "./cart.schema";
import { cartService } from "./cart.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export class CartController {
  async getCart(req: Request, res: Response): Promise<void> {
    res.status(200).json(await cartService.getCart(requireUserId(req)));
  }

  async addItem(req: Request, res: Response): Promise<void> {
    const input = addCartItemSchema.parse(req.body);
    res
      .status(201)
      .json(await cartService.addItem(requireUserId(req), input.product_id, input.quantity));
  }

  async removeItem(req: Request, res: Response): Promise<void> {
    const productId = z.string().uuid().parse(req.params.productId);
    res.status(200).json(await cartService.removeItem(requireUserId(req), productId));
  }

  async clear(req: Request, res: Response): Promise<void> {
    res.status(200).json(await cartService.clear(requireUserId(req)));
  }
}

export const cartController = new CartController();
