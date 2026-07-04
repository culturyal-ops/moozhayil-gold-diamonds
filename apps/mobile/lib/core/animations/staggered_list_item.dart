import 'package:flutter/material.dart';

import '../constants/motion.dart';
import 'fade_slide_in.dart';

/// Staggered list/row entrance for Profile, AI Advisor, and similar screens.
class StaggeredListItem extends StatelessWidget {
  const StaggeredListItem({
    super.key,
    required this.index,
    required this.child,
    this.baseDelay = Duration.zero,
    this.step = AppMotion.staggerStep,
  });

  final int index;
  final Widget child;
  final Duration baseDelay;
  final Duration step;

  @override
  Widget build(BuildContext context) {
    return FadeSlideIn(
      delay: baseDelay + (step * index),
      duration: AppMotion.normal,
      offsetY: AppMotion.revealOffsetY,
      curve: AppMotion.entrance,
      child: child,
    );
  }
}
