import 'package:flutter/material.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';

class AuraOptionButton extends StatelessWidget {
  const AuraOptionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isPrimary = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return PrimaryButton(
        label: label,
        isLoading: isLoading,
        isFullWidth: true,
        onTap: onPressed,
      );
    }

    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      behavior: HitTestBehavior.opaque,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.brandBurgundy.withValues(alpha: 0.65),
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: 12,
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    label.toUpperCase(),
                    style: AppTypography.buttonLabelSM.copyWith(
                      color: AppColors.brandBurgundy,
                      letterSpacing: 9 * 0.22,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
