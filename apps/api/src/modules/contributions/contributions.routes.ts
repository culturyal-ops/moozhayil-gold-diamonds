import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { contributionsController } from "./contributions.controller";

export const contributionsRouter = Router();

contributionsRouter.use(authenticate);

contributionsRouter.get("/pending", (req, res, next) => {
  void contributionsController.listPending(req, res).catch(next);
});
