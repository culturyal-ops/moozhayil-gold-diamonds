import type { Request, Response } from "express";
import { z } from "zod";
import {
  productListSchema,
  searchSchema,
  similarSchema,
} from "./products.schema";
import { productsService } from "./products.service";

export class ProductsController {
  async list(req: Request, res: Response): Promise<void> {
    const input = productListSchema.parse(req.query);
    res.status(200).json(await productsService.list(input));
  }

  async detail(req: Request, res: Response): Promise<void> {
    const productId = z.string().uuid().parse(req.params.id);
    res.status(200).json(await productsService.detail(productId));
  }

  async similar(req: Request, res: Response): Promise<void> {
    const productId = z.string().uuid().parse(req.params.id);
    const input = similarSchema.parse(req.query);
    res.status(200).json(await productsService.similar(productId, input));
  }

  async search(req: Request, res: Response): Promise<void> {
    const input = searchSchema.parse(req.query);
    res.status(200).json(await productsService.search(input));
  }
}

export const productsController = new ProductsController();
