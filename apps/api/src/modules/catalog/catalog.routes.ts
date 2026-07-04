import { Router } from "express";
import { z } from "zod";
import { catalogService } from "./catalog.service";

export const catalogRouter = Router();

catalogRouter.get("/categories", (_req, res, next) => {
  void catalogService.categories().then((result) => res.json(result)).catch(next);
});

catalogRouter.get("/collections", (req, res, next) => {
  const query = z
    .object({ featured_only: z.coerce.boolean().optional() })
    .parse(req.query);

  void catalogService
    .collections({ featuredOnly: query.featured_only })
    .then((result) => res.json(result))
    .catch(next);
});

catalogRouter.get("/occasions", (_req, res, next) => {
  void catalogService.occasions().then((result) => res.json(result)).catch(next);
});
