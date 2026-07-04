import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/user.dart';
import '../../../core/services/auth_service.dart';
import '../../auth/providers/auth_provider.dart';

part 'onboarding_provider.freezed.dart';
part 'onboarding_provider.g.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(<String>[]) List<String> intents,
    @Default('') String name,
    @Default(false) bool intentSaved,
    @Default(false) bool nameSaved,
  }) = _OnboardingState;
}

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  Future<OnboardingState> build() async {
    final authState = await ref.watch(authControllerProvider.future);
    final user = authState.user;
    return OnboardingState(
      intents: user?.intentTags ?? const <String>[],
      name: user?.name ?? '',
      intentSaved: (user?.intentTags.isNotEmpty ?? false),
      nameSaved: (user?.name?.isNotEmpty ?? false),
    );
  }

  void toggleIntent(String intent) {
    final current = state.value ?? const OnboardingState();
    final intents = current.intents.contains(intent)
        ? current.intents
              .where((item) => item != intent)
              .toList(growable: false)
        : [...current.intents, intent];
    state = AsyncData(current.copyWith(intents: intents, intentSaved: false));
  }

  void setName(String name) {
    final current = state.value ?? const OnboardingState();
    state = AsyncData(current.copyWith(name: name, nameSaved: false));
  }

  Future<void> saveIntents() async {
    final current = state.value ?? const OnboardingState();
    state = const AsyncLoading<OnboardingState>();
    state = await AsyncValue.guard(() async {
      final saved = await ref
          .read(authServiceProvider)
          .saveIntent(current.intents);
      return current.copyWith(intents: saved, intentSaved: true);
    });
  }

  Future<User> saveName() async {
    final current = state.value ?? const OnboardingState();
    state = const AsyncLoading<OnboardingState>();
    final result = await AsyncValue.guard(() async {
      final user = await ref
          .read(authServiceProvider)
          .updateMe(
            name: current.name.trim().isEmpty ? null : current.name.trim(),
          );
      ref.invalidate(authControllerProvider);
      return current.copyWith(name: user.name ?? '', nameSaved: true);
    });
    state = result;
    final authState = await ref.read(authControllerProvider.future);
    return authState.user!;
  }
}
