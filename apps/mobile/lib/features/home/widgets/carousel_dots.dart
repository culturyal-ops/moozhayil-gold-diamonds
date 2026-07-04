import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/motion.dart';

/// Minimal page indicator for home carousels.
class CarouselDots extends StatelessWidget {
  const CarouselDots({
    super.key,
    required this.count,
    required this.index,
    this.activeColor,
    this.inactiveColor,
  });

  final int count;
  final int index;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    if (count <= 1) return const SizedBox.shrink();

    final active = activeColor ?? AppColors.brandBurgundy;
    final inactive = inactiveColor ?? AppColors.border;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == index;
        return AnimatedContainer(
          duration: AppMotion.navIndicator,
          curve: AppMotion.standard,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 18 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive ? active : inactive,
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }
}
