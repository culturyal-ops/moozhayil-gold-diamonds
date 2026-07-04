// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addressesRepository)
const addressesRepositoryProvider = AddressesRepositoryProvider._();

final class AddressesRepositoryProvider
    extends
        $FunctionalProvider<
          AddressesRepository,
          AddressesRepository,
          AddressesRepository
        >
    with $Provider<AddressesRepository> {
  const AddressesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addressesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addressesRepositoryHash();

  @$internal
  @override
  $ProviderElement<AddressesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddressesRepository create(Ref ref) {
    return addressesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddressesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddressesRepository>(value),
    );
  }
}

String _$addressesRepositoryHash() =>
    r'c6039c5d4d7699763c451ee45ec5875d9be1cbb5';

@ProviderFor(userAddresses)
const userAddressesProvider = UserAddressesProvider._();

final class UserAddressesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserAddress>>,
          List<UserAddress>,
          FutureOr<List<UserAddress>>
        >
    with
        $FutureModifier<List<UserAddress>>,
        $FutureProvider<List<UserAddress>> {
  const UserAddressesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userAddressesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userAddressesHash();

  @$internal
  @override
  $FutureProviderElement<List<UserAddress>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserAddress>> create(Ref ref) {
    return userAddresses(ref);
  }
}

String _$userAddressesHash() => r'41737265eed5ef9edf1ddd0b40ee2341c9b4cc97';

@ProviderFor(AddressActions)
const addressActionsProvider = AddressActionsProvider._();

final class AddressActionsProvider
    extends $AsyncNotifierProvider<AddressActions, void> {
  const AddressActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addressActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addressActionsHash();

  @$internal
  @override
  AddressActions create() => AddressActions();
}

String _$addressActionsHash() => r'9d5478da1375aa2a555fcea356dcf6e062c2f357';

abstract class _$AddressActions extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
