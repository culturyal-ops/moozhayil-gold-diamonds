// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'aura_session.freezed.dart';
part 'aura_session.g.dart';

@freezed
abstract class AuraInsightResponse with _$AuraInsightResponse {
  const factory AuraInsightResponse({
    @JsonKey(name: 'insight_text') required String insightText,
    @JsonKey(name: 'insight_type') required String insightType,
    @JsonKey(name: 'link_route') required String linkRoute,
    Map<String, dynamic>? data,
  }) = _AuraInsightResponse;

  factory AuraInsightResponse.fromJson(Map<String, dynamic> json) =>
      _$AuraInsightResponseFromJson(json);
}

@freezed
abstract class AuraPlanDetails with _$AuraPlanDetails {
  const factory AuraPlanDetails({
    required String occasion,
    @JsonKey(name: 'target_date') required String targetDate,
    @JsonKey(name: 'budget_display') required String budgetDisplay,
    @JsonKey(name: 'suggested_monthly_display')
    required String suggestedMonthlyDisplay,
    @JsonKey(name: 'duration_months') required int durationMonths,
    required String rationale,
  }) = _AuraPlanDetails;

  factory AuraPlanDetails.fromJson(Map<String, dynamic> json) =>
      _$AuraPlanDetailsFromJson(json);
}

@freezed
abstract class AuraPlanResponse with _$AuraPlanResponse {
  const factory AuraPlanResponse({
    required AuraPlanDetails plan,
    @JsonKey(name: 'recommended_products')
    required List<Product> recommendedProducts,
    @JsonKey(name: 'context_summary') Map<String, dynamic>? contextSummary,
  }) = _AuraPlanResponse;

  factory AuraPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$AuraPlanResponseFromJson(json);
}

@freezed
abstract class AuraDiscoverFilters with _$AuraDiscoverFilters {
  const factory AuraDiscoverFilters({
    @JsonKey(name: 'in_stock_only') required bool inStockOnly,
    @JsonKey(name: 'budget_paise') required int budgetPaise,
    @JsonKey(name: 'budget_ceiling_paise') required int budgetCeilingPaise,
  }) = _AuraDiscoverFilters;

  factory AuraDiscoverFilters.fromJson(Map<String, dynamic> json) =>
      _$AuraDiscoverFiltersFromJson(json);
}

@freezed
abstract class AuraDiscoverResponse with _$AuraDiscoverResponse {
  const factory AuraDiscoverResponse({
    required String intro,
    required List<Product> products,
    @JsonKey(name: 'filters_applied')
    required AuraDiscoverFilters filtersApplied,
  }) = _AuraDiscoverResponse;

  factory AuraDiscoverResponse.fromJson(Map<String, dynamic> json) =>
      _$AuraDiscoverResponseFromJson(json);
}

@freezed
abstract class CreateAuraSessionResponse with _$CreateAuraSessionResponse {
  const factory CreateAuraSessionResponse({
    @JsonKey(name: 'session_id') required String sessionId,
  }) = _CreateAuraSessionResponse;

  factory CreateAuraSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAuraSessionResponseFromJson(json);
}

@freezed
abstract class AuraAction with _$AuraAction {
  const factory AuraAction({
    required String type,
    @JsonKey(name: 'cta_label') required String ctaLabel,
    required String route,
  }) = _AuraAction;

  factory AuraAction.fromJson(Map<String, dynamic> json) =>
      _$AuraActionFromJson(json);
}

@freezed
abstract class AuraChatResponse with _$AuraChatResponse {
  const factory AuraChatResponse({
    required String text,
    required List<Product> products,
    AuraAction? action,
  }) = _AuraChatResponse;

  factory AuraChatResponse.fromJson(Map<String, dynamic> json) =>
      _$AuraChatResponseFromJson(json);
}

@freezed
abstract class AuraMessageResponse with _$AuraMessageResponse {
  const factory AuraMessageResponse({
    required AuraChatResponse response,
    @JsonKey(name: 'session_id') required String sessionId,
  }) = _AuraMessageResponse;

  factory AuraMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$AuraMessageResponseFromJson(json);
}

@freezed
abstract class AuraConversationMessage with _$AuraConversationMessage {
  const factory AuraConversationMessage({
    required String role,
    required String content,
    AuraAction? action,
    List<Product>? products,
  }) = _AuraConversationMessage;
}
