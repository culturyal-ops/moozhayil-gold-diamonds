import 'package:flutter/material.dart';

/// All animation duration and curve tokens for Moozhayil Gold & Diamonds.
/// Source: 02-design-system.md
///
/// Rule 10 (09-cursor-rules.md): Progress rings must use [ringFill] duration
/// and [curveDefault] curve. Never use bounce or spring curves on rings.
abstract final class AppAnimations {
  // ── Durations ─────────────────────────────────────────────────────────────
  static const Duration xs = Duration(milliseconds: 120);
  static const Duration sm = Duration(milliseconds: 200);
  static const Duration md = Duration(milliseconds: 280);
  static const Duration lg = Duration(milliseconds: 350);
  static const Duration xl = Duration(milliseconds: 500);
  static const Duration xxl = Duration(milliseconds: 600);

  /// Auto-advance hold time for each onboarding splash slide.
  static const Duration splash = Duration(milliseconds: 2400);

  /// Shimmer sweep loop duration.
  static const Duration shimmer = Duration(milliseconds: 1200);

  /// Progress ring fill animation (mount + value change).
  static const Duration ringFill = Duration(milliseconds: 600);

  /// Gold balance count-up on screen enter or new contribution.
  static const Duration goldCountUp = Duration(milliseconds: 800);

  /// Milestone ring pulse: scale 1.0 → 1.12 → 1.0, one-shot.
  static const Duration milestonePulse = Duration(milliseconds: 800);

  // ── Luxury motion tokens ──────────────────────────────────────────────────

  /// Home hero cinematic reveal: greeting → banner → sections.
  static const Duration heroEntry = Duration(milliseconds: 900);

  /// Bottom-nav hairline indicator slide between tabs.
  static const Duration navIndicator = Duration(milliseconds: 220);

  /// Calm payment success: ring expand sequence.
  static const Duration successRing = Duration(milliseconds: 800);

  /// Stagger interval between consecutive FadeSlideIn sections on Home.
  static const Duration staggerStep = Duration(milliseconds: 90);

  /// Button scale-compress on tap-down (luxury press feel).
  static const Duration buttonPress = Duration(milliseconds: 110);

  // ── Curves ────────────────────────────────────────────────────────────────

  /// Default page / component transitions.
  static const Curve curveDefault = Curves.easeOut;

  /// Decelerate for slide-in from outside screen.
  static const Curve curveDecelerate = Curves.decelerate;

  /// Spring — used ONLY for the Dream Vault heart tap animation.
  static const Curve curveSpring = Curves.elasticOut;

  /// Cross-dissolve and opacity fades.
  static const Curve curveFade = Curves.easeInOut;

  /// Smooth decelerate for luxury counter roll and section reveals.
  static const Curve curveEaseOutCubic = Cubic(0.33, 1, 0.68, 1);
}
