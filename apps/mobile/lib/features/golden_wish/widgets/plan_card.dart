import 'package:flutter/material.dart';

import '../../../components/icons/plan_monogram_seal.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../models/golden_wish_plan.dart';
import 'plan_accent.dart';

/// Premium scheme brochure card — distinct visual identity per plan.
class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    required this.plan,
    required this.onLearnMore,
    required this.onJoinNow,
    this.onVisitShowroom,
  });

  final GoldenWishPlan plan;
  final VoidCallback onLearnMore;
  final VoidCallback onJoinNow;
  final VoidCallback? onVisitShowroom;

  @override
  Widget build(BuildContext context) {
    final accent = PlanAccent.forPlan(plan.id);
    final primaryLabel = switch (plan.id) {
      GoldenWishPlanId.aura => 'Start Aura Plan',
      _ => plan.enrollmentAvailable ? 'Join now' : 'Visit Store',
    };

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: accent.background,
        border: Border.all(color: accent.borderColor, width: 0.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x081A1612),
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: accent.accent),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        PlanMonogramSeal(
                          letter: accent.monogram,
                          accentColor: accent.accent,
                          borderColor: accent.accent.withValues(alpha: 0.45),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plan.title,
                                style: AppTypography.headingMD.copyWith(
                                  fontSize: 20,
                                  color: accent.titleColor,
                                ),
                              ),
                              Text(
                                plan.tagline.toUpperCase(),
                                style: AppTypography.uiMicro.copyWith(
                                  color: accent.accent,
                                  letterSpacing: 9 * 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      plan.summary,
                      style: AppTypography.uiBodySM.copyWith(
                        color: accent.bodyColor,
                        height: 1.7,
                      ),
                    ),
                    if (!plan.enrollmentAvailable) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Available through our showroom. Contact Moozhayil to continue.',
                        style: AppTypography.uiBodySM.copyWith(
                          color: accent.bodyColor,
                          height: 1.5,
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.lg),
                    GestureDetector(
                      onTap: onLearnMore,
                      child: Text(
                        'Learn more',
                        style: AppTypography.uiBodySM.copyWith(
                          decoration: TextDecoration.underline,
                          color: accent.bodyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    if (plan.enrollmentAvailable)
                      _PlanCta(
                        label: primaryLabel,
                        filled: plan.id == GoldenWishPlanId.aura,
                        accent: accent,
                        onTap: onJoinNow,
                      )
                    else
                      _PlanCta(
                        label: 'Visit Store',
                        filled: true,
                        accent: accent,
                        onTap: onVisitShowroom ?? onLearnMore,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCta extends StatelessWidget {
  const _PlanCta({
    required this.label,
    required this.filled,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final PlanAccent accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? accent.ctaBackground : Colors.transparent,
          border: filled
              ? null
              : Border.all(color: accent.accent.withValues(alpha: 0.5)),
        ),
        child: Text(
          label.toUpperCase(),
          style: AppTypography.buttonLabelSM.copyWith(
            color: filled ? accent.ctaForeground : accent.accent,
            letterSpacing: 9 * 0.2,
          ),
        ),
      ),
    );
  }
}
