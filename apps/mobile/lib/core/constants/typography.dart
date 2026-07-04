import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

/// All typography tokens for Moozhayil Gold & Diamonds.
///
/// Cormorant Garamond (300/400, upright + italic) carries every heading,
/// product name, collection title and hero line. Inter (300/400/500) carries
/// all functional UI: labels, prices, nav, buttons, metadata.
///
/// Spec rules:
///   Cormorant never goes above weight 400, tracked at >= 0.06em.
///   Inter never goes above weight 500. Uppercase labels tracked at 0.18em.
///   Base body size is 13. Type runs small with generous air.
abstract final class AppTypography {
  static const double _displayTrack = 0.06;

  static TextStyle _cormorant({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w300,
    FontStyle fontStyle = FontStyle.normal,
    double height = 1.1,
    Color color = AppColors.textPrimary,
  }) {
    return GoogleFonts.cormorantGaramond(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: fontSize * _displayTrack,
      color: color,
    );
  }

  static TextStyle _inter({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    double height = 1.5,
    double letterSpacing = 0,
    Color color = AppColors.textPrimary,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  // Cormorant Garamond — display and emotional
  static final TextStyle displayXL = _cormorant(fontSize: 56, height: 0.92);
  static final TextStyle displayLG = _cormorant(fontSize: 40, height: 1.0);
  static final TextStyle headingXL = _cormorant(fontSize: 32, height: 1.05);
  static final TextStyle headingLG = _cormorant(fontSize: 28, height: 1.1);
  static final TextStyle headingMD = _cormorant(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 1.15,
  );
  static final TextStyle headingSM = _cormorant(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  /// Screen titles — serif display only for hero/editorial headlines.
  static final TextStyle screenTitle = _cormorant(
    fontSize: 32,
    fontWeight: FontWeight.w300,
    height: 1.05,
  );
  static final TextStyle productName = _cormorant(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  /// Second line of a mixed-weight editorial headline: italic, weight 400.
  static TextStyle displayItalic(double fontSize, {Color? color}) {
    return _cormorant(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      height: 1.0,
      color: color ?? AppColors.textPrimary,
    );
  }

  /// Drawer primary navigation — clean sans, retail scale.
  static TextStyle drawerNavPrimary({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return _inter(
      fontSize: 18,
      fontWeight: fontWeight,
      height: 1.35,
      color: color ?? AppColors.textPrimary,
    );
  }

  /// Drawer secondary navigation — smaller sans links.
  static TextStyle drawerNavSecondary({
    Color? color,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return _inter(
      fontSize: 15,
      fontWeight: fontWeight,
      height: 1.4,
      color: color ?? AppColors.textSecondary,
    );
  }

  /// Legacy drawer nav alias — now sans-serif for retail navigation.
  static TextStyle drawerNav({Color? color, double fontSize = 18}) {
    return _inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      height: 1.35,
      color: color ?? AppColors.textPrimary,
    );
  }

  /// Drawer secondary links — functional Inter at 15–16px.
  static TextStyle drawerSecondary({Color? color}) {
    return drawerNavSecondary(color: color);
  }

  /// Aura voice — emotional italic copy.
  static final TextStyle auraVoice = _cormorant(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  // Inter — functional UI
  static final TextStyle uiBodyLG = _inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );
  static final TextStyle uiBodyMD = _inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );
  static final TextStyle uiBodySM = _inter(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  /// Uppercase metadata label, tracked at 0.18em.
  static final TextStyle uiLabel = _inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 10 * 0.18,
    color: AppColors.textMuted,
  );
  static final TextStyle uiCaption = _inter(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    height: 1.4,
    color: AppColors.textMuted,
  );

  /// Eyebrow / badge micro label, tracked tight uppercase.
  static final TextStyle uiMicro = _inter(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 9 * 0.18,
    color: AppColors.textMuted,
  );

  static final TextStyle buttonLabel = _inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 10 * 0.2,
  );
  static final TextStyle buttonLabelSM = _inter(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: 9 * 0.2,
  );

  // Price display
  static final TextStyle priceLG = _inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: AppColors.textPrimary,
  );
  static final TextStyle priceMD = _inter(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    height: 1.2,
    color: AppColors.textSecondary,
  );
  static final TextStyle priceSM = _inter(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    height: 1.2,
    color: AppColors.textMuted,
  );
}
