import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../components/editorial/monogram_pattern.dart';

/// Schemes call-to-action — deep burgundy editorial moment on the home screen.
class GoldenWishHomeBand extends StatelessWidget {
  const GoldenWishHomeBand({
    super.key,
    required this.onExplorePlans,
    this.liveRateDisplay,
    this.ctaLabel = 'Explore Schemes',
  });

  final VoidCallback onExplorePlans;
  final String? liveRateDisplay;
  final String ctaLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.burgundyDeep,
      child: Stack(
        children: [
          const MonogramPattern(opacity: 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.x3l,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MOOZHAYIL SCHEMES',
                  style: AppTypography.uiMicro.copyWith(
                    color: AppColors.goldLight,
                    letterSpacing: 9 * 0.3,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Start your jewellery\nsavings journey',
                  style: AppTypography.displayLG.copyWith(
                    fontSize: 36,
                    height: 1.05,
                    color: AppColors.cream,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Aura Plan, Crest, Dhanam, and Swarna Nidhi — trusted since 1969.',
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.cream.withValues(alpha: 0.72),
                    height: 1.8,
                  ),
                ),
                if (liveRateDisplay != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.goldLight.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Text(
                      "Today's rate · $liveRateDisplay",
                      style: AppTypography.uiBodySM.copyWith(
                        color: AppColors.goldLight,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.xl),
                GestureDetector(
                  onTap: onExplorePlans,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    alignment: Alignment.center,
                    color: AppColors.cream,
                    child: Text(
                      ctaLabel,
                      style: AppTypography.buttonLabelSM.copyWith(
                        color: AppColors.burgundyDark,
                        letterSpacing: 9 * 0.28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
