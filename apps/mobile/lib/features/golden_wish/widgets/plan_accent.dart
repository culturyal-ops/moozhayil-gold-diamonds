import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

import '../models/golden_wish_plan.dart';

class PlanAccent {
  const PlanAccent({
    required this.accent,

    required this.background,

    required this.borderColor,

    required this.titleColor,

    required this.bodyColor,

    required this.ctaBackground,

    required this.ctaForeground,

    required this.monogram,
  });

  final Color accent;

  final Color background;

  final Color borderColor;

  final Color titleColor;

  final Color bodyColor;

  final Color ctaBackground;

  final Color ctaForeground;

  final String monogram;

  static PlanAccent forPlan(GoldenWishPlanId id) => switch (id) {
    GoldenWishPlanId.aura => const PlanAccent(
      accent: AppColors.brandBurgundy,

      background: AppColors.bgWhite,

      borderColor: AppColors.borderGold,

      titleColor: AppColors.textPrimary,

      bodyColor: AppColors.textSecondary,

      ctaBackground: AppColors.brandBurgundy,

      ctaForeground: AppColors.cream,

      monogram: 'A',
    ),

    GoldenWishPlanId.crest => const PlanAccent(
      accent: AppColors.gold,

      background: AppColors.bgWhite,

      borderColor: AppColors.border,

      titleColor: AppColors.textPrimary,

      bodyColor: AppColors.textSecondary,

      ctaBackground: AppColors.ink,

      ctaForeground: AppColors.cream,

      monogram: 'C',
    ),

    GoldenWishPlanId.dhanam => const PlanAccent(
      accent: AppColors.burgundyDeep,

      background: AppColors.bgWhite,

      borderColor: AppColors.border,

      titleColor: AppColors.textPrimary,

      bodyColor: AppColors.textSecondary,

      ctaBackground: AppColors.burgundyDeep,

      ctaForeground: AppColors.cream,

      monogram: 'D',
    ),

    GoldenWishPlanId.goldNidhi => const PlanAccent(
      accent: AppColors.gold,

      background: AppColors.bgWhite,

      borderColor: AppColors.borderGold,

      titleColor: AppColors.textPrimary,

      bodyColor: AppColors.textSecondary,

      ctaBackground: AppColors.ink,

      ctaForeground: AppColors.cream,

      monogram: 'S',
    ),
  };

  static String schemeTypeFor(GoldenWishPlanId id) => switch (id) {
    GoldenWishPlanId.aura => 'aura',

    GoldenWishPlanId.crest => 'crest',

    GoldenWishPlanId.dhanam => 'dhanam',

    GoldenWishPlanId.goldNidhi => 'gold_nidhi',
  };
}
