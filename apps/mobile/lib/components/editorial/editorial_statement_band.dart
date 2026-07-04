import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import 'monogram_pattern.dart';

/// Full-bleed deep-burgundy editorial statement — oversized cream serif quote
/// over a subtle monogram-lozenge texture, framed by gold hairlines.
///
/// This is the brand "moment" that gives the app its jewellery-house identity.
class EditorialStatementBand extends StatelessWidget {
  const EditorialStatementBand({
    super.key,
    required this.headline,
    this.eyebrow,
    this.body,
    this.ctaLabel,
    this.onCta,
  });

  /// Two lines separated by a single newline — first upright, second italic.
  final String headline;
  final String? eyebrow;
  final String? body;
  final String? ctaLabel;
  final VoidCallback? onCta;

  @override
  Widget build(BuildContext context) {
    final parts = headline.split('\n');
    final lineOne = parts.first;
    final lineTwo = parts.length > 1 ? parts.sublist(1).join(' ') : null;

    return Container(
      width: double.infinity,
      color: AppColors.burgundyDeep,
      child: Stack(
        children: [
          const MonogramPattern(opacity: 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.x3l,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 28, height: 0.75, color: AppColors.goldLight),
                const SizedBox(height: AppSpacing.lg),
                if (eyebrow != null) ...[
                  Text(
                    eyebrow!.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: AppTypography.uiMicro.copyWith(
                      color: AppColors.goldLight,
                      letterSpacing: 9 * 0.32,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],
                Text(
                  lineOne,
                  textAlign: TextAlign.center,
                  style: AppTypography.displayLG.copyWith(
                    fontSize: 38,
                    height: 1.05,
                    color: AppColors.cream,
                  ),
                ),
                if (lineTwo != null)
                  Text(
                    lineTwo,
                    textAlign: TextAlign.center,
                    style: AppTypography.displayItalic(
                      38,
                      color: AppColors.cream,
                    ).copyWith(height: 1.1),
                  ),
                if (body != null) ...[
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    body!,
                    textAlign: TextAlign.center,
                    style: AppTypography.uiBodySM.copyWith(
                      color: AppColors.cream.withValues(alpha: 0.72),
                      height: 1.8,
                    ),
                  ),
                ],
                if (ctaLabel != null && onCta != null) ...[
                  const SizedBox(height: AppSpacing.xl),
                  _StatementCta(label: ctaLabel!, onTap: onCta!),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatementCta extends StatelessWidget {
  const _StatementCta({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.goldLight.withValues(alpha: 0.8),
              width: 0.75,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: 12,
            ),
            child: Text(
              label.toUpperCase(),
              style: AppTypography.buttonLabelSM.copyWith(
                color: AppColors.goldLight,
                letterSpacing: 9 * 0.28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
