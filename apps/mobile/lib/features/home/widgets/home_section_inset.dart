import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';

/// Tighter horizontal inset for Home sections with consistent retail rhythm.
class HomeSectionInset extends StatelessWidget {
  const HomeSectionInset({
    super.key,
    required this.child,
    this.top = 24,
    this.bottom = 24,
  });

  final Widget child;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.homeScreenPadding,
        top,
        AppSpacing.homeScreenPadding,
        bottom,
      ),
      child: child,
    );
  }
}

/// Compact section header spacing for Home.
class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    this.eyebrow,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? eyebrow;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (eyebrow != null) ...[
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 2,
                      color: AppColors.brandBurgundy.withValues(alpha: 0.85),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      eyebrow!.toUpperCase(),
                      style: AppTypography.uiMicro.copyWith(
                        color: AppColors.gold,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
              ],
              Text(
                title,
                style: AppTypography.headingLG.copyWith(
                  fontSize: 29,
                  height: 1.08,
                ),
              ),
            ],
          ),
        ),
        if (actionLabel != null && onAction != null)
          GestureDetector(
            onTap: onAction,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.only(left: AppSpacing.sm),
              child: Text(
                actionLabel!,
                style: AppTypography.uiMicro.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  letterSpacing: 1.8,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
