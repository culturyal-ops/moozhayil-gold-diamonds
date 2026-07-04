import 'package:flutter/material.dart';

import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import 'brand_monogram.dart';

/// Monogram + wordmark treated as one mark: serif type, tight gap, shared baseline.
class BrandLockup extends StatelessWidget {
  const BrandLockup({super.key, this.compact = false});

  /// Slightly smaller for dense chrome (drawer header).
  const BrandLockup.compact({super.key}) : compact = true;

  static const _wordmarkSize = 17.0;
  static const _monogramHeight = 20.0;
  static const _monogramHeightCompact = 18.0;

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final monogramHeight = compact ? _monogramHeightCompact : _monogramHeight;
    // Optical baseline: flat M sits slightly above the serif text baseline.
    final monogramBaseline = _wordmarkSize * 0.82;

    return Semantics(
      label: 'Moozhayil Gold & Diamonds',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Baseline(
            baseline: monogramBaseline,
            baselineType: TextBaseline.alphabetic,
            child: BrandMonogram(height: monogramHeight),
          ),
          const SizedBox(width: AppSpacing.xxs),
          Text('Moozhayil', style: AppTypography.brandWordmark),
        ],
      ),
    );
  }
}
