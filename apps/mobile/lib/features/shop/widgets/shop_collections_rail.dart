import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/cards/collection_card.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/models/product.dart';
import '../../../core/routing/app_routes.dart';
import 'shop_section.dart';

/// Editorial collections rail — secondary browse path on Shop.
class ShopCollectionsRail extends StatelessWidget {
  const ShopCollectionsRail({super.key, required this.collections});

  final List<CatalogRef> collections;

  @override
  Widget build(BuildContext context) {
    if (collections.isEmpty) return const SizedBox.shrink();

    return ShopSectionInset(
      bottom: 36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShopSectionHeader(
            title: 'Collections',
            subtitle: 'Curated edits from our atelier.',
            actionLabel: 'See all',
            onAction: () => context.push(AppRoutes.shopSearch),
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: AppSpacing.x3l * 2 + AppSpacing.xl,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: collections.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
              itemBuilder: (context, index) {
                final item = collections[index];
                return CollectionCard(
                  collection: item,
                  onTap: () {
                    if (item.id.startsWith('sample-')) {
                      context.push(AppRoutes.shopSearch);
                      return;
                    }
                    context.push(
                      AppRoutes.shopCollection.replaceFirst(
                        ':collectionId',
                        item.id,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
