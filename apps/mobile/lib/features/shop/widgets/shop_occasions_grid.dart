import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/editorial/editorial_image.dart';
import '../../../core/animations/premium_pressable.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/product.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/utils/sample_imagery.dart';
import 'shop_section.dart';

/// Compact 2-column occasion browse — shop discovery, not Home carousel.
class ShopOccasionsGrid extends StatelessWidget {
  const ShopOccasionsGrid({super.key, required this.occasions});

  final List<CatalogRef> occasions;

  @override
  Widget build(BuildContext context) {
    if (occasions.isEmpty) return const SizedBox.shrink();

    final items = occasions.take(4).toList();

    return ShopSectionInset(
      bottom: 36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShopSectionHeader(
            title: 'Browse by occasion',
            subtitle: 'Find pieces for the moment you are shopping for.',
          ),
          const SizedBox(height: AppSpacing.md),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.35,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _OccasionTile(
                item: item,
                onTap: () {
                  if (item.id.startsWith('sample-')) {
                    context.push(AppRoutes.shopSearch);
                    return;
                  }
                  context.push(
                    AppRoutes.shopOccasion.replaceFirst(':occasionId', item.id),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _OccasionTile extends StatelessWidget {
  const _OccasionTile({required this.item, required this.onTap});

  final CatalogRef item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PremiumPressable(
      onTap: onTap,
      scaleEnd: 0.98,
      child: Stack(
        fit: StackFit.expand,
        children: [
          EditorialImage(
            url: SampleImagery.editorialOr(
              item.coverImage ?? item.imageUrl,
              item.id,
              width: 800,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.ink.withValues(alpha: 0.72),
                ],
                stops: const [0.45, 1.0],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                item.name,
                style: AppTypography.uiBodyMD.copyWith(
                  color: AppColors.cream,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
