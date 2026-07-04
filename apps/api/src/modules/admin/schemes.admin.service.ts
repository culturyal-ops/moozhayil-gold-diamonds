import { prisma } from "../../db/prisma";
import { DEFAULT_SCHEME_TYPE } from "../../config/schemes.constants";
import { AppError } from "../../middleware/error.middleware";
import { writeAuditLog } from "../../utils/audit";
import { contributionsService } from "../contributions/contributions.service";
import { goalsService } from "../goals/goals.service";
import type { CreateGoalInput } from "../goals/goals.schema";
import type { AdminShowroomPaymentInput } from "./admin.schema";

export class SchemesAdminService {
  async enrollCustomer(
    userId: string,
    adminId: string,
    input: CreateGoalInput,
    idempotencyKey: string,
    requestId?: string,
    ipAddress?: string,
  ) {
    const result = await goalsService.createForAdmin(
      userId,
      input,
      idempotencyKey,
    );

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "admin_scheme_enrolled",
      entityType: "goal",
      entityId: result.goal.id,
      after: {
        user_id: userId,
        scheme_type: input.scheme_type ?? DEFAULT_SCHEME_TYPE,
        name: input.name,
        monthly_amount_paise: input.monthly_amount_paise,
        duration_months: input.duration_months,
      },
      requestId,
      ipAddress,
    });

    return result;
  }

  async recordShowroomPayment(
    goalId: string,
    adminId: string,
    input: AdminShowroomPaymentInput,
    idempotencyKey: string,
    requestId?: string,
    ipAddress?: string,
  ) {
    const result = await contributionsService.recordAdminShowroomPayment({
      goalId,
      adminId,
      amountPaise: input.amount_paise,
      paymentChannel: input.payment_channel,
      referenceNumber: input.reference_number,
      remarks: input.remarks,
      idempotencyKey,
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "admin_scheme_payment_recorded",
      entityType: "contribution",
      entityId: result.contribution.id,
      after: {
        goal_id: goalId,
        amount_paise: input.amount_paise,
        payment_channel: input.payment_channel,
        reference_number: input.reference_number ?? null,
        remarks: input.remarks ?? null,
      },
      requestId,
      ipAddress,
    });

    return result;
  }

  async listGoalContributions(goalId: string) {
    return contributionsService.listForGoal(goalId);
  }

  async getGoal(goalId: string) {
    const goal = await prisma.goal.findFirst({
      where: { id: goalId, deletedAt: null },
      include: {
        user: {
          select: {
            id: true,
            name: true,
            phone: true,
            kycStatus: true,
          },
        },
      },
    });

    if (!goal) {
      throw new AppError(404, "NOT_FOUND", "Goal does not exist");
    }

    return {
      goal: {
        id: goal.id,
        name: goal.name,
        scheme_type: goal.schemeType,
        status: goal.status,
        monthly_amount_paise: goal.monthlyAmountPaise,
        next_contribution_date: goal.nextContributionDate.toISOString().slice(0, 10),
        user: {
          id: goal.user.id,
          name: goal.user.name,
          phone: goal.user.phone,
          kyc_status: goal.user.kycStatus,
        },
      },
    };
  }
}

export const schemesAdminService = new SchemesAdminService();
