/// Curated editorial photography for mock / preview surfaces.
///
/// This is a **presentation-only** helper — it does not touch models, providers,
/// design tokens, or the backend contract. Screens and components fall back to
/// these images when a real CMS / catalog image URL is absent, so the editorial
/// layouts can be evaluated with believable jewellery photography instead of a
/// flat monogram placeholder.
///
/// Selection is deterministic for a given key, so the same product / collection
/// always resolves to the same image across rebuilds (no flicker).
///
/// All identifiers are validated Unsplash photo IDs (jewellery + on-body
/// portraits). Replace with real Moozhayil photography when available.
abstract final class SampleImagery {
  /// On-body / model portraits — for heroes and editorial story bands.
  static const List<String> _editorial = <String>[
    '1620656798579-1984d9e87df7', // gold ring + pendant, black top
    '1611652022419-a9419f74343d', // layered necklaces, white shirt
    '1583292650898-7d22cd27ca6f', // gold cuff stack, yellow sleeve
    '1494790108377-be9c29b29330', // portrait, warm
    '1438761681033-6461ffad8d80', // portrait, soft
  ];

  /// Product macros / still life — for cards, collections and galleries.
  static const List<String> _product = <String>[
    '1601121141461-9d6647bca1ed', // Indian gold necklace set
    '1599643478518-a784e5dc4c8f', // layered gold necklaces
    '1617038220319-276d3cfab638', // gold hoop earrings, minimal
    '1602173574767-37ac01994b2a', // gold chain bracelet on print
    '1573408301185-9146fe634ad0', // diamond bracelet on black
    '1611591437281-460bfbe1220a', // rose-gold bracelet
    '1515562141207-7a88fb7ce338', // pearl necklace in box
    '1605100804763-247f67b3557e', // diamond ring on box
    '1535556116002-6281ff3e9f36', // gold earrings flat-lay
    '1506630448388-4e683c67ddb0', // necklaces hanging
    '1588444650733-d0767b753fc8', // diamond studs
    '1611107683227-e9060eccd846', // gold bangles
    '1606760227091-3dd870d97f1d', // assorted jewellery flat-lay
  ];

  /// A statement on-body image for the primary home hero.
  static String hero({int width = 1400}) => _url(_editorial.first, width);

  /// Editorial portrait, chosen deterministically from [key].
  static String editorial(Object key, {int width = 1200}) =>
      _url(_pick(_editorial, key), width);

  /// Product still-life image, chosen deterministically from [key].
  static String product(Object key, {int width = 800}) =>
      _url(_pick(_product, key), width);

  /// A real URL if present and non-empty, otherwise a sample product image.
  static String productOr(String? url, Object key, {int width = 800}) =>
      (url != null && url.isNotEmpty) ? url : product(key, width: width);

  /// A real URL if present and non-empty, otherwise a sample editorial image.
  static String editorialOr(String? url, Object key, {int width = 1200}) =>
      (url != null && url.isNotEmpty) ? url : editorial(key, width: width);

  static String _pick(List<String> pool, Object key) {
    final index = key.toString().hashCode.abs() % pool.length;
    return pool[index];
  }

  static String _url(String id, int width) =>
      'https://images.unsplash.com/photo-$id'
      '?auto=format&fit=crop&w=$width&q=70';
}
