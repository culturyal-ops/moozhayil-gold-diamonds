/// All spacing tokens for Moozhayil Gold & Diamonds.
/// Source: 02-design-system.md
/// Rule: Never use raw double literals for layout — always reference AppSpacing.*.
abstract final class AppSpacing {
  // ── Base scale ────────────────────────────────────────────────────────────
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double x3l = 64.0;

  // ── Screen padding ────────────────────────────────────────────────────────
  static const double screenPadding = 16.0;
  static const double homeScreenPadding = 20.0;
  static const double screenPaddingLG = 24.0;

  // ── Card internal padding ─────────────────────────────────────────────────
  static const double cardPaddingSM = 12.0;
  static const double cardPaddingMD = 16.0;
  static const double cardPaddingLG = 20.0;

  // ── Navigation chrome ──────────────────────────────────────────────────────
  static const double tabBarHeight = 64.0;
  static const double shellBottomNavHeight = 56.0;
  static const double topBarHeight = 52.0;
  static const double productDetailActionBarHeight = 96.0;

  // ── Bottom sheet handle ───────────────────────────────────────────────────
  static const double bottomSheetHandleWidth = 36.0;
  static const double bottomSheetHandleHeight = 4.0;
}
