import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { goldLedgerController } from "./gold_ledger.controller";

export const goldBalanceRouter = Router();

goldBalanceRouter.use(authenticate);

goldBalanceRouter.get("/", (req, res, next) => {
  void goldLedgerController.getBalance(req, res).catch(next);
});

goldBalanceRouter.get("/ledger", (req, res, next) => {
  void goldLedgerController.listLedger(req, res).catch(next);
});

goldBalanceRouter.get("/redeemable-products", (req, res, next) => {
  void goldLedgerController.listRedeemableProducts(req, res).catch(next);
});
