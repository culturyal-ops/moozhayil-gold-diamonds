/// Canonical local asset paths for Moozhayil brand photography.
///
/// Drop files under [assets/images/] using these keys. When a file is
/// missing, [CatalogImagery] falls back to [SampleImagery].
abstract final class AssetPaths {
  static const String imagesRoot = 'assets/images';

  static const String hero = '$imagesRoot/hero';
  static const String brands = '$imagesRoot/brands';
  static const String products = '$imagesRoot/products';
  static const String showroomDir = '$imagesRoot/showroom';

  /// Known product keys mapped to filenames (add JPG/WebP as assets arrive).
  static const Map<String, String> productFiles = {
    'luna': 'luna.jpg',
    'celeste': 'celeste.jpg',
    'temple': 'temple.jpg',
    'band': 'band.jpg',
    'ginkgo': 'ginkgo.jpg',
    'tethered': 'tethered.jpg',
  };

  static const Map<String, String> brandFiles = {
    'taya': 'taya.jpg',
    'rosette': 'rosette.jpg',
    'pentai': 'pentai.jpg',
    'rare': 'rare.jpg',
  };

  static String? product(String key) {
    final file = productFiles[key.toLowerCase()];
    if (file == null) return null;
    return '$products/$file';
  }

  static String? brand(String key) {
    final file = brandFiles[key.toLowerCase()];
    if (file == null) return null;
    return '$brands/$file';
  }

  static String? showroomImage(String key) =>
      '$showroomDir/${key.toLowerCase()}.jpg';
}
