import 'package:flutter/material.dart';

import '../constants/motion.dart';
import 'fade_slide_in.dart';

/// Staggered editorial section reveal for Home, Shop, and Schemes.
class SectionReveal extends StatelessWidget {
  const SectionReveal({
    super.key,
    required this.index,
    required this.child,
    this.duration = AppMotion.normal,
  });

  final int index;
  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return FadeSlideIn(
      delay: AppMotion.staggerStep * index,
      duration: duration,
      offsetY: AppMotion.revealOffsetY,
      curve: AppMotion.entrance,
      child: child,
    );
  }
}
