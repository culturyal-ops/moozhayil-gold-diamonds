import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/typography.dart';

/// Graceful fallback shown while no photography is available.
///
/// Rendered as a soft champagne-to-ivory wash with a restrained gold monogram,
/// so an empty image slot still reads as intentional, premium negative space
/// rather than a broken tile.
class ProductImagePlaceholder extends StatelessWidget {
  const ProductImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.pearl,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: Center(
        child: Text(
          'M',
          style: AppTypography.displayLG.copyWith(
            color: AppColors.brandBurgundy.withValues(alpha: 0.28),
          ),
        ),
      ),
    );
  }
}
