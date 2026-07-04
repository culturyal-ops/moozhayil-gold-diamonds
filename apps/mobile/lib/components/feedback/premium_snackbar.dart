import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/typography.dart';
import '../../core/utils/app_haptics.dart';

/// Restrained commerce toast — crisp ink surface, optional action.
void showPremiumSnackBar(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 2),
  String? actionLabel,
  VoidCallback? onAction,
  bool haptic = true,
}) {
  final messenger = ScaffoldMessenger.maybeOf(context);
  if (messenger == null) return;

  if (haptic) AppHaptics.light();

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTypography.uiBodySM.copyWith(
          color: AppColors.cream,
          fontWeight: FontWeight.w500,
        ),
      ),
      duration: duration,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.ink,
      elevation: 0,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.gold.withValues(alpha: 0.35),
          width: 0.5,
        ),
      ),
      action: actionLabel != null && onAction != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: AppColors.goldLight,
              onPressed: onAction,
            )
          : null,
    ),
  );
}
