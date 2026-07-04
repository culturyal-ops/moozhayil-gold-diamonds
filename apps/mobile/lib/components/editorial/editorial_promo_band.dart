import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import 'editorial_image.dart';

/// Full-bleed promotional band — ink overlay, ghost gold CTA, square corners.
class EditorialPromoBand extends StatelessWidget {
  const EditorialPromoBand({
    super.key,
    required this.imageUrl,
    required this.title,
    this.ctaLabel,
    this.onCta,
    this.height,
  });

  final String imageUrl;
  final String title;
  final String? ctaLabel;
  final VoidCallback? onCta;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bandHeight = height ?? MediaQuery.sizeOf(context).height * 0.48;

    return SizedBox(
      height: bandHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          EditorialImage(url: imageUrl),
          const ColoredBox(color: Color(0x731C1612)),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPaddingLG),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTypography.displayLG.copyWith(
                    color: AppColors.paper,
                    height: 1.1,
                  ),
                ),
                if (ctaLabel != null && onCta != null) ...[
                  const SizedBox(height: AppSpacing.lg),
                  GestureDetector(
                    onTap: onCta,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.gold.withValues(alpha: 0.7),
                          width: 0.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                          vertical: AppSpacing.md,
                        ),
                        child: Text(
                          ctaLabel!.toUpperCase(),
                          style: GoogleFonts.inter(
                            fontSize: 9,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 9 * 0.22,
                            color: AppColors.goldLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Collection feature — model/lifestyle photo with bottom overlay copy.
class EditorialFeatureBand extends StatelessWidget {
  const EditorialFeatureBand({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.linkLabel,
    this.onLink,
    this.height,
  });

  final String imageUrl;
  final String title;
  final String? subtitle;
  final String? linkLabel;
  final VoidCallback? onLink;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bandHeight = height ?? MediaQuery.sizeOf(context).height * 0.55;
    final parts = title.split('\n');
    final lineOne = parts.first;
    final lineTwo = parts.length > 1 ? parts.sublist(1).join(' ') : null;

    return SizedBox(
      height: bandHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          EditorialImage(url: imageUrl, alignment: Alignment.topCenter),
          const ColoredBox(color: Color(0x731C1612)),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenPaddingLG,
              AppSpacing.lg,
              AppSpacing.screenPaddingLG,
              AppSpacing.xxl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lineOne,
                  style: AppTypography.displayLG.copyWith(
                    color: AppColors.paper,
                    height: 1.1,
                  ),
                ),
                if (lineTwo != null)
                  Text(
                    lineTwo,
                    style: AppTypography.displayItalic(
                      36,
                      color: AppColors.paper,
                    ),
                  ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    subtitle!,
                    style: AppTypography.uiBodyMD.copyWith(
                      color: AppColors.paper.withValues(alpha: 0.55),
                      height: 1.5,
                    ),
                  ),
                ],
                if (linkLabel != null && onLink != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  GestureDetector(
                    onTap: onLink,
                    child: Text(
                      linkLabel!.toUpperCase(),
                      style: AppTypography.uiMicro.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.w300,
                        color: AppColors.goldLight,
                        letterSpacing: 9 * 0.22,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
