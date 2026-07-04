// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productsRepository)
const productsRepositoryProvider = ProductsRepositoryProvider._();

final class ProductsRepositoryProvider
    extends
        $FunctionalProvider<
          ProductsRepository,
          ProductsRepository,
          ProductsRepository
        >
    with $Provider<ProductsRepository> {
  const ProductsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductsRepository create(Ref ref) {
    return productsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsRepository>(value),
    );
  }
}

String _$productsRepositoryHash() =>
    r'622db6fbd3917fc73d8527a7015f92da169c559b';

@ProviderFor(products)
const productsProvider = ProductsProvider._();

final class ProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  const ProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return products(ref);
  }
}

String _$productsHash() => r'6dc28e30b840d956efc16bcd9c2ddafff4a46e45';

@ProviderFor(featuredProducts)
const featuredProductsProvider = FeaturedProductsProvider._();

final class FeaturedProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  const FeaturedProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featuredProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featuredProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return featuredProducts(ref);
  }
}

String _$featuredProductsHash() => r'ab05ff90d00446308c861ea8cecbe1b070d71db4';

@ProviderFor(filteredProducts)
const filteredProductsProvider = FilteredProductsFamily._();

final class FilteredProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  const FilteredProductsProvider._({
    required FilteredProductsFamily super.from,
    required ({String? categoryId, String? collectionId, String? occasionId})
    super.argument,
  }) : super(
         retry: null,
         name: r'filteredProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredProductsHash();

  @override
  String toString() {
    return r'filteredProductsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    final argument =
        this.argument
            as ({String? categoryId, String? collectionId, String? occasionId});
    return filteredProducts(
      ref,
      categoryId: argument.categoryId,
      collectionId: argument.collectionId,
      occasionId: argument.occasionId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredProductsHash() => r'9cf7f7756f42e34aa2f41eae9195e6f0cfc75b8a';

final class FilteredProductsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<Product>>,
          ({String? categoryId, String? collectionId, String? occasionId})
        > {
  const FilteredProductsFamily._()
    : super(
        retry: null,
        name: r'filteredProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredProductsProvider call({
    String? categoryId,
    String? collectionId,
    String? occasionId,
  }) => FilteredProductsProvider._(
    argument: (
      categoryId: categoryId,
      collectionId: collectionId,
      occasionId: occasionId,
    ),
    from: this,
  );

  @override
  String toString() => r'filteredProductsProvider';
}

@ProviderFor(categories)
const categoriesProvider = CategoriesProvider._();

final class CategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CatalogRef>>,
          List<CatalogRef>,
          FutureOr<List<CatalogRef>>
        >
    with $FutureModifier<List<CatalogRef>>, $FutureProvider<List<CatalogRef>> {
  const CategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<CatalogRef>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CatalogRef>> create(Ref ref) {
    return categories(ref);
  }
}

String _$categoriesHash() => r'8a7daa23a36e1fb857a7270c1ba24d588be95788';

@ProviderFor(featuredCollections)
const featuredCollectionsProvider = FeaturedCollectionsProvider._();

final class FeaturedCollectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CatalogRef>>,
          List<CatalogRef>,
          FutureOr<List<CatalogRef>>
        >
    with $FutureModifier<List<CatalogRef>>, $FutureProvider<List<CatalogRef>> {
  const FeaturedCollectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featuredCollectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featuredCollectionsHash();

  @$internal
  @override
  $FutureProviderElement<List<CatalogRef>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CatalogRef>> create(Ref ref) {
    return featuredCollections(ref);
  }
}

String _$featuredCollectionsHash() =>
    r'c800f09c0b54b96974cc670ad8795d45acae1198';

@ProviderFor(occasions)
const occasionsProvider = OccasionsProvider._();

final class OccasionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CatalogRef>>,
          List<CatalogRef>,
          FutureOr<List<CatalogRef>>
        >
    with $FutureModifier<List<CatalogRef>>, $FutureProvider<List<CatalogRef>> {
  const OccasionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'occasionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$occasionsHash();

  @$internal
  @override
  $FutureProviderElement<List<CatalogRef>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CatalogRef>> create(Ref ref) {
    return occasions(ref);
  }
}

String _$occasionsHash() => r'e4f61030a707971e5d04b6523c9f401edbc6c410';

@ProviderFor(homeBanners)
const homeBannersProvider = HomeBannersProvider._();

final class HomeBannersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CmsBanner>>,
          List<CmsBanner>,
          FutureOr<List<CmsBanner>>
        >
    with $FutureModifier<List<CmsBanner>>, $FutureProvider<List<CmsBanner>> {
  const HomeBannersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeBannersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeBannersHash();

  @$internal
  @override
  $FutureProviderElement<List<CmsBanner>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CmsBanner>> create(Ref ref) {
    return homeBanners(ref);
  }
}

String _$homeBannersHash() => r'50133b156aec4398a96bd708db51fc05419a84bb';

@ProviderFor(cmsBanners)
const cmsBannersProvider = CmsBannersFamily._();

final class CmsBannersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CmsBanner>>,
          List<CmsBanner>,
          FutureOr<List<CmsBanner>>
        >
    with $FutureModifier<List<CmsBanner>>, $FutureProvider<List<CmsBanner>> {
  const CmsBannersProvider._({
    required CmsBannersFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cmsBannersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cmsBannersHash();

  @override
  String toString() {
    return r'cmsBannersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CmsBanner>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CmsBanner>> create(Ref ref) {
    final argument = this.argument as String;
    return cmsBanners(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CmsBannersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cmsBannersHash() => r'6262f63884a122e69884b5ab6542a3fd6c659b79';

final class CmsBannersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<CmsBanner>>, String> {
  const CmsBannersFamily._()
    : super(
        retry: null,
        name: r'cmsBannersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CmsBannersProvider call(String placement) =>
      CmsBannersProvider._(argument: placement, from: this);

  @override
  String toString() => r'cmsBannersProvider';
}
