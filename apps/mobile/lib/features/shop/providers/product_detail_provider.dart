import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/product.dart';
import '../../../core/services/api_service.dart';

part 'product_detail_provider.g.dart';

@riverpod
Future<Product> productDetail(Ref ref, String productId) async {
  try {
    final response = await ref
        .watch(apiServiceProvider)
        .client
        .get<Map<String, dynamic>>('/products/$productId');
    return Product.fromJson(response.data!);
  } on DioException catch (error) {
    throw ApiException.fromDio(error);
  }
}

@riverpod
Future<List<Product>> similarProducts(Ref ref, String productId) async {
  try {
    final response = await ref
        .watch(apiServiceProvider)
        .client
        .get<List<dynamic>>('/products/$productId/similar');
    return response.data!
        .whereType<Map<String, dynamic>>()
        .map(Product.fromJson)
        .toList(growable: false);
  } on DioException catch (error) {
    throw ApiException.fromDio(error);
  }
}
