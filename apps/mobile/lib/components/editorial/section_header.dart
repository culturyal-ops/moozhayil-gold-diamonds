import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';

/// Editorial section header: a small uppercase eyebrow above a large serif
/// title, with an optional trailing text action (e.g. "View all").
///
/// Used to give catalog sections the calm, magazine-style hierarchy described
/// in the design philosophy (large type, generous spacing, restraint).
class SectionHeader extends StatelessWidget {
  const SectionHeader({
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
                Text(
                  eyebrow!.toUpperCase(),
                  style: AppTypography.uiMicro.copyWith(
                    color: AppColors.gold,
                    letterSpacing: 1.6,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
              ],
              Text(title, style: AppTypography.headingLG),
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
                  fontSize: 9,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textSecondary,
                  letterSpacing: 9 * 0.22,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
