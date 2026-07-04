import 'package:flutter/material.dart';

import 'colors.dart';

/// Shared icon sizing and colour tokens for the Moozhayil icon system.
abstract final class AppIconography {
  static const double sizeSm = 18;
  static const double sizeMd = 20;
  static const double sizeLg = 22;

  /// Top-bar utility controls (menu, search) — lighter than brand lockup.
  static const double sizeNavUtility = 16;

  static const Color active = AppColors.brandBurgundy;
  static const Color inactive = Color(0xFF5C5651);
  static const Color subtle = AppColors.textMuted;
  static const Color navUtility = Color(0xFFABA49C);
  static const Color accent = AppColors.gold;
}
