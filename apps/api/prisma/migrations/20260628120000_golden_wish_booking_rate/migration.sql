-- Dhanam rate protection: store gold rate at booking time on the goal.
ALTER TABLE "goals" ADD COLUMN "booking_rate_paise_per_gram" INTEGER;
