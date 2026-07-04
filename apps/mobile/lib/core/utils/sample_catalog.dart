import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/dev_preview.dart';
import '../models/product.dart';
import 'sample_imagery.dart';

/// Presentation-only catalog used when the API is offline or empty, so editorial
/// layouts always render with believable jewellery content (NYMIRA / Baavri style).
abstract final class SampleCatalog {
  static const _priceBase = ProductPrice(
    totalPaise: 4875000,
    totalDisplay: '₹48,750',
    goldValuePaise: 4120000,
    goldValueDisplay: '₹41,200',
    makingChargePaise: 550000,
    makingChargeDisplay: '₹5,500',
    gstPaise: 205000,
    gstDisplay: '₹2,050',
    rateUsedPaise: 685000,
    rateDisplay: '₹6,850/g',
    rateUpdatedAt: '2026-06-27',
    priceValidUntil: '2026-06-28',
  );

  static final occasions = <CatalogRef>[
    CatalogRef(
      id: 'sample-wedding',
      name: 'Wedding',
      coverImage: SampleImagery.editorial('occ-wedding', width: 900),
    ),
    CatalogRef(
      id: 'sample-festival',
      name: 'Festival',
      coverImage: SampleImagery.editorial('occ-festival', width: 900),
    ),
    CatalogRef(
      id: 'sample-gifting',
      name: 'Gifting',
      coverImage: SampleImagery.product('occ-gift', width: 900),
    ),
    CatalogRef(
      id: 'sample-everyday',
      name: 'Everyday',
      coverImage: SampleImagery.product('occ-everyday', width: 900),
    ),
  ];

  static final collections = <CatalogRef>[
    CatalogRef(
      id: 'sample-heirloom',
      name: 'Heirloom',
      coverImage: SampleImagery.editorial('col-heirloom', width: 900),
      isFeatured: true,
    ),
    CatalogRef(
      id: 'sample-festive',
      name: 'Festive Edit',
      coverImage: SampleImagery.product('col-festive', width: 900),
      isFeatured: true,
    ),
    CatalogRef(
      id: 'sample-pearl',
      name: 'Whisper of Pearl',
      coverImage: SampleImagery.product('col-pearl', width: 900),
      isFeatured: true,
    ),
  ];

  static final products = <Product>[
    _product(
      id: 'sample-luna-earrings',
      sku: 'MZ-LUNA-01',
      name: 'Luna Stud Earrings',
      category: 'Earrings',
      imageKey: 'luna',
      priceDisplay: '₹28,700',
      paise: 2870000,
      weight: '3.2 g',
    ),
    _product(
      id: 'sample-celeste-necklace',
      sku: 'MZ-CEL-01',
      name: 'Celeste Necklace',
      category: 'Necklaces',
      imageKey: 'celeste',
      priceDisplay: '₹49,700',
      paise: 4970000,
      weight: '8.4 g',
    ),
    _product(
      id: 'sample-tethered-bracelet',
      sku: 'MZ-TBR-01',
      name: 'Tethered Bracelet',
      category: 'Bracelets',
      imageKey: 'tethered',
      priceDisplay: '₹36,200',
      paise: 3620000,
      weight: '6.1 g',
      badges: ['new'],
    ),
    _product(
      id: 'sample-half-round-band',
      sku: 'MZ-HRB-01',
      name: 'Half Round Band',
      category: 'Rings',
      imageKey: 'band',
      priceDisplay: '₹22,400',
      paise: 2240000,
      weight: '4.0 g',
    ),
    _product(
      id: 'sample-temple-set',
      sku: 'MZ-TMP-01',
      name: 'Temple Necklace Set',
      category: 'Necklaces',
      imageKey: 'temple',
      priceDisplay: '₹1,24,500',
      paise: 12450000,
      weight: '24.8 g',
    ),
    _product(
      id: 'sample-ginkgo-pendant',
      sku: 'MZ-GNK-01',
      name: 'Ginkgo Pendant',
      category: 'Necklaces',
      imageKey: 'ginkgo',
      priceDisplay: '₹31,900',
      paise: 3190000,
      weight: '5.6 g',
    ),
  ];

  static Product? productById(String id) {
    for (final item in products) {
      if (item.id == id) return item;
    }
    if (products.isEmpty) return null;
    return products[id.hashCode.abs() % products.length];
  }

  static Product _product({
    required String id,
    required String sku,
    required String name,
    required String category,
    required String imageKey,
    required String priceDisplay,
    required int paise,
    required String weight,
    List<String> badges = const [],
  }) {
    final image = SampleImagery.product(imageKey, width: 800);
    final cat = CatalogRef(id: 'cat-$category', name: category);
    return Product(
      id: id,
      sku: sku,
      name: name,
      category: cat,
      purity: '916',
      purityDisplay: '916 (22K)',
      weightGrams: weight.replaceAll(' g', ''),
      weightDisplay: weight,
      price: _priceBase.copyWith(
        totalPaise: paise,
        totalDisplay: priceDisplay,
      ),
      primaryImage: image,
      images: [
        ProductImage(id: '$id-1', url: image, type: 'primary', isPrimary: true),
        ProductImage(
          id: '$id-2',
          url: SampleImagery.product('$imageKey-2', width: 800),
          type: 'detail',
        ),
      ],
      badges: badges,
      description:
          'Hand-finished in hallmarked gold. A Moozhayil piece designed to be '
          'worn today and passed on tomorrow.',
    );
  }
}

/// Prefer live API data. Sample [fallback] is used only in debug preview builds.
List<T> editorialList<T>(AsyncValue<List<T>> value, List<T> fallback) {
  if (!DevPreview.enabled) {
    return value.when(
      data: (data) => data,
      loading: () => const [],
      error: (_, _) => const [],
    );
  }

  return value.when(
    data: (data) => data.isEmpty ? fallback : data,
    loading: () => fallback,
    error: (_, _) => fallback,
  );
}
