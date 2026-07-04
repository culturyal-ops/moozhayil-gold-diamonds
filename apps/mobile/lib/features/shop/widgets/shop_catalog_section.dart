import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/product.dart';
import 'shop_product_grid.dart';
import 'shop_section.dart';

/// Primary shop catalogue — filters + product grid (hero of the Shop tab).
class ShopCatalogSection extends StatefulWidget {
  const ShopCatalogSection({super.key, required this.products});

  final List<Product> products;

  static const filters = ['All', 'Necklaces', 'Earrings', 'Rings', 'Bangles'];

  @override
  State<ShopCatalogSection> createState() => _ShopCatalogSectionState();
}

class _ShopCatalogSectionState extends State<ShopCatalogSection> {
  var _activeFilter = 0;

  List<Product> get _filtered {
    final label = ShopCatalogSection.filters[_activeFilter];
    if (label == 'All') return widget.products;

    final needle = label.toLowerCase();
    return widget.products.where((product) {
      final category = product.category?.name.toLowerCase() ?? '';
      final name = product.name.toLowerCase();
      if (needle == 'bangles') {
        return category.contains('bangle') ||
            category.contains('bracelet') ||
            name.contains('bangle');
      }
      return category.contains(needle.replaceAll('s', '')) ||
          name.contains(needle.replaceAll('s', ''));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return ShopSectionInset(
      bottom: 36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  'Catalogue',
                  style: AppTypography.uiMicro.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.8,
                  ),
                ),
              ),
              Text(
                '${filtered.length} shown',
                style: AppTypography.uiCaption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          _FilterPills(
            labels: ShopCatalogSection.filters,
            activeIndex: _activeFilter,
            onSelected: (index) => setState(() => _activeFilter = index),
          ),
          const SizedBox(height: AppSpacing.md),
          ShopProductGrid(
            products: filtered,
            pieceLabel: filtered.isEmpty ? null : '${filtered.length} shown',
          ),
        ],
      ),
    );
  }
}

class _FilterPills extends StatelessWidget {
  const _FilterPills({
    required this.labels,
    required this.activeIndex,
    required this.onSelected,
  });

  final List<String> labels;
  final int activeIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++) ...[
            if (i > 0) const SizedBox(width: 6),
            GestureDetector(
              onTap: () => onSelected(i),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: i == activeIndex
                      ? AppColors.brandBurgundy
                      : AppColors.bgWhite,
                  border: Border.all(
                    color: i == activeIndex
                        ? AppColors.brandBurgundy
                        : AppColors.border,
                    width: 0.5,
                  ),
                ),
                child: Text(
                  labels[i].toUpperCase(),
                  style: AppTypography.uiMicro.copyWith(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: i == activeIndex
                        ? AppColors.cream
                        : AppColors.textMuted,
                    letterSpacing: 1.4,
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
