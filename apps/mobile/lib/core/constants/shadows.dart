import 'package:flutter/material.dart';

/// All shadow tokens for Moozhayil Gold & Diamonds.
/// Source: 02-design-system.md
/// Rule: Never define BoxShadow inline in widgets — always reference AppShadows.*.
abstract final class AppShadows {
  /// Default card shadow — soft natural depth, no grey smudge.
  static const BoxShadow sm = BoxShadow(
    color: Color(0x0A1A1612),
    offset: Offset(0, 1),
    blurRadius: 8,
    spreadRadius: 0,
  );

  /// Elevated card shadow.
  static const BoxShadow md = BoxShadow(
    color: Color(0x0C1A1612),
    offset: Offset(0, 2),
    blurRadius: 14,
    spreadRadius: 0,
  );

  /// Bottom bar / sticky elements — shadow pointing upward (6% obsidian).
  static const BoxShadow top = BoxShadow(
    color: Color(0x0F1A1612),
    offset: Offset(0, -2),
    blurRadius: 12,
    spreadRadius: 0,
  );

  /// Dream Vault elevated card (10% vault dusk opacity).
  static const BoxShadow vault = BoxShadow(
    color: Color(0x1A1E1A2E),
    offset: Offset(0, 4),
    blurRadius: 24,
    spreadRadius: 0,
  );
}
