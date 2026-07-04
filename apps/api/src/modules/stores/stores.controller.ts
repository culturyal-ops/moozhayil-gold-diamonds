import type { Request, Response } from "express";
import { z } from "zod";
import { listStoresQuerySchema } from "./stores.schema";
import { storesService } from "./stores.service";

export class StoresController {
  async list(req: Request, res: Response): Promise<void> {
    const query = listStoresQuerySchema.parse(req.query);
    res.status(200).json(await storesService.list(query));
  }

  async getById(req: Request, res: Response): Promise<void> {
    const storeId = z.string().uuid().parse(req.params.id);
    res.status(200).json(await storesService.getById(storeId));
  }
}

export const storesController = new StoresController();
