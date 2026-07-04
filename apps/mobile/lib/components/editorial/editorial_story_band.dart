import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/radii.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import 'editorial_image.dart';

/// An image-led "story" band: a tall photograph followed by an eyebrow, a large
/// serif statement, a calm body line, and an optional text link.
///
/// Used for brand / craftsmanship moments that reinforce ownership and trust
/// without selling — the quiet editorial panels seen on luxury storefronts.
class EditorialStoryBand extends StatelessWidget {
  const EditorialStoryBand({
    super.key,
    required this.imageUrl,
    required this.title,
    this.eyebrow,
    this.body,
    this.linkLabel,
    this.onLink,
    this.imageHeight = AppSpacing.x3l * 4,
  });

  final String imageUrl;
  final String title;
  final String? eyebrow;
  final String? body;
  final String? linkLabel;
  final VoidCallback? onLink;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: EditorialImage(url: imageUrl),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        if (eyebrow != null) ...[
          Text(
            eyebrow!.toUpperCase(),
            style: AppTypography.uiMicro.copyWith(
              color: AppColors.maroon,
              letterSpacing: 1.6,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        Text(title, style: AppTypography.displayLG),
        if (body != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            body!,
            style: AppTypography.uiBodyMD.copyWith(color: AppColors.slateMist),
          ),
        ],
        if (linkLabel != null && onLink != null) ...[
          const SizedBox(height: AppSpacing.md),
          GestureDetector(
            onTap: onLink,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  linkLabel!,
                  style: AppTypography.buttonLabelSM.copyWith(
                    color: AppColors.obsidian,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.obsidian,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
