import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/product.dart';
import '../../../core/utils/sample_catalog.dart';
import 'products_provider.dart';

enum CatalogBrowseKind { category, collection, occasion }

typedef CatalogBrowseKey = ({CatalogBrowseKind kind, String id});

CatalogRef? _findById(List<CatalogRef> refs, String id) {
  for (final ref in refs) {
    if (ref.id == id) return ref;
  }
  return null;
}

List<CatalogRef> _sampleCategories() {
  final seen = <String>{};
  final refs = <CatalogRef>[];
  for (final product in SampleCatalog.products) {
    final category = product.category;
    if (category == null || seen.contains(category.id)) continue;
    seen.add(category.id);
    refs.add(category);
  }
  return refs;
}

/// Resolves a catalogue ref name for browse screens and shell titles.
final catalogBrowseRefProvider =
    FutureProvider.family<CatalogRef?, CatalogBrowseKey>((ref, key) async {
      switch (key.kind) {
        case CatalogBrowseKind.category:
          final live = await ref.watch(categoriesProvider.future);
          return _findById(live, key.id) ??
              _findById(_sampleCategories(), key.id);
        case CatalogBrowseKind.collection:
          final live = await ref.watch(featuredCollectionsProvider.future);
          return _findById(live, key.id) ??
              _findById(SampleCatalog.collections, key.id);
        case CatalogBrowseKind.occasion:
          final live = await ref.watch(occasionsProvider.future);
          return _findById(live, key.id) ??
              _findById(SampleCatalog.occasions, key.id);
      }
    });

String catalogBrowseEyebrow(CatalogBrowseKind kind) => switch (kind) {
  CatalogBrowseKind.category => 'Category',
  CatalogBrowseKind.collection => 'Collection',
  CatalogBrowseKind.occasion => 'Occasion',
};
