import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';

/// Ghost (text-only) button — for tertiary actions.
/// Source: 02-design-system.md § Button System — Ghost Button
/// Source: 03-component-library.md § GhostButton
///
/// Height: 44px. No background, no border.
/// Text: [AppTypography.buttonLabelSM] + antiqueGold + underline.
/// Optional trailing arrow ("→") via [showArrow].
class GhostButton extends StatelessWidget {
  const GhostButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isDisabled = false,
    this.showArrow = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    final color = isDisabled ? AppColors.disabledText : AppColors.textSecondary;
    final displayLabel = showArrow ? '$label →' : label;

    return Semantics(
      button: true,
      enabled: !isDisabled,
      child: SizedBox(
        height: 44,
        child: TextButton(
          onPressed: isDisabled ? null : onTap,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            foregroundColor: color,
            overlayColor: AppColors.bgWhite,
            minimumSize: const Size(0, 44),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            displayLabel,
            style: AppTypography.buttonLabelSM.copyWith(
              color: color,
              decoration: TextDecoration.underline,
              decorationColor: color,
            ),
          ),
        ),
      ),
    );
  }
}
