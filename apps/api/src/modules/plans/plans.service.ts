import type { SchemeType } from "@prisma/client";
import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import {
  DEFAULT_SCHEME_TYPE,
  SCHEME_DISPLAY_NAMES,
  APP_ENROLLMENT_SCHEMES,
  type SchemeTypeValue,
} from "../../config/schemes.constants";

export class PlansService {
  async registerInterest(userId: string, schemeType: SchemeTypeValue) {
    if (APP_ENROLLMENT_SCHEMES.includes(schemeType)) {
      throw new AppError(
        422,
        "UNPROCESSABLE",
        `${SCHEME_DISPLAY_NAMES[schemeType]} enrollment is available in the app`,
      );
    }

    const existing = await prisma.planInterest.findUnique({
      where: {
        userId_schemeType: {
          userId,
          schemeType: schemeType as SchemeType,
        },
      },
    });

    if (existing) {
      return {
        id: existing.id,
        scheme_type: existing.schemeType,
        scheme_display: SCHEME_DISPLAY_NAMES[schemeType],
        registered_at: existing.createdAt.toISOString(),
        already_registered: true,
      };
    }

    const interest = await prisma.planInterest.create({
      data: {
        userId,
        schemeType: schemeType as SchemeType,
      },
    });

    return {
      id: interest.id,
      scheme_type: interest.schemeType,
      scheme_display: SCHEME_DISPLAY_NAMES[schemeType],
      registered_at: interest.createdAt.toISOString(),
      already_registered: false,
    };
  }

  async listMyInterests(userId: string) {
    const rows = await prisma.planInterest.findMany({
      where: { userId },
      orderBy: { createdAt: "desc" },
    });

    return {
      interests: rows.map((row) => ({
        id: row.id,
        scheme_type: row.schemeType,
        scheme_display: SCHEME_DISPLAY_NAMES[row.schemeType],
        registered_at: row.createdAt.toISOString(),
      })),
    };
  }

  async listInterestsAdmin(params: {
    schemeType?: SchemeTypeValue;
    limit: number;
    cursor?: string;
  }) {
    const rows = await prisma.planInterest.findMany({
      where: params.schemeType
        ? { schemeType: params.schemeType as SchemeType }
        : undefined,
      take: params.limit + 1,
      ...(params.cursor
        ? {
            cursor: { id: params.cursor },
            skip: 1,
          }
        : {}),
      orderBy: { createdAt: "desc" },
      include: {
        user: {
          select: {
            id: true,
            name: true,
            phone: true,
            city: true,
            kycStatus: true,
          },
        },
      },
    });

    const hasMore = rows.length > params.limit;
    const data = hasMore ? rows.slice(0, params.limit) : rows;

    return {
      data: data.map((row) => ({
        id: row.id,
        scheme_type: row.schemeType,
        scheme_display: SCHEME_DISPLAY_NAMES[row.schemeType],
        registered_at: row.createdAt.toISOString(),
        user: {
          id: row.user.id,
          name: row.user.name,
          phone: row.user.phone,
          city: row.user.city,
          kyc_status: row.user.kycStatus,
        },
      })),
      has_more: hasMore,
      next_cursor: hasMore ? data[data.length - 1]?.id : null,
    };
  }

  catalog() {
    return {
      default_scheme_type: DEFAULT_SCHEME_TYPE,
      plans: (["aura", "crest", "dhanam", "gold_nidhi"] as const).map(
        (schemeType) => ({
          scheme_type: schemeType,
          display_name: SCHEME_DISPLAY_NAMES[schemeType],
          app_enrollment_available: APP_ENROLLMENT_SCHEMES.includes(schemeType),
        }),
      ),
    };
  }
}

export const plansService = new PlansService();
