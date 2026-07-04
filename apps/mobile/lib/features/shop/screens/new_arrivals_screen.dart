import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/navigation/top_app_bar.dart';
import '../../../core/animations/section_reveal.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/utils/sample_catalog.dart';
import '../providers/products_provider.dart';
import '../widgets/shop_product_grid.dart';
import '../widgets/shop_section.dart';

/// New arrivals — catalogue-first layout matching the Shop tab.
class NewArrivalsScreen extends ConsumerWidget {
  const NewArrivalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(featuredProductsProvider);
    final products = editorialList(productsAsync, SampleCatalog.products);

    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppTopBar.detail(title: 'New arrivals'),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(featuredProductsProvider);
          await ref.read(featuredProductsProvider.future);
        },
        child: ListView(
          padding: const EdgeInsets.only(bottom: AppSpacing.x3l),
          children: [
            SectionReveal(
              index: 0,
              child: ShopSectionInset(
                top: 12,
                bottom: 8,
                child: ShopSectionHeader(
                  title: 'Just in',
                  subtitle:
                      'Fresh from the atelier — limited runs, timeless craft.',
                ),
              ),
            ),
            SectionReveal(
              index: 1,
              child: ShopSectionInset(
                top: 0,
                bottom: 24,
                child: ShopProductGrid(
                  products: products,
                  pieceLabel: '${products.length} pieces',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
