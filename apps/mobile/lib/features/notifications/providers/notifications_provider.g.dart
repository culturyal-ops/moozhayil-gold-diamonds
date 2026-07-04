// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationsRepository)
const notificationsRepositoryProvider = NotificationsRepositoryProvider._();

final class NotificationsRepositoryProvider
    extends
        $FunctionalProvider<
          NotificationsRepository,
          NotificationsRepository,
          NotificationsRepository
        >
    with $Provider<NotificationsRepository> {
  const NotificationsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsRepositoryHash();

  @$internal
  @override
  $ProviderElement<NotificationsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationsRepository create(Ref ref) {
    return notificationsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationsRepository>(value),
    );
  }
}

String _$notificationsRepositoryHash() =>
    r'13938d3cf178051f5cf85f908b8a359d3274c974';

@ProviderFor(notificationsList)
const notificationsListProvider = NotificationsListFamily._();

final class NotificationsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<NotificationsListResponse>,
          NotificationsListResponse,
          FutureOr<NotificationsListResponse>
        >
    with
        $FutureModifier<NotificationsListResponse>,
        $FutureProvider<NotificationsListResponse> {
  const NotificationsListProvider._({
    required NotificationsListFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'notificationsListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$notificationsListHash();

  @override
  String toString() {
    return r'notificationsListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<NotificationsListResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NotificationsListResponse> create(Ref ref) {
    final argument = this.argument as bool;
    return notificationsList(ref, unreadOnly: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationsListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$notificationsListHash() => r'c97fe269f3904fa5e8b91b9368a0b6a174bee799';

final class NotificationsListFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<NotificationsListResponse>, bool> {
  const NotificationsListFamily._()
    : super(
        retry: null,
        name: r'notificationsListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NotificationsListProvider call({bool unreadOnly = false}) =>
      NotificationsListProvider._(argument: unreadOnly, from: this);

  @override
  String toString() => r'notificationsListProvider';
}

@ProviderFor(notificationPreferences)
const notificationPreferencesProvider = NotificationPreferencesProvider._();

final class NotificationPreferencesProvider
    extends
        $FunctionalProvider<
          AsyncValue<NotificationPreferences>,
          NotificationPreferences,
          FutureOr<NotificationPreferences>
        >
    with
        $FutureModifier<NotificationPreferences>,
        $FutureProvider<NotificationPreferences> {
  const NotificationPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationPreferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<NotificationPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NotificationPreferences> create(Ref ref) {
    return notificationPreferences(ref);
  }
}

String _$notificationPreferencesHash() =>
    r'bca77e4771a6222e72ec32d91a9e69269bbf4eb8';

@ProviderFor(NotificationActions)
const notificationActionsProvider = NotificationActionsProvider._();

final class NotificationActionsProvider
    extends $AsyncNotifierProvider<NotificationActions, void> {
  const NotificationActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationActionsHash();

  @$internal
  @override
  NotificationActions create() => NotificationActions();
}

String _$notificationActionsHash() =>
    r'583b0f52215d9c0e71c83e982b5a01cde6383658';

abstract class _$NotificationActions extends $AsyncNotifier<void> {
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
