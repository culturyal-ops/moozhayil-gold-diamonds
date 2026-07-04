import { Prisma } from "@prisma/client";

import { loadEnv } from "../../config/env";

import { prisma } from "../../db/prisma";

import { daysBetween } from "../../utils/dates";

import { contributionsService } from "../../modules/contributions/contributions.service";

import {

  discontinueAuraGoal,

  isAuraScheme,

  shouldDiscontinueAuraGoal,

  shouldMarkAuraContributionDue,

} from "../../modules/goals/aura.service";

import { CONTRIBUTION_DUE_AFTER_DAYS, GOAL_PAUSED_AFTER_DAYS } from "../../config/goals.constants";



export async function processDueAutopayContributions(): Promise<number> {

  const env = loadEnv();

  const today = new Date();

  const dueGoals = await prisma.goal.findMany({

    where: {

      status: { in: ["active", "contribution_due"] },

      deletedAt: null,

      nextContributionDate: { lte: today },

    },

  });



  let processed = 0;



  for (const goal of dueGoals) {

    try {

      const scheduled = await contributionsService.createScheduledContribution(

        goal,

        goal.nextContributionDate,

      );



      if (env.PAYMENT_PROVIDER_MODE === "mock") {

        await contributionsService.completeContribution({

          contributionId: scheduled.id,

        });

      } else {

        await contributionsService.initiateContributionPayment(scheduled.id);

      }



      processed += 1;

    } catch (err) {

      // Unique constraint violation means a concurrent worker already created

      // this contribution — treat as a no-op rather than crashing.

      if (

        err instanceof Prisma.PrismaClientKnownRequestError &&

        err.code === "P2002"

      ) {

        continue;

      }

      throw err;

    }

  }



  return processed;

}



export async function processContributionDueStatuses(): Promise<number> {

  const goals = await prisma.goal.findMany({

    where: {

      status: { in: ["active", "contribution_due"] },

      deletedAt: null,

    },

  });



  const today = new Date();

  let updated = 0;



  for (const goal of goals) {

    if (isAuraScheme(goal.schemeType)) {

      if (shouldDiscontinueAuraGoal(goal.nextContributionDate, today)) {

        if (await discontinueAuraGoal(goal.id)) {

          updated += 1;

        }

        continue;

      }



      if (

        shouldMarkAuraContributionDue(goal.nextContributionDate, today) &&

        goal.status === "active"

      ) {

        await prisma.goal.update({

          where: { id: goal.id },

          data: { status: "contribution_due" },

        });

        updated += 1;

      }



      continue;

    }



    const overdueDays = daysBetween(goal.nextContributionDate, today);



    if (overdueDays >= GOAL_PAUSED_AFTER_DAYS && goal.status !== "paused") {

      await prisma.goal.update({

        where: { id: goal.id },

        data: {

          status: "paused",

          pausedAt: today,

          bonusEligible: false,

        },

      });

      updated += 1;

      continue;

    }



    if (

      overdueDays >= CONTRIBUTION_DUE_AFTER_DAYS &&

      goal.status === "active"

    ) {

      await prisma.goal.update({

        where: { id: goal.id },

        data: { status: "contribution_due" },

      });

      updated += 1;

    }

  }



  return updated;

}

