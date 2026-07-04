import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/store_location.dart';
import '../../../core/services/api_service.dart';

part 'stores_provider.g.dart';

class StoresRepository {
  const StoresRepository(this._apiService);

  final ApiService _apiService;

  Future<StoresListResponse> list({
    String? q,
    double? lat,
    double? lng,
    int? radiusKm,
  }) async {
    try {
      final response = await _apiService.client.get<Map<String, dynamic>>(
        '/stores',
        queryParameters: {
          if (q != null && q.isNotEmpty) 'q': q,
          'lat': ?lat,
          'lng': ?lng,
          'radius_km': ?radiusKm,
        },
      );
      return StoresListResponse.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<StoreDetailResponse> detail(String storeId) async {
    try {
      final response = await _apiService.client.get<Map<String, dynamic>>(
        '/stores/$storeId',
      );
      return StoreDetailResponse.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }
}

@riverpod
StoresRepository storesRepository(Ref ref) {
  return StoresRepository(ref.watch(apiServiceProvider));
}

@riverpod
Future<StoresListResponse> storesList(
  Ref ref, {
  String? q,
  double? lat,
  double? lng,
  int? radiusKm,
}) async {
  return ref
      .watch(storesRepositoryProvider)
      .list(q: q, lat: lat, lng: lng, radiusKm: radiusKm);
}

@riverpod
Future<StoreDetailResponse> storeDetail(Ref ref, String storeId) async {
  return ref.watch(storesRepositoryProvider).detail(storeId);
}
