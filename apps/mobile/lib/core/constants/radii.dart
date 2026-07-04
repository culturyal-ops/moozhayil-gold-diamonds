/// All border-radius tokens for Moozhayil Gold & Diamonds.
/// Source: 02-design-system.md
/// Rule: Never use raw double literals for border radius — always reference AppRadius.*.
abstract final class AppRadius {
  // Flat editorial system: corners are square. The only exceptions are the
  // detail-screen thumbnails (2) and circular avatars.
  static const double xs = 0.0;
  static const double sm = 0.0;
  static const double md = 0.0;
  static const double lg = 0.0;
  static const double xl = 0.0;
  static const double full = 999.0;

  // Semantic uses
  static const double card = 0.0;
  static const double button = 0.0;
  static const double chip = 0.0;
  static const double input = 0.0;
  static const double bottomSheet = 0.0;
  static const double avatar = 999.0;
  static const double productImage = 0.0;

  /// Detail-screen image thumbnails — the single allowed soft corner.
  static const double thumbnail = 2.0;

  /// Editorial showcase carousel cards — soft corners for portfolio feel.
  static const double showcaseCard = 20.0;
}
