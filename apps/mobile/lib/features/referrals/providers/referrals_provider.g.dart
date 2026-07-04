// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referrals_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(referralsRepository)
const referralsRepositoryProvider = ReferralsRepositoryProvider._();

final class ReferralsRepositoryProvider
    extends
        $FunctionalProvider<
          ReferralsRepository,
          ReferralsRepository,
          ReferralsRepository
        >
    with $Provider<ReferralsRepository> {
  const ReferralsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referralsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referralsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReferralsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReferralsRepository create(Ref ref) {
    return referralsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReferralsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReferralsRepository>(value),
    );
  }
}

String _$referralsRepositoryHash() =>
    r'99524c092dbd4fddd9205bd164ff86f3e7631600';

@ProviderFor(referralCode)
const referralCodeProvider = ReferralCodeProvider._();

final class ReferralCodeProvider
    extends
        $FunctionalProvider<
          AsyncValue<ReferralCodeResponse>,
          ReferralCodeResponse,
          FutureOr<ReferralCodeResponse>
        >
    with
        $FutureModifier<ReferralCodeResponse>,
        $FutureProvider<ReferralCodeResponse> {
  const ReferralCodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referralCodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referralCodeHash();

  @$internal
  @override
  $FutureProviderElement<ReferralCodeResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ReferralCodeResponse> create(Ref ref) {
    return referralCode(ref);
  }
}

String _$referralCodeHash() => r'44a4d129d2a2161a5166a81db21bf51115c0b431';

@ProviderFor(referralHistory)
const referralHistoryProvider = ReferralHistoryProvider._();

final class ReferralHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ReferralHistoryResponse>,
          ReferralHistoryResponse,
          FutureOr<ReferralHistoryResponse>
        >
    with
        $FutureModifier<ReferralHistoryResponse>,
        $FutureProvider<ReferralHistoryResponse> {
  const ReferralHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referralHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referralHistoryHash();

  @$internal
  @override
  $FutureProviderElement<ReferralHistoryResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ReferralHistoryResponse> create(Ref ref) {
    return referralHistory(ref);
  }
}

String _$referralHistoryHash() => r'686262dc949f35449def24587989bbe751b0eb8e';

@ProviderFor(ReferralActions)
const referralActionsProvider = ReferralActionsProvider._();

final class ReferralActionsProvider
    extends $AsyncNotifierProvider<ReferralActions, void> {
  const ReferralActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referralActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referralActionsHash();

  @$internal
  @override
  ReferralActions create() => ReferralActions();
}

String _$referralActionsHash() => r'd4f1f051cdb0457dc9610a9187781ebd58a36a7e';

abstract class _$ReferralActions extends $AsyncNotifier<void> {
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
