import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/cards/product_card.dart';
import '../../../core/models/product.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/vault_provider.dart';
import 'vault_save_handler.dart';

class VaultAwareProductCard extends ConsumerWidget {
  const VaultAwareProductCard({
    super.key,
    required this.product,
    this.variant = ProductCardVariant.grid,
    this.onTap,
  });

  final Product product;
  final ProductCardVariant variant;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vaultIds = ref.watch(effectiveVaultProductIdsProvider);
    final displayProduct = vaultIds.maybeWhen(
      data: (ids) => productWithVaultState(product, ids),
      orElse: () => product,
    );

    return ProductCard(
      product: displayProduct,
      variant: variant,
      onTap:
          onTap ??
          () => context.push(
            AppRoutes.shopProduct.replaceFirst(':productId', product.id),
          ),
      onVaultTap: () => handleVaultSave(context, ref, product.id),
    );
  }
}
