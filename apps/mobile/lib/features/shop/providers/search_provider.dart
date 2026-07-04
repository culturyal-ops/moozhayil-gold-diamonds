import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/product.dart';
import '../../../core/services/api_service.dart';

part 'search_provider.g.dart';

class SearchResult {
  const SearchResult({
    required this.query,
    required this.products,
    required this.categories,
    required this.collections,
  });

  final String query;
  final List<Product> products;
  final List<CatalogRef> categories;
  final List<CatalogRef> collections;
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String value) {
    state = value;
  }
}

@riverpod
Future<SearchResult> productSearch(Ref ref, String query) async {
  if (query.trim().length < 2) {
    return SearchResult(
      query: query,
      products: const [],
      categories: const [],
      collections: const [],
    );
  }

  try {
    final response = await ref
        .watch(apiServiceProvider)
        .client
        .get<Map<String, dynamic>>(
          '/products/search',
          queryParameters: {'q': query},
        );
    final body = response.data!;
    final results = body['results'] as Map<String, dynamic>;
    return SearchResult(
      query: body['query'] as String,
      products: (results['products'] as List<dynamic>)
          .whereType<Map<String, dynamic>>()
          .map(Product.fromJson)
          .toList(growable: false),
      categories: (results['categories'] as List<dynamic>)
          .whereType<Map<String, dynamic>>()
          .map(CatalogRef.fromJson)
          .toList(growable: false),
      collections: (results['collections'] as List<dynamic>)
          .whereType<Map<String, dynamic>>()
          .map(CatalogRef.fromJson)
          .toList(growable: false),
    );
  } on DioException catch (error) {
    throw ApiException.fromDio(error);
  }
}

@riverpod
class RecentSearches extends _$RecentSearches {
  static const _boxName = 'recent_search_terms';
  static const _termsKey = 'terms';
  static const _maxTerms = 10;

  @override
  Future<List<String>> build() async {
    final box = await Hive.openBox<List<dynamic>>(_boxName);
    final terms = box.get(_termsKey) ?? const <dynamic>[];
    return terms.whereType<String>().toList(growable: false);
  }

  Future<void> add(String query) async {
    final trimmed = query.trim();
    if (trimmed.length < 2) {
      return;
    }

    final current = state.value ?? await future;
    final updated = [
      trimmed,
      ...current.where((term) => term.toLowerCase() != trimmed.toLowerCase()),
    ].take(_maxTerms).toList(growable: false);
    final box = await Hive.openBox<List<dynamic>>(_boxName);
    await box.put(_termsKey, updated);
    state = AsyncData(updated);
  }
}
