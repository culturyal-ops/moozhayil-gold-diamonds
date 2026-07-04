-- AddUniqueConstraint: prevent duplicate autopay/manual contributions for the same goal and month
-- This closes the race condition in the autopay processor (C-04).
ALTER TABLE "contributions"
  ADD CONSTRAINT "contributions_goal_id_contribution_month_type_key"
  UNIQUE ("goal_id", "contribution_month", "type");
