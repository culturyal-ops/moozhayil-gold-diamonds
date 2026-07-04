import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/animations/premium_pressable.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import 'shop_section.dart';

/// Utility links — compact shop footer, not Home campaign blocks.
class ShopUtilityStrip extends StatelessWidget {
  const ShopUtilityStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return ShopSectionInset(
      bottom: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 0.5),
          color: AppColors.bgWhite,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: _UtilityLink(
                  label: 'New arrivals',
                  onTap: () => context.push(AppRoutes.newArrivals),
                ),
              ),
              const VerticalDivider(width: 0.5, color: AppColors.border),
              Expanded(
                child: _UtilityLink(
                  label: 'Schemes',
                  onTap: () => context.go(AppRoutes.goldenWish),
                ),
              ),
              const VerticalDivider(width: 0.5, color: AppColors.border),
              Expanded(
                child: _UtilityLink(
                  label: 'Showroom',
                  onTap: () => context.push(AppRoutes.storeLocator),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UtilityLink extends StatelessWidget {
  const _UtilityLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PremiumPressable(
      onTap: onTap,
      scaleEnd: 0.99,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.xs,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AppTypography.uiCaption.copyWith(
            color: AppColors.brandBurgundy,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
