import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/radii.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/utils/sample_imagery.dart';
import 'editorial_image.dart';

/// Nymira §5.2 — category rows with thumbnail + short description.
class EditorialCategoryShowcase extends StatelessWidget {
  const EditorialCategoryShowcase({super.key, required this.onCategoryTap});

  final void Function(String category) onCategoryTap;

  static const _items = <({String title, String body, String key})>[
    (
      title: 'Bracelets',
      body: 'Stackable gold cuffs and delicate chains for everyday elegance.',
      key: 'bracelets',
    ),
    (
      title: 'Earrings',
      body:
          'From classic studs to statement drops — hallmarked and hand-finished.',
      key: 'earrings',
    ),
    (
      title: 'Necklaces',
      body: 'Layered chains, temple sets, and heirloom pendants since 1969.',
      key: 'necklaces',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < _items.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.lg),
          _CategoryRow(
            title: _items[i].title,
            body: _items[i].body,
            imageUrl: SampleImagery.product(_items[i].key, width: 400),
            onTap: () => onCategoryTap(_items[i].title),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        Center(
          child: OutlinedButton(
            onPressed: () => onCategoryTap('all'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.textPrimary,
              side: const BorderSide(color: AppColors.border, width: 0.5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.sm,
              ),
            ),
            child: Text(
              'See all categories'.toUpperCase(),
              style: AppTypography.uiLabel.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.onTap,
  });

  final String title;
  final String body;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.headingMD),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  body,
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.slateMist,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.card),
            child: SizedBox(
              width: AppSpacing.x3l + AppSpacing.lg,
              height: AppSpacing.x3l + AppSpacing.lg,
              child: EditorialImage(url: imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
