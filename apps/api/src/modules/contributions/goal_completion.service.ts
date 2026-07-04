import Decimal from "decimal.js";

import { prisma } from "../../db/prisma";

import { goldLedgerService } from "../gold_ledger/gold_ledger.service";

import { goldRatesService } from "../gold_rates/gold_rates.service";

import { GOAL_ACCUMULATION_PURITY } from "../../config/goals.constants";

import { calculateGramsFromPaise } from "../../utils/gold";

import { notifyGoalCompleted } from "../notifications/notifications.triggers";

import {

  evaluateAuraCompletion,

  isAuraScheme,

} from "../goals/aura.service";



export async function evaluateGoalCompletion(goalId: string): Promise<void> {

  const goal = await prisma.goal.findUnique({

    where: { id: goalId },

  });



  if (

    !goal ||

    goal.status === "completed" ||

    goal.status === "cancelled" ||

    goal.status === "discontinued"

  ) {

    return;

  }



  if (isAuraScheme(goal.schemeType)) {

    await evaluateAuraCompletion(goalId);

    return;

  }



  const creditedGrams = await goldLedgerService.getGoalCreditedGrams(goalId);

  let shouldComplete = false;



  if (goal.targetGrams) {

    shouldComplete = creditedGrams.gte(new Decimal(goal.targetGrams.toString()));

  } else if (goal.targetAmountPaise) {

    const rate = await goldRatesService.currentRateForPurity(GOAL_ACCUMULATION_PURITY);

    const targetGrams = calculateGramsFromPaise(

      goal.targetAmountPaise,

      rate.ratePerGramPaise,

    );

    shouldComplete = creditedGrams.gte(targetGrams);

  }



  if (!shouldComplete) {

    return;

  }



  const now = new Date();



  await prisma.goal.update({

    where: { id: goalId },

    data: {

      status: "completed",

      completedAt: now,

    },

  });



  await notifyGoalCompleted({

    userId: goal.userId,

    goalId: goal.id,

    goalName: goal.name,

  });



  if (goal.bonusEligible) {

    await creditGoalBonus(goal.id, goal.userId, goal.monthlyAmountPaise);

  }

}



async function creditGoalBonus(

  goalId: string,

  userId: string,

  bonusAmountPaise: number,

): Promise<void> {

  const existingBonus = await prisma.contribution.findFirst({

    where: {

      goalId,

      type: "bonus",

      status: "completed",

    },

  });



  if (existingBonus) {

    return;

  }



  const rate = await goldRatesService.currentRateForPurity(GOAL_ACCUMULATION_PURITY);

  const now = new Date();

  const gramsCredited = calculateGramsFromPaise(

    bonusAmountPaise,

    rate.ratePerGramPaise,

  );



  await prisma.$transaction(async (tx) => {

    const bonusContribution = await tx.contribution.create({

      data: {

        goalId,

        userId,

        amountPaise: bonusAmountPaise,

        goldRatePerGramPaise: rate.ratePerGramPaise,

        gramsCredited: gramsCredited.toFixed(4),

        contributionMonth: now,

        type: "bonus",

        status: "completed",

        completedAt: now,

      },

    });



    await goldLedgerService.postBonusCredit({

      userId,

      contributionId: bonusContribution.id,

      amountPaise: bonusAmountPaise,

      goldRatePerGramPaise: rate.ratePerGramPaise,

      tx,

    });

  });

}

