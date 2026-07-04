import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/spacing.dart';
import '../providers/catalog_browse_provider.dart';
import '../utils/shop_browse_route.dart';

/// Detail app bar for nested Shop browse routes (back + resolved title).
class ShopBrowseAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ShopBrowseAppBar({super.key, required this.route});

  final ShopBrowseRoute route;

  @override
  Size get preferredSize => const Size.fromHeight(AppSpacing.topBarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (route.kind == ShopBrowseKind.search) {
      return AppTopBar.detail(title: route.fallbackTitle);
    }

    final catalogKind = switch (route.kind) {
      ShopBrowseKind.category => CatalogBrowseKind.category,
      ShopBrowseKind.collection => CatalogBrowseKind.collection,
      ShopBrowseKind.occasion => CatalogBrowseKind.occasion,
      _ => null,
    };

    if (catalogKind == null || route.resourceId == null) {
      return AppTopBar.detail(title: route.fallbackTitle);
    }

    final catalogRef = ref.watch(
      catalogBrowseRefProvider((kind: catalogKind, id: route.resourceId!)),
    );

    final title = catalogRef.maybeWhen(
      data: (ref) => ref?.name ?? route.fallbackTitle,
      orElse: () => route.fallbackTitle,
    );

    return AppTopBar.detail(title: title);
  }
}
