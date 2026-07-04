/// Parsed Shop tab sub-route for shell chrome (back affordance, titles).
enum ShopBrowseKind { search, category, collection, occasion, product }

class ShopBrowseRoute {
  const ShopBrowseRoute({required this.kind, this.resourceId});

  final ShopBrowseKind kind;
  final String? resourceId;

  /// Returns a sub-route when [path] is below `/shop`; `null` on the Shop root.
  static ShopBrowseRoute? tryParse(String path) {
    var normalized = path;
    if (normalized.endsWith('/') && normalized.length > 1) {
      normalized = normalized.substring(0, normalized.length - 1);
    }
    if (normalized == '/shop') return null;
    if (!normalized.startsWith('/shop/')) return null;

    final rest = normalized.substring('/shop/'.length);
    if (rest == 'search') {
      return const ShopBrowseRoute(kind: ShopBrowseKind.search);
    }
    if (rest.startsWith('category/')) {
      return ShopBrowseRoute(
        kind: ShopBrowseKind.category,
        resourceId: rest.split('/').last,
      );
    }
    if (rest.startsWith('collection/')) {
      return ShopBrowseRoute(
        kind: ShopBrowseKind.collection,
        resourceId: rest.split('/').last,
      );
    }
    if (rest.startsWith('occasion/')) {
      return ShopBrowseRoute(
        kind: ShopBrowseKind.occasion,
        resourceId: rest.split('/').last,
      );
    }
    if (rest.startsWith('product/')) {
      return ShopBrowseRoute(
        kind: ShopBrowseKind.product,
        resourceId: rest.split('/').last,
      );
    }
    return null;
  }

  String get fallbackTitle => switch (kind) {
    ShopBrowseKind.search => 'Search',
    ShopBrowseKind.category => 'Category',
    ShopBrowseKind.collection => 'Collection',
    ShopBrowseKind.occasion => 'Occasion',
    ShopBrowseKind.product => 'Piece',
  };

  bool get hidesBottomNav => true;
}
