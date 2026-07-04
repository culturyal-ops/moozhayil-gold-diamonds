import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

import '../../core/constants/spacing.dart';

import '../../core/constants/typography.dart';

import '../buttons/primary_button.dart';

/// Polished empty-state display with editorial hierarchy.

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,

    required this.headline,

    this.icon,

    this.body,

    this.ctaLabel,

    this.onCtaTap,
  });

  final IconData? icon;

  final String headline;

  final String? body;

  final String? ctaLabel;

  final VoidCallback? onCtaTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.xl,

        AppSpacing.xxl,

        AppSpacing.xl,

        AppSpacing.lg,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          if (icon != null) ...[
            Container(
              width: 56,

              height: 56,

              alignment: Alignment.center,

              decoration: BoxDecoration(
                color: AppColors.bgWhite,
                border: Border.all(color: AppColors.border, width: 0.5),
              ),

              child: Icon(icon, size: 22, color: AppColors.textSecondary),
            ),

            const SizedBox(height: AppSpacing.md),
          ],

          Text(
            headline,

            style: AppTypography.headingSM.copyWith(
              color: AppColors.textPrimary,

              fontWeight: FontWeight.w400,
            ),

            textAlign: TextAlign.center,
          ),

          if (body != null) ...[
            const SizedBox(height: AppSpacing.xs),

            Text(
              body!,

              style: AppTypography.uiBodySM.copyWith(
                color: AppColors.textSecondary,
              ),

              textAlign: TextAlign.center,
            ),
          ],

          if (ctaLabel != null && onCtaTap != null) ...[
            const SizedBox(height: AppSpacing.lg),

            PrimaryButton(label: ctaLabel!, onTap: onCtaTap),
          ],
        ],
      ),
    );
  }
}
