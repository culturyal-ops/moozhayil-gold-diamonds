import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/product.dart';
import '../../vault/widgets/vault_aware_product_card.dart';

/// Shop-standard product grid — matches [ShopCatalogSection] layout.
class ShopProductGrid extends StatelessWidget {
  const ShopProductGrid({super.key, required this.products, this.pieceLabel});

  final List<Product> products;
  final String? pieceLabel;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
        child: Text(
          'No pieces in this selection yet.',
          style: AppTypography.auraVoice.copyWith(color: AppColors.slateMist),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (pieceLabel != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Text(
              pieceLabel!,
              style: AppTypography.uiCaption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.52,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return VaultAwareProductCard(product: products[index]);
          },
        ),
      ],
    );
  }
}
