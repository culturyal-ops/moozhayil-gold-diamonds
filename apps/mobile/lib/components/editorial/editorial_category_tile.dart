import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/models/product.dart';
import '../../core/utils/sample_imagery.dart';
import 'editorial_image.dart';

/// Large image-led category row — the Coral Venor / NYMIRA catalog moment.
/// Stacked full-width tiles with serif titles overlaid on photography.
class EditorialCategoryStack extends StatelessWidget {
  const EditorialCategoryStack({
    super.key,
    required this.items,
    required this.onItemTap,
    this.tileHeight = AppSpacing.x3l * 2 + AppSpacing.xl,
  });

  final List<CatalogRef> items;
  final void Function(CatalogRef item) onItemTap;
  final double tileHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.sm),
          EditorialCategoryTile(
            title: items[i].name,
            imageUrl: SampleImagery.editorialOr(
              items[i].coverImage ?? items[i].imageUrl,
              items[i].id,
              width: 1200,
            ),
            height: tileHeight,
            onTap: () => onItemTap(items[i]),
          ),
        ],
      ],
    );
  }
}

class EditorialCategoryTile extends StatelessWidget {
  const EditorialCategoryTile({
    super.key,
    required this.title,
    required this.imageUrl,
    this.subtitle,
    this.onTap,
    this.height = AppSpacing.x3l * 2 + AppSpacing.xl,
  });

  final String title;
  final String imageUrl;
  final String? subtitle;
  final VoidCallback? onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            EditorialImage(url: imageUrl),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.maroonDeep.withValues(alpha: 0.55),
                    AppColors.maroonDeep.withValues(alpha: 0.12),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPaddingLG,
                vertical: AppSpacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: AppTypography.headingXL.copyWith(
                      color: AppColors.pureWhite,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      subtitle!,
                      style: AppTypography.uiBodySM.copyWith(
                        color: AppColors.champagneVeil,
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Explore',
                        style: AppTypography.buttonLabelSM.copyWith(
                          color: AppColors.champagneVeil,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      const Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: AppColors.champagneVeil,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
