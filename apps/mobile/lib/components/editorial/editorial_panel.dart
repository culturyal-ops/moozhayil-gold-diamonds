import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/iconography.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../icons/app_icon.dart';
import '../icons/app_icons.dart';
import '../surfaces/glass_surface.dart';

/// Flat editorial surface — white well, hairline border, square corners.
class EditorialPanel extends StatelessWidget {
  const EditorialPanel({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
    this.showBorder = true,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return LuxuryCard(
        padding: padding ?? const EdgeInsets.all(AppSpacing.md),
        color: color,
        onTap: onTap,
        child: child,
      );
    }

    return LuxuryCard(
      padding: padding ?? const EdgeInsets.all(AppSpacing.md),
      color: color,
      child: child,
    );
  }
}

/// Tappable list row inside an [EditorialPanel].
class EditorialListTile extends StatelessWidget {
  const EditorialListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.icon,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final IconData? icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return EditorialPanel(
      onTap: onTap,
      child: Row(
        children: [
          if (icon != null) ...[
            AppIcon(
              icon!,
              size: AppIconography.sizeSm,
              color: AppIconography.subtle,
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.uiBodyMD.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  subtitle,
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          trailing ??
              const AppIcon(
                AppIcons.chevronRight,
                size: AppIconography.sizeSm,
                color: AppIconography.subtle,
              ),
        ],
      ),
    );
  }
}

/// Square ink CTA — matches [PlanCard] and PDP footer.
class EditorialPrimaryCta extends StatelessWidget {
  const EditorialPrimaryCta({
    super.key,
    required this.label,
    required this.onTap,
    this.isDisabled = false,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final enabled = !isDisabled && !isLoading && onTap != null;

    return GestureDetector(
      onTap: enabled ? onTap : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        color: enabled ? AppColors.ink : AppColors.disabledBg,
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.paper),
                ),
              )
            : Text(
                label.toUpperCase(),
                style: AppTypography.buttonLabelSM.copyWith(
                  color: enabled ? AppColors.paper : AppColors.disabledText,
                  letterSpacing: 9 * 0.2,
                ),
              ),
      ),
    );
  }
}

/// Ghost gold outline CTA for secondary actions on dark/light surfaces.
class EditorialGhostCta extends StatelessWidget {
  const EditorialGhostCta({
    super.key,
    required this.label,
    required this.onTap,
    this.isDisabled = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      behavior: HitTestBehavior.opaque,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: isDisabled
                ? AppColors.border
                : AppColors.gold.withValues(alpha: 0.7),
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: 12,
          ),
          child: Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTypography.buttonLabelSM.copyWith(
              fontWeight: FontWeight.w300,
              letterSpacing: 9 * 0.22,
              color: isDisabled ? AppColors.disabledText : AppColors.gold,
            ),
          ),
        ),
      ),
    );
  }
}
