import 'package:flutter/material.dart';

import '../../../components/feedback/loading_shimmer.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import 'shop_search_field.dart';
import 'shop_section.dart';

/// Compact Shop tab header — catalogue identity, not a marketing hero.
class ShopMasthead extends StatelessWidget {
  const ShopMasthead({
    super.key,
    required this.onSearchTap,
    this.rateDisplay,
    this.isRateLoading = false,
    this.pieceCount,
  });

  final VoidCallback onSearchTap;
  final String? rateDisplay;
  final bool isRateLoading;
  final int? pieceCount;

  @override
  Widget build(BuildContext context) {
    return ShopSectionInset(
      top: 20,
      bottom: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style: AppTypography.headingLG.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        height: 1.05,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      pieceCount != null
                          ? '$pieceCount hallmarked pieces · priced from today\u2019s gold rate'
                          : 'Hallmarked jewellery · priced from today\u2019s gold rate',
                      style: AppTypography.uiBodySM.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              _RateChip(rateDisplay: rateDisplay, isLoading: isRateLoading),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ShopSearchEntry(onTap: onSearchTap),
        ],
      ),
    );
  }
}

class _RateChip extends StatelessWidget {
  const _RateChip({this.rateDisplay, required this.isLoading});

  final String? rateDisplay;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading && rateDisplay == null) {
      return const LoadingShimmer(width: 88, height: 28);
    }

    final label = rateDisplay ?? '₹6,850/g';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.ink,
        border: Border.all(
          color: AppColors.gold.withValues(alpha: 0.35),
          width: 0.5,
        ),
      ),
      child: Text(
        label,
        style: AppTypography.uiMicro.copyWith(
          color: AppColors.goldLight,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
