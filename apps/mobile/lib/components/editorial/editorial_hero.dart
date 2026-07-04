import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import 'editorial_image.dart';

/// Full-bleed editorial hero. Dark ground, dimmed photography, bottom-left type
/// with a mixed-weight Cormorant headline and a ghost gold CTA.
///
/// The [title] may contain a single newline; the first line is set upright and
/// the second line in italic to create the editorial tension.
class EditorialHero extends StatelessWidget {
  const EditorialHero({
    super.key,
    required this.imageUrl,
    required this.title,
    this.eyebrow,
    this.subtitle,
    this.ctaLabel,
    this.onCta,
    this.onTap,
    this.height,
    this.fullBleed = false,
  });

  final String imageUrl;
  final String title;
  final String? eyebrow;
  final String? subtitle;
  final String? ctaLabel;
  final VoidCallback? onCta;
  final VoidCallback? onTap;
  final double? height;
  final bool fullBleed;

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.sizeOf(context);
    final heroHeight = height ?? viewport.height * (fullBleed ? 0.92 : 0.62);

    final parts = title.split('\n');
    final lineOne = parts.first;
    final lineTwo = parts.length > 1 ? parts.sublist(1).join(' ') : null;
    final headlineSize = fullBleed ? 48.0 : 40.0;

    final content = SizedBox(
      height: heroHeight,
      width: double.infinity,
      child: ColoredBox(
        color: AppColors.ink,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 0.65,
              child: EditorialImage(
                url: imageUrl,
                alignment: const Alignment(0, -0.6),
              ),
            ),
            const ColoredBox(color: Color(0x731C1612)),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
                40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (eyebrow != null) ...[
                    Text(
                      eyebrow!.toUpperCase(),
                      style: AppTypography.uiMicro.copyWith(
                        color: AppColors.gold,
                        letterSpacing: 9 * 0.28,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                  ],
                  Text(
                    lineOne,
                    style: AppTypography.displayXL.copyWith(
                      fontSize: headlineSize,
                      color: AppColors.paper,
                    ),
                  ),
                  if (lineTwo != null)
                    Text(
                      lineTwo,
                      style: AppTypography.displayItalic(
                        headlineSize,
                        color: AppColors.paper,
                      ),
                    ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      subtitle!,
                      style: AppTypography.uiBodySM.copyWith(
                        color: AppColors.paper.withValues(alpha: 0.55),
                        letterSpacing: 12 * 0.1,
                      ),
                    ),
                  ],
                  if (ctaLabel != null && onCta != null) ...[
                    const SizedBox(height: AppSpacing.lg),
                    _HeroCta(label: ctaLabel!, onTap: onCta!),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(onTap: onTap, child: content);
  }
}

class _HeroCta extends StatelessWidget {
  const _HeroCta({required this.label, required this.onTap});

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
            color: Colors.transparent,
            borderRadius: BorderRadius.zero,
            border: Border.all(
              color: AppColors.gold.withValues(alpha: 0.7),
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: 10,
            ),
            child: Text(
              label.toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: 9,
                fontWeight: FontWeight.w300,
                height: 1.0,
                letterSpacing: 9 * 0.22,
                color: AppColors.goldLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
