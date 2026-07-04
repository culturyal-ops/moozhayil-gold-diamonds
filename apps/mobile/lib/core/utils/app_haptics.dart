import 'package:flutter/services.dart';

/// Centralized haptic feedback — toggle [enabled] when settings arrive.
abstract final class AppHaptics {
  static bool enabled = true;

  static void light() {
    if (!enabled) return;
    HapticFeedback.lightImpact();
  }

  static void selection() {
    if (!enabled) return;
    HapticFeedback.selectionClick();
  }

  static void medium() {
    if (!enabled) return;
    HapticFeedback.mediumImpact();
  }
}
