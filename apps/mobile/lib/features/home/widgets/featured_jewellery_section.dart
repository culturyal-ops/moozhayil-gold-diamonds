import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/cards/product_card.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/models/product.dart';
import '../../../core/routing/app_routes.dart';
import '../../vault/widgets/vault_aware_product_card.dart';
import 'home_section_inset.dart';

/// Image-led featured / new arrivals product row with Dream Vault hearts.
class FeaturedJewellerySection extends ConsumerWidget {
  const FeaturedJewellerySection({
    super.key,
    required this.products,
    this.title = 'New Arrivals',
    this.eyebrow = 'Featured',
  });

  final List<Product> products;
  final String title;
  final String eyebrow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (products.isEmpty) return const SizedBox.shrink();

    final items = products.take(8).toList();

    return HomeSectionInset(
      top: 8,
      bottom: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSectionHeader(
            eyebrow: eyebrow,
            title: title,
            actionLabel: 'View all',
            onAction: () => context.go(AppRoutes.newArrivals),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: AppSpacing.x3l * 4 + AppSpacing.xl,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) {
                final product = items[index];
                return SizedBox(
                  width: AppSpacing.x3l * 2 + AppSpacing.lg,
                  child: VaultAwareProductCard(
                    product: product,
                    variant: ProductCardVariant.horizontal,
                    onTap: () => context.push(
                      AppRoutes.shopProduct.replaceFirst(
                        ':productId',
                        product.id,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
