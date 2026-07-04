/// Shell chrome for nested tab routes (back affordance, titles, bottom nav).
library;

import '../../golden_wish/models/golden_wish_plan.dart';
import 'shop_browse_route.dart';

export 'shop_browse_route.dart';

class GoldenWishPlanRoute {
  GoldenWishPlanRoute._();

  static bool isPlanDetail(String path) =>
      RegExp(r'^/golden-wish/plans/[^/]+$').hasMatch(normalize(path));

  static String? slugFrom(String path) {
    final normalized = normalize(path);
    final match =
        RegExp(r'^/golden-wish/plans/([^/]+)$').firstMatch(normalized);
    return match?.group(1);
  }

  static String titleForPath(String path) {
    final slug = slugFrom(path);
    if (slug == null) return 'Schemes';
    return goldenWishPlanBySlug(slug)?.title ?? 'Schemes';
  }

  static String normalize(String path) {
    if (path.endsWith('/') && path.length > 1) {
      return path.substring(0, path.length - 1);
    }
    return path;
  }
}

/// Whether the tab shell should hide the bottom nav for this location.
bool shellHidesBottomNav(String path) {
  final normalized = GoldenWishPlanRoute.normalize(path);
  if (GoldenWishPlanRoute.isPlanDetail(normalized)) return true;
  return ShopBrowseRoute.tryParse(normalized)?.hidesBottomNav ?? false;
}

/// True when a nested route provides its own full-screen chrome (detail/minimal).
bool shellUsesSubRouteAppBar(String path) {
  final normalized = GoldenWishPlanRoute.normalize(path);
  if (GoldenWishPlanRoute.isPlanDetail(normalized)) return true;
  return ShopBrowseRoute.tryParse(normalized) != null;
}

bool shellUsesMinimalAppBar(String path) {
  final browse = ShopBrowseRoute.tryParse(
    GoldenWishPlanRoute.normalize(path),
  );
  return browse?.kind == ShopBrowseKind.product;
}

String shellDetailTitle(String path) {
  final normalized = GoldenWishPlanRoute.normalize(path);
  if (GoldenWishPlanRoute.isPlanDetail(normalized)) {
    return GoldenWishPlanRoute.titleForPath(normalized);
  }
  final browse = ShopBrowseRoute.tryParse(normalized);
  if (browse == null) return '';
  return browse.fallbackTitle;
}
