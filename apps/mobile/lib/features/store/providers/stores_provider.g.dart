// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storesRepository)
const storesRepositoryProvider = StoresRepositoryProvider._();

final class StoresRepositoryProvider
    extends
        $FunctionalProvider<
          StoresRepository,
          StoresRepository,
          StoresRepository
        >
    with $Provider<StoresRepository> {
  const StoresRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storesRepositoryHash();

  @$internal
  @override
  $ProviderElement<StoresRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StoresRepository create(Ref ref) {
    return storesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoresRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoresRepository>(value),
    );
  }
}

String _$storesRepositoryHash() => r'9cec5c5352b652b49ff3b65cb48cb3f118d31cd8';

@ProviderFor(storesList)
const storesListProvider = StoresListFamily._();

final class StoresListProvider
    extends
        $FunctionalProvider<
          AsyncValue<StoresListResponse>,
          StoresListResponse,
          FutureOr<StoresListResponse>
        >
    with
        $FutureModifier<StoresListResponse>,
        $FutureProvider<StoresListResponse> {
  const StoresListProvider._({
    required StoresListFamily super.from,
    required ({String? q, double? lat, double? lng, int? radiusKm})
    super.argument,
  }) : super(
         retry: null,
         name: r'storesListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storesListHash();

  @override
  String toString() {
    return r'storesListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<StoresListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StoresListResponse> create(Ref ref) {
    final argument =
        this.argument as ({String? q, double? lat, double? lng, int? radiusKm});
    return storesList(
      ref,
      q: argument.q,
      lat: argument.lat,
      lng: argument.lng,
      radiusKm: argument.radiusKm,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StoresListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storesListHash() => r'9e3d7a558457e3d1649be1d87fe46ecfce769c1c';

final class StoresListFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<StoresListResponse>,
          ({String? q, double? lat, double? lng, int? radiusKm})
        > {
  const StoresListFamily._()
    : super(
        retry: null,
        name: r'storesListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StoresListProvider call({
    String? q,
    double? lat,
    double? lng,
    int? radiusKm,
  }) => StoresListProvider._(
    argument: (q: q, lat: lat, lng: lng, radiusKm: radiusKm),
    from: this,
  );

  @override
  String toString() => r'storesListProvider';
}

@ProviderFor(storeDetail)
const storeDetailProvider = StoreDetailFamily._();

final class StoreDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<StoreDetailResponse>,
          StoreDetailResponse,
          FutureOr<StoreDetailResponse>
        >
    with
        $FutureModifier<StoreDetailResponse>,
        $FutureProvider<StoreDetailResponse> {
  const StoreDetailProvider._({
    required StoreDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'storeDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storeDetailHash();

  @override
  String toString() {
    return r'storeDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<StoreDetailResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StoreDetailResponse> create(Ref ref) {
    final argument = this.argument as String;
    return storeDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StoreDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storeDetailHash() => r'e1b6769737618e794699555bc6b84a9b9b8b49d0';

final class StoreDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<StoreDetailResponse>, String> {
  const StoreDetailFamily._()
    : super(
        retry: null,
        name: r'storeDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StoreDetailProvider call(String storeId) =>
      StoreDetailProvider._(argument: storeId, from: this);

  @override
  String toString() => r'storeDetailProvider';
}
