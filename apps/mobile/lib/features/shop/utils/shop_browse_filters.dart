import '../../../core/models/product.dart';

enum ShopSortOption {
  featured('Featured'),
  priceLow('Price · low to high'),
  priceHigh('Price · high to low'),
  name('Name A–Z');

  const ShopSortOption(this.label);
  final String label;
}

enum ShopStockFilter {
  all('All pieces'),
  inStock('In stock only');

  const ShopStockFilter(this.label);
  final String label;
}

enum ShopPurityFilter {
  all('All purities'),
  k22('22KT'),
  k18('18KT'),
  k14('14KT');

  const ShopPurityFilter(this.label);
  final String label;

  bool matches(Product product) {
    if (this == ShopPurityFilter.all) return true;
    final normalized = product.purity.toLowerCase();
    return switch (this) {
      ShopPurityFilter.k22 => normalized.contains('22'),
      ShopPurityFilter.k18 => normalized.contains('18'),
      ShopPurityFilter.k14 => normalized.contains('14'),
      ShopPurityFilter.all => true,
    };
  }
}

List<Product> applyShopBrowseFilters(
  List<Product> products, {
  ShopSortOption sort = ShopSortOption.featured,
  ShopPurityFilter purity = ShopPurityFilter.all,
  ShopStockFilter stock = ShopStockFilter.all,
}) {
  var result = products.where(purity.matches).toList(growable: true);

  if (stock == ShopStockFilter.inStock) {
    result = result.where((p) => p.stockAvailable).toList(growable: false);
  }

  result.sort((a, b) {
    return switch (sort) {
      ShopSortOption.priceLow =>
        a.price.totalPaise.compareTo(b.price.totalPaise),
      ShopSortOption.priceHigh =>
        b.price.totalPaise.compareTo(a.price.totalPaise),
      ShopSortOption.name => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
      ShopSortOption.featured => 0,
    };
  });

  return result;
}
