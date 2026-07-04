import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/radii.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/models/product.dart';

class OccasionChip extends StatelessWidget {
  const OccasionChip({super.key, required this.occasion, this.onTap});

  final CatalogRef occasion;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: AppColors.pureWhite,
            borderRadius: BorderRadius.circular(AppRadius.chip),
            border: Border.all(color: AppColors.champagneVeil),
          ),
          child: Text(occasion.name, style: AppTypography.uiBodySM),
        ),
      ),
    );
  }
}
