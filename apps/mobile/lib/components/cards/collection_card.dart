import 'package:flutter/material.dart';

import '../../core/animations/premium_pressable.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/models/product.dart';
import '../../core/utils/sample_imagery.dart';
import '../editorial/editorial_image.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({super.key, required this.collection, this.onTap});

  final CatalogRef collection;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return PremiumPressable(
      onTap: onTap,
      scaleEnd: 0.99,
      child: SizedBox(
        width: AppSpacing.x3l * 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            EditorialImage(
              url: SampleImagery.editorialOr(
                collection.coverImage ?? collection.imageUrl,
                collection.id,
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00000000), Color(0xB3000000)],
                  stops: [0.45, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  collection.name,
                  style: AppTypography.headingMD.copyWith(
                    color: AppColors.pureWhite,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
