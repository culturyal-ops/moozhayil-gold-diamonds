import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/feedback/empty_state.dart';
import '../../../components/feedback/error_state.dart';
import '../../../components/feedback/loading_shimmer.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/utils/customer_error_copy.dart';
import '../providers/catalog_browse_provider.dart';
import '../providers/products_provider.dart';
import '../utils/shop_browse_filters.dart';
import '../widgets/shop_browse_controls.dart';
import '../widgets/shop_product_grid.dart';
import '../widgets/shop_section.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({
    super.key,
    this.categoryId,
    this.collectionId,
    this.occasionId,
  });

  final String? categoryId;
  final String? collectionId;
  final String? occasionId;

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  ShopSortOption _sort = ShopSortOption.featured;
  ShopPurityFilter _purity = ShopPurityFilter.all;
  ShopStockFilter _stock = ShopStockFilter.all;

  CatalogBrowseKind? get _browseKind {
    if (widget.categoryId != null) return CatalogBrowseKind.category;
    if (widget.collectionId != null) return CatalogBrowseKind.collection;
    if (widget.occasionId != null) return CatalogBrowseKind.occasion;
    return null;
  }

  String? get _resourceId =>
      widget.categoryId ?? widget.collectionId ?? widget.occasionId;

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(
      filteredProductsProvider(
        categoryId: widget.categoryId,
        collectionId: widget.collectionId,
        occasionId: widget.occasionId,
      ),
    );

    final browseKind = _browseKind;
    final resourceId = _resourceId;
    final catalogRef = browseKind != null && resourceId != null
        ? ref.watch(
            catalogBrowseRefProvider((kind: browseKind, id: resourceId)),
          )
        : null;

    final title = catalogRef?.maybeWhen(
          data: (ref) => ref?.name,
          orElse: () => null,
        ) ??
        switch (browseKind) {
          CatalogBrowseKind.category => 'Category',
          CatalogBrowseKind.collection => 'Collection',
          CatalogBrowseKind.occasion => 'Occasion',
          null => 'Catalogue',
        };

    final eyebrow =
        browseKind != null ? catalogBrowseEyebrow(browseKind) : 'Shop';

    return ColoredBox(
      color: AppColors.paper,
      child: products.when(
        data: (items) {
          final filtered = applyShopBrowseFilters(
            items,
            sort: _sort,
            purity: _purity,
            stock: _stock,
          );

          return ListView(
            padding: const EdgeInsets.only(bottom: AppSpacing.x3l),
            children: [
              ShopSectionInset(
                top: 12,
                bottom: 8,
                child: ShopSectionHeader(
                  title: title,
                  subtitle: eyebrow,
                ),
              ),
              ShopSectionInset(
                top: 0,
                bottom: 12,
                child: ShopBrowseControls(
                  sort: _sort,
                  purity: _purity,
                  stock: _stock,
                  resultCount: filtered.length,
                  onSortChanged: (value) => setState(() => _sort = value),
                  onPurityChanged: (value) => setState(() => _purity = value),
                  onStockChanged: (value) => setState(() => _stock = value),
                ),
              ),
              ShopSectionInset(
                top: 0,
                bottom: 24,
                child: filtered.isEmpty
                    ? EmptyState(
                        icon: Icons.diamond_outlined,
                        headline: 'No pieces match',
                        body:
                            'Try a different filter or browse the full catalogue.',
                        ctaLabel: 'Browse Shop',
                        onCtaTap: () => context.go(AppRoutes.shop),
                      )
                    : ShopProductGrid(
                        products: filtered,
                        pieceLabel: '${filtered.length} pieces',
                      ),
              ),
            ],
          );
        },
        loading: () => ListView(
          padding: const EdgeInsets.all(AppSpacing.homeScreenPadding),
          children: const [
            LoadingShimmer(width: double.infinity, height: 48),
            SizedBox(height: AppSpacing.lg),
            LoadingShimmer(width: double.infinity, height: AppSpacing.x3l * 3),
          ],
        ),
        error: (error, _) => ErrorState(
          body: CustomerErrorCopy.message(error),
          onRetry: () => ref.invalidate(
            filteredProductsProvider(
              categoryId: widget.categoryId,
              collectionId: widget.collectionId,
              occasionId: widget.occasionId,
            ),
          ),
        ),
      ),
    );
  }
}
