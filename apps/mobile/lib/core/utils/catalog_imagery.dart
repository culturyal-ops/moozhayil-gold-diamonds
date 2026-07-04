import '../constants/asset_paths.dart';
import 'sample_imagery.dart';

/// Resolves display imagery: network URL → bundled asset → sample fallback.
abstract final class CatalogImagery {
  static bool isAssetPath(String path) =>
      path.startsWith('assets/') && !path.startsWith('http');

  static bool isNetworkUrl(String? url) =>
      url != null &&
      url.isNotEmpty &&
      (url.startsWith('http://') || url.startsWith('https://'));

  /// Product image for cards, PDP, and showcase carousels.
  static String resolveProduct(
    String? networkUrl,
    Object fallbackKey, {
    int width = 800,
  }) {
    if (isNetworkUrl(networkUrl)) return networkUrl!;

    final asset = AssetPaths.product(fallbackKey.toString());
    if (asset != null) return asset;

    return SampleImagery.productOr(networkUrl, fallbackKey, width: width);
  }

  /// Brand campaign imagery.
  static String resolveBrand(
    String? networkUrl,
    Object fallbackKey, {
    int width = 900,
  }) {
    if (isNetworkUrl(networkUrl)) return networkUrl!;

    final asset = AssetPaths.brand(fallbackKey.toString());
    if (asset != null) return asset;

    return SampleImagery.productOr(networkUrl, fallbackKey, width: width);
  }

  /// Editorial / hero imagery.
  static String resolveEditorial(
    String? networkUrl,
    Object fallbackKey, {
    int width = 1200,
  }) {
    if (isNetworkUrl(networkUrl)) return networkUrl!;

    final asset = AssetPaths.showroomImage(fallbackKey.toString());
    if (asset != null) return asset;

    return SampleImagery.editorialOr(networkUrl, fallbackKey, width: width);
  }
}
