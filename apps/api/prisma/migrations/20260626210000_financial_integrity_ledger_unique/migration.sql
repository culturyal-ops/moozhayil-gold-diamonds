-- Enforce at most one posted credit ledger row per contribution source.
CREATE UNIQUE INDEX "gold_ledger_entries_one_posted_credit_per_source"
ON "gold_ledger_entries" ("entry_type", "source_type", "source_id")
WHERE "status" = 'posted'
  AND "entry_type" IN ('contribution_credit', 'bonus_credit');
