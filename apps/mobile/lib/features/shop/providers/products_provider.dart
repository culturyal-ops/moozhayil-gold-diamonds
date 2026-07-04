import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/product.dart';
import '../../../core/services/api_service.dart';

part 'products_provider.g.dart';

class ProductsRepository {
  const ProductsRepository(this._apiService);

  final ApiService _apiService;

  Future<List<Product>> products({
    String? categoryId,
    String? collectionId,
    String? occasionId,
    bool? isFeatured,
  }) async {
    try {
      final response = await _apiService.client.get<Map<String, dynamic>>(
        '/products',
        queryParameters: <String, dynamic>{
          'category_id': ?categoryId,
          'collection_id': ?collectionId,
          'occasion_id': ?occasionId,
          'is_featured': ?isFeatured,
        },
      );
      final data = response.data!['data'] as List<dynamic>;
      return data
          .whereType<Map<String, dynamic>>()
          .map(Product.fromJson)
          .toList(growable: false);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<List<CatalogRef>> categories() async {
    try {
      final response = await _apiService.client.get<Map<String, dynamic>>(
        '/categories',
      );
      return _refs(response.data!['categories']);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<List<CatalogRef>> collections({bool featuredOnly = false}) async {
    try {
      final response = await _apiService.client.get<Map<String, dynamic>>(
        '/collections',
        queryParameters: {'featured_only': featuredOnly},
      );
      return _refs(response.data!['collections']);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<List<CatalogRef>> occasions() async {
    try {
      final response = await _apiService.client.get<Map<String, dynamic>>(
        '/occasions',
      );
      return _refs(response.data!['occasions']);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<List<CmsBanner>> banners({String placement = 'home_hero'}) async {
    try {
      final response = await _apiService.client.get<Map<String, dynamic>>(
        '/banners',
        queryParameters: {'placement': placement},
      );
      final data = response.data!['banners'] as List<dynamic>;
      return data
          .whereType<Map<String, dynamic>>()
          .map(CmsBanner.fromJson)
          .toList(growable: false);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  List<CatalogRef> _refs(Object? raw) {
    final data = raw as List<dynamic>;
    return data
        .whereType<Map<String, dynamic>>()
        .map(CatalogRef.fromJson)
        .toList(growable: false);
  }
}

@riverpod
ProductsRepository productsRepository(Ref ref) {
  return ProductsRepository(ref.watch(apiServiceProvider));
}

@riverpod
Future<List<Product>> products(Ref ref) {
  return ref.watch(productsRepositoryProvider).products();
}

@riverpod
Future<List<Product>> featuredProducts(Ref ref) {
  return ref.watch(productsRepositoryProvider).products(isFeatured: true);
}

@riverpod
Future<List<Product>> filteredProducts(
  Ref ref, {
  String? categoryId,
  String? collectionId,
  String? occasionId,
}) {
  return ref
      .watch(productsRepositoryProvider)
      .products(
        categoryId: categoryId,
        collectionId: collectionId,
        occasionId: occasionId,
      );
}

@riverpod
Future<List<CatalogRef>> categories(Ref ref) {
  return ref.watch(productsRepositoryProvider).categories();
}

@riverpod
Future<List<CatalogRef>> featuredCollections(Ref ref) {
  return ref.watch(productsRepositoryProvider).collections(featuredOnly: true);
}

@riverpod
Future<List<CatalogRef>> occasions(Ref ref) {
  return ref.watch(productsRepositoryProvider).occasions();
}

@riverpod
Future<List<CmsBanner>> homeBanners(Ref ref) {
  return ref.watch(productsRepositoryProvider).banners();
}

@riverpod
Future<List<CmsBanner>> cmsBanners(Ref ref, String placement) {
  return ref.watch(productsRepositoryProvider).banners(placement: placement);
}
