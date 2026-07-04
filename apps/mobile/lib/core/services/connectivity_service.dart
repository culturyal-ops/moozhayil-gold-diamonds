import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_service.g.dart';

/// Emits the current list of [ConnectivityResult] whenever the device's
/// network state changes.
///
/// Rule 13 (09-cursor-rules.md): Offline state is handled at the root app
/// level via this provider. Individual screens must NOT manage offline state.
@riverpod
Stream<List<ConnectivityResult>> connectivityStream(Ref ref) {
  return Connectivity().onConnectivityChanged;
}

/// Returns `true` when the device has no network connection.
///
/// Watches [connectivityStreamProvider] so it automatically rebuilds when
/// connectivity changes. Consumers should watch this provider to conditionally
/// show [OfflineBanner].
@riverpod
bool isOffline(Ref ref) {
  final result = ref.watch(connectivityStreamProvider);
  return result.when(
    data: (results) =>
        results.isEmpty || results.every((r) => r == ConnectivityResult.none),
    loading: () => false,
    error: (_, _) => false,
  );
}
