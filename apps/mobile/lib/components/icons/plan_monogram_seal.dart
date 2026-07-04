import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/typography.dart';

/// Premium monogram seal for Moozhayil scheme plans.
class PlanMonogramSeal extends StatelessWidget {
  const PlanMonogramSeal({
    super.key,
    required this.letter,
    required this.accentColor,
    this.size = 36,
    this.borderColor,
    this.backgroundColor,
  });

  final String letter;
  final Color accentColor;
  final double size;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final border = borderColor ?? accentColor.withValues(alpha: 0.45);

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.bgWhite,
        border: Border.all(color: border, width: 1),
      ),
      child: Text(
        letter,
        style: AppTypography.headingSM.copyWith(
          fontSize: size * 0.42,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: accentColor,
          height: 1,
        ),
      ),
    );
  }
}
