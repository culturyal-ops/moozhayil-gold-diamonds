import 'package:flutter/material.dart';

import '../../../components/icons/app_icon.dart';
import '../../../components/icons/app_icons.dart';
import '../../../components/editorial/editorial_panel.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/iconography.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';

class AuraActionCard extends StatelessWidget {
  const AuraActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.accentColor,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    return EditorialPanel(
      onTap: onTap,
      child: Row(
        children: [
          AppIcon(
            icon,
            size: AppIconography.sizeMd,
            color: accentColor ?? AppIconography.subtle,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.headingSM.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  subtitle,
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
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
