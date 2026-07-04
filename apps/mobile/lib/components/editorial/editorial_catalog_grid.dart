import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/models/product.dart';
import '../cards/product_card.dart';

/// Two-column catalogue grid with 12px gaps and 16px horizontal inset.
class EditorialCatalogGrid extends StatelessWidget {
  const EditorialCatalogGrid({
    super.key,
    required this.products,
    this.onProductTap,
  });

  final List<Product> products;
  final void Function(Product product)? onProductTap;

  static const double _gap = 12;
  static const double _horizontalPadding = AppSpacing.md;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: _gap,
          mainAxisSpacing: _gap,
          childAspectRatio: 0.52,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            onTap: onProductTap != null ? () => onProductTap!(product) : null,
          );
        },
      ),
    );
  }
}

/// Horizontal category filter pills. Square corners, hairline border.
class CategoryPillRow extends StatelessWidget {
  const CategoryPillRow({
    super.key,
    required this.labels,
    this.activeIndex = 0,
    this.onSelected,
  });

  final List<String> labels;
  final int activeIndex;
  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++) ...[
            if (i > 0) const SizedBox(width: 6),
            GestureDetector(
              onTap: onSelected != null ? () => onSelected!(i) : null,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: i == activeIndex
                      ? AppColors.textPrimary
                      : Colors.transparent,
                  border: Border.all(
                    color: i == activeIndex
                        ? AppColors.textPrimary
                        : AppColors.border,
                    width: 0.5,
                  ),
                ),
                child: Text(
                  labels[i].toUpperCase(),
                  style: AppTypography.uiMicro.copyWith(
                    fontSize: 9,
                    fontWeight: FontWeight.w300,
                    color: i == activeIndex
                        ? AppColors.paper
                        : AppColors.textMuted,
                    letterSpacing: 9 * 0.15,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Underline filter tabs for catalogue screens.
class CatalogFilterTabs extends StatelessWidget {
  const CatalogFilterTabs({
    super.key,
    required this.tabs,
    required this.activeIndex,
    this.onSelected,
  });

  final List<String> tabs;
  final int activeIndex;
  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            0,
          ),
          child: Row(
            children: [
              for (var i = 0; i < tabs.length; i++) ...[
                if (i > 0) const SizedBox(width: AppSpacing.lg),
                GestureDetector(
                  onTap: onSelected != null ? () => onSelected!(i) : null,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tabs[i].toUpperCase(),
                          style: AppTypography.uiMicro.copyWith(
                            color: i == activeIndex
                                ? AppColors.textPrimary
                                : AppColors.textMuted,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Container(
                          height: i == activeIndex ? 1 : 0,
                          width: tabs[i].length * 7.0 + 12,
                          color: AppColors.textPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const Divider(height: 0.5, thickness: 0.5, color: AppColors.border),
      ],
    );
  }
}
