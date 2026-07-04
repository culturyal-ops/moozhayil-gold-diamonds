import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/radii.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../buttons/destructive_button.dart';
import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';

/// Confirmation bottom sheet for destructive or important actions.
/// Source: 02-design-system.md § Bottom Sheet System
/// Source: 03-component-library.md § ConfirmationBottomSheet
///
/// Dismiss: swipe down, tap scrim, or cancel button.
/// When [isDestructive] is true, the confirm button uses [DestructiveButton].
///
/// Usage:
/// ```dart
/// showConfirmationSheet(
///   context: context,
///   title: 'Remove from Vault',
///   body: 'This piece will be removed from your Dream Vault.',
///   confirmLabel: 'Remove',
///   cancelLabel: 'Keep it',
///   isDestructive: true,
///   onConfirm: () { ... },
/// );
/// ```
Future<bool?> showConfirmationSheet({
  required BuildContext context,
  required String title,
  required String body,
  required String confirmLabel,
  required String cancelLabel,
  bool isDestructive = false,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (_) => ConfirmationBottomSheet(
      title: title,
      body: body,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      isDestructive: isDestructive,
      onConfirm: onConfirm,
      onCancel: onCancel,
    ),
  );
}

/// The widget content of the confirmation sheet.
/// Can be embedded directly or shown via [showConfirmationSheet].
class ConfirmationBottomSheet extends StatelessWidget {
  const ConfirmationBottomSheet({
    super.key,
    required this.title,
    required this.body,
    required this.confirmLabel,
    required this.cancelLabel,
    this.isDestructive = false,
    this.onConfirm,
    this.onCancel,
  });

  final String title;
  final String body;
  final String confirmLabel;
  final String cancelLabel;
  final bool isDestructive;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadius.bottomSheet),
          topRight: Radius.circular(AppRadius.bottomSheet),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          const SizedBox(height: AppSpacing.sm),
          Center(
            child: Container(
              width: AppSpacing.bottomSheetHandleWidth,
              height: AppSpacing.bottomSheetHandleHeight,
              decoration: BoxDecoration(
                color: AppColors.smokeLine,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.xs,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.headingSM.copyWith(
                    color: AppColors.obsidian,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  body,
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.slateMist,
                  ),
                ),
              ],
            ),
          ),
          // Actions
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.lg + MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (isDestructive)
                  DestructiveButton(
                    label: confirmLabel,
                    onTap: () {
                      Navigator.of(context).pop(true);
                      onConfirm?.call();
                    },
                  )
                else
                  PrimaryButton(
                    label: confirmLabel,
                    onTap: () {
                      Navigator.of(context).pop(true);
                      onConfirm?.call();
                    },
                    isFullWidth: true,
                  ),
                const SizedBox(height: AppSpacing.sm),
                SecondaryButton(
                  label: cancelLabel,
                  onTap: () {
                    Navigator.of(context).pop(false);
                    onCancel?.call();
                  },
                  isFullWidth: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
