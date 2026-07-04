import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/animations/premium_pressable.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/shadows.dart';

/// Frosted glass panel — nav bars, floating CTAs, scheme cards.
class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.blurSigma = 16,
    this.borderRadius = BorderRadius.zero,
    this.showTopBorder = false,
    this.showBottomBorder = false,
    this.elevated = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double blurSigma;
  final BorderRadius borderRadius;
  final bool showTopBorder;
  final bool showBottomBorder;
  final bool elevated;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: elevated
            ? const [AppShadows.top]
            : const [
                BoxShadow(
                  color: Color(0x0A1A1612),
                  blurRadius: 8,
                  offset: Offset(0, 1),
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.glassSurface,
              border: Border(
                top: showTopBorder
                    ? const BorderSide(color: AppColors.glassBorder, width: 0.5)
                    : BorderSide.none,
                bottom: showBottomBorder
                    ? const BorderSide(color: AppColors.glassBorder, width: 0.5)
                    : BorderSide.none,
              ),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFAFAFAF8),
                ],
              ),
            ),
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

/// Raised luxury card — soft shadow, pearl well, hairline edge highlight.
class LuxuryCard extends StatelessWidget {
  const LuxuryCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? AppColors.bgWhite,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: AppColors.border, width: 0.5),
        boxShadow: const [AppShadows.sm],
      ),
      child: child,
    );

    if (onTap == null) return card;

    return PremiumPressable(
      onTap: onTap,
      scaleEnd: 0.985,
      child: card,
    );
  }
}
