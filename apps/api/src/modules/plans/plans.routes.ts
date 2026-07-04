import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { plansController } from "./plans.controller";

export const plansRouter = Router();

plansRouter.get("/catalog", (req, res) => {
  plansController.catalog(req, res);
});

plansRouter.use(authenticate);

plansRouter.get("/interest", (req, res, next) => {
  void plansController.myInterests(req, res).catch(next);
});

plansRouter.post("/interest", (req, res, next) => {
  void plansController.registerInterest(req, res).catch(next);
});
