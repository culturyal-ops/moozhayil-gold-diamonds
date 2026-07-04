import { Router } from "express";
import { z } from "zod";
import { dbPurity, goldRatesService } from "./gold_rates.service";

export const goldRatesRouter = Router();

goldRatesRouter.get("/", (_req, res, next) => {
  void goldRatesService.currentRates().then((result) => res.json(result)).catch(next);
});

goldRatesRouter.get("/history", (req, res, next) => {
  const query = z
    .object({
      purity: z.enum(["14k", "18k", "22k", "24k"]).default("22k"),
      days: z.coerce.number().int().refine((value) => [30, 60, 90].includes(value)).default(90),
    })
    .parse(req.query);

  void goldRatesService
    .history({ purity: dbPurity(query.purity), days: query.days })
    .then((result) => res.json(result))
    .catch(next);
});
