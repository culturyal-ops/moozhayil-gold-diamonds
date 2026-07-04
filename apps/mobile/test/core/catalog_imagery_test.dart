import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/core/utils/catalog_imagery.dart';

void main() {
  group('CatalogImagery', () {
    test('prefers network URL when valid', () {
      const url = 'https://cdn.example.com/ring.jpg';
      expect(CatalogImagery.resolveProduct(url, 'luna'), url);
    });

    test('falls back to sample or asset imagery when no network URL', () {
      final resolved = CatalogImagery.resolveProduct(null, 'luna');
      expect(resolved, isNotEmpty);
      expect(
        resolved.startsWith('https://') ||
            resolved.startsWith('assets/images/'),
        isTrue,
      );
    });

    test('detects asset paths', () {
      expect(
        CatalogImagery.isAssetPath('assets/images/products/luna.jpg'),
        isTrue,
      );
      expect(CatalogImagery.isAssetPath('https://x.com/a.jpg'), isFalse);
    });
  });
}
