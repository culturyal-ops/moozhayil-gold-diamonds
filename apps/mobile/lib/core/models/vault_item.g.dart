// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VaultAffordability _$VaultAffordabilityFromJson(Map<String, dynamic> json) =>
    _VaultAffordability(
      canAffordNow: json['can_afford_now'] as bool,
      percentComplete: (json['percent_complete'] as num).toInt(),
      gramsNeededDisplay: json['grams_needed_display'] as String,
      suggestedMonthlyPaise: (json['suggested_monthly_paise'] as num).toInt(),
      suggestedMonthlyDisplay: json['suggested_monthly_display'] as String,
      monthsToAfford: (json['months_to_afford'] as num).toInt(),
    );

Map<String, dynamic> _$VaultAffordabilityToJson(_VaultAffordability instance) =>
    <String, dynamic>{
      'can_afford_now': instance.canAffordNow,
      'percent_complete': instance.percentComplete,
      'grams_needed_display': instance.gramsNeededDisplay,
      'suggested_monthly_paise': instance.suggestedMonthlyPaise,
      'suggested_monthly_display': instance.suggestedMonthlyDisplay,
      'months_to_afford': instance.monthsToAfford,
    };

_GoalSuggestion _$GoalSuggestionFromJson(Map<String, dynamic> json) =>
    _GoalSuggestion(
      suggestedMonthlyPaise: (json['suggested_monthly_paise'] as num).toInt(),
      suggestedMonthlyDisplay: json['suggested_monthly_display'] as String,
      monthsToComplete: (json['months_to_complete'] as num).toInt(),
      completionDateDisplay: json['completion_date_display'] as String,
    );

Map<String, dynamic> _$GoalSuggestionToJson(_GoalSuggestion instance) =>
    <String, dynamic>{
      'suggested_monthly_paise': instance.suggestedMonthlyPaise,
      'suggested_monthly_display': instance.suggestedMonthlyDisplay,
      'months_to_complete': instance.monthsToComplete,
      'completion_date_display': instance.completionDateDisplay,
    };

_VaultItem _$VaultItemFromJson(Map<String, dynamic> json) => _VaultItem(
  id: json['id'] as String,
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  goal: json['goal'],
  affordability: VaultAffordability.fromJson(
    json['affordability'] as Map<String, dynamic>,
  ),
  addedAt: json['added_at'] as String,
);

Map<String, dynamic> _$VaultItemToJson(_VaultItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'goal': instance.goal,
      'affordability': instance.affordability,
      'added_at': instance.addedAt,
    };

_VaultListResponse _$VaultListResponseFromJson(Map<String, dynamic> json) =>
    _VaultListResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => VaultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$VaultListResponseToJson(_VaultListResponse instance) =>
    <String, dynamic>{'items': instance.items, 'count': instance.count};

_AddVaultResponse _$AddVaultResponseFromJson(Map<String, dynamic> json) =>
    _AddVaultResponse(
      vaultItem: VaultItem.fromJson(json['vault_item'] as Map<String, dynamic>),
      goalSuggestion: GoalSuggestion.fromJson(
        json['goal_suggestion'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$AddVaultResponseToJson(_AddVaultResponse instance) =>
    <String, dynamic>{
      'vault_item': instance.vaultItem,
      'goal_suggestion': instance.goalSuggestion,
    };
