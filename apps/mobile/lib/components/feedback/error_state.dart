import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../buttons/primary_button.dart';

/// Generic error state display.
/// Source: 03-component-library.md § ErrorState
/// Source: 01-product-spec.md § GLOBAL STATES — App-wide Error
///
/// Layout: centered, retry button below text.
/// All states: default | with-body | with-retry.
class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    this.headline = 'Something went wrong',
    this.body,
    this.onRetry,
  });

  final String headline;
  final String? body;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 32, color: AppColors.blushClay),
          const SizedBox(height: AppSpacing.md),
          Text(
            headline,
            style: AppTypography.uiBodyLG.copyWith(
              color: AppColors.obsidian,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          if (body != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              body!,
              style: AppTypography.uiBodySM.copyWith(
                color: AppColors.slateMist,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (onRetry != null) ...[
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(label: 'Try Again', onTap: onRetry),
          ],
        ],
      ),
    );
  }
}
