// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Emits the current list of [ConnectivityResult] whenever the device's
/// network state changes.
///
/// Rule 13 (09-cursor-rules.md): Offline state is handled at the root app
/// level via this provider. Individual screens must NOT manage offline state.

@ProviderFor(connectivityStream)
const connectivityStreamProvider = ConnectivityStreamProvider._();

/// Emits the current list of [ConnectivityResult] whenever the device's
/// network state changes.
///
/// Rule 13 (09-cursor-rules.md): Offline state is handled at the root app
/// level via this provider. Individual screens must NOT manage offline state.

final class ConnectivityStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ConnectivityResult>>,
          List<ConnectivityResult>,
          Stream<List<ConnectivityResult>>
        >
    with
        $FutureModifier<List<ConnectivityResult>>,
        $StreamProvider<List<ConnectivityResult>> {
  /// Emits the current list of [ConnectivityResult] whenever the device's
  /// network state changes.
  ///
  /// Rule 13 (09-cursor-rules.md): Offline state is handled at the root app
  /// level via this provider. Individual screens must NOT manage offline state.
  const ConnectivityStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<ConnectivityResult>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ConnectivityResult>> create(Ref ref) {
    return connectivityStream(ref);
  }
}

String _$connectivityStreamHash() =>
    r'dbd2c4ce5970f1f97dad2730821bb5ca0b99c327';

/// Returns `true` when the device has no network connection.
///
/// Watches [connectivityStreamProvider] so it automatically rebuilds when
/// connectivity changes. Consumers should watch this provider to conditionally
/// show [OfflineBanner].

@ProviderFor(isOffline)
const isOfflineProvider = IsOfflineProvider._();

/// Returns `true` when the device has no network connection.
///
/// Watches [connectivityStreamProvider] so it automatically rebuilds when
/// connectivity changes. Consumers should watch this provider to conditionally
/// show [OfflineBanner].

final class IsOfflineProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Returns `true` when the device has no network connection.
  ///
  /// Watches [connectivityStreamProvider] so it automatically rebuilds when
  /// connectivity changes. Consumers should watch this provider to conditionally
  /// show [OfflineBanner].
  const IsOfflineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isOfflineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isOfflineHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isOffline(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isOfflineHash() => r'f139b1d6ece17de8fd2904e65e3a59d3d216b4aa';
