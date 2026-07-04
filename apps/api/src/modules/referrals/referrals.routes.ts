import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { referralsController } from "./referrals.controller";

export const referralsRouter = Router();

referralsRouter.use(authenticate);

referralsRouter.get("/my-code", (req, res, next) => {
  void referralsController.myCode(req, res).catch(next);
});

referralsRouter.get("/history", (req, res, next) => {
  void referralsController.history(req, res).catch(next);
});

referralsRouter.post("/apply", (req, res, next) => {
  void referralsController.apply(req, res).catch(next);
});
