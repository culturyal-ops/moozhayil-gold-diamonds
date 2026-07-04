// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'vault_item.freezed.dart';
part 'vault_item.g.dart';

@freezed
abstract class VaultAffordability with _$VaultAffordability {
  const factory VaultAffordability({
    @JsonKey(name: 'can_afford_now') required bool canAffordNow,
    @JsonKey(name: 'percent_complete') required int percentComplete,
    @JsonKey(name: 'grams_needed_display') required String gramsNeededDisplay,
    @JsonKey(name: 'suggested_monthly_paise') required int suggestedMonthlyPaise,
    @JsonKey(name: 'suggested_monthly_display')
    required String suggestedMonthlyDisplay,
    @JsonKey(name: 'months_to_afford') required int monthsToAfford,
  }) = _VaultAffordability;

  factory VaultAffordability.fromJson(Map<String, dynamic> json) =>
      _$VaultAffordabilityFromJson(json);
}

@freezed
abstract class GoalSuggestion with _$GoalSuggestion {
  const factory GoalSuggestion({
    @JsonKey(name: 'suggested_monthly_paise') required int suggestedMonthlyPaise,
    @JsonKey(name: 'suggested_monthly_display')
    required String suggestedMonthlyDisplay,
    @JsonKey(name: 'months_to_complete') required int monthsToComplete,
    @JsonKey(name: 'completion_date_display')
    required String completionDateDisplay,
  }) = _GoalSuggestion;

  factory GoalSuggestion.fromJson(Map<String, dynamic> json) =>
      _$GoalSuggestionFromJson(json);
}

@freezed
abstract class VaultItem with _$VaultItem {
  const factory VaultItem({
    required String id,
    required Product product,
    Object? goal,
    required VaultAffordability affordability,
    @JsonKey(name: 'added_at') required String addedAt,
  }) = _VaultItem;

  factory VaultItem.fromJson(Map<String, dynamic> json) =>
      _$VaultItemFromJson(json);
}

@freezed
abstract class VaultListResponse with _$VaultListResponse {
  const factory VaultListResponse({
    required List<VaultItem> items,
    required int count,
  }) = _VaultListResponse;

  factory VaultListResponse.fromJson(Map<String, dynamic> json) =>
      _$VaultListResponseFromJson(json);
}

@freezed
abstract class AddVaultResponse with _$AddVaultResponse {
  const factory AddVaultResponse({
    @JsonKey(name: 'vault_item') required VaultItem vaultItem,
    @JsonKey(name: 'goal_suggestion') required GoalSuggestion goalSuggestion,
  }) = _AddVaultResponse;

  factory AddVaultResponse.fromJson(Map<String, dynamic> json) =>
      _$AddVaultResponseFromJson(json);
}
