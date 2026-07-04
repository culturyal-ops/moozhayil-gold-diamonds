// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aura_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuraInsightResponse _$AuraInsightResponseFromJson(Map<String, dynamic> json) =>
    _AuraInsightResponse(
      insightText: json['insight_text'] as String,
      insightType: json['insight_type'] as String,
      linkRoute: json['link_route'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AuraInsightResponseToJson(
  _AuraInsightResponse instance,
) => <String, dynamic>{
  'insight_text': instance.insightText,
  'insight_type': instance.insightType,
  'link_route': instance.linkRoute,
  'data': instance.data,
};

_AuraPlanDetails _$AuraPlanDetailsFromJson(Map<String, dynamic> json) =>
    _AuraPlanDetails(
      occasion: json['occasion'] as String,
      targetDate: json['target_date'] as String,
      budgetDisplay: json['budget_display'] as String,
      suggestedMonthlyDisplay: json['suggested_monthly_display'] as String,
      durationMonths: (json['duration_months'] as num).toInt(),
      rationale: json['rationale'] as String,
    );

Map<String, dynamic> _$AuraPlanDetailsToJson(_AuraPlanDetails instance) =>
    <String, dynamic>{
      'occasion': instance.occasion,
      'target_date': instance.targetDate,
      'budget_display': instance.budgetDisplay,
      'suggested_monthly_display': instance.suggestedMonthlyDisplay,
      'duration_months': instance.durationMonths,
      'rationale': instance.rationale,
    };

_AuraPlanResponse _$AuraPlanResponseFromJson(Map<String, dynamic> json) =>
    _AuraPlanResponse(
      plan: AuraPlanDetails.fromJson(json['plan'] as Map<String, dynamic>),
      recommendedProducts: (json['recommended_products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      contextSummary: json['context_summary'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AuraPlanResponseToJson(_AuraPlanResponse instance) =>
    <String, dynamic>{
      'plan': instance.plan,
      'recommended_products': instance.recommendedProducts,
      'context_summary': instance.contextSummary,
    };

_AuraDiscoverFilters _$AuraDiscoverFiltersFromJson(Map<String, dynamic> json) =>
    _AuraDiscoverFilters(
      inStockOnly: json['in_stock_only'] as bool,
      budgetPaise: (json['budget_paise'] as num).toInt(),
      budgetCeilingPaise: (json['budget_ceiling_paise'] as num).toInt(),
    );

Map<String, dynamic> _$AuraDiscoverFiltersToJson(
  _AuraDiscoverFilters instance,
) => <String, dynamic>{
  'in_stock_only': instance.inStockOnly,
  'budget_paise': instance.budgetPaise,
  'budget_ceiling_paise': instance.budgetCeilingPaise,
};

_AuraDiscoverResponse _$AuraDiscoverResponseFromJson(
  Map<String, dynamic> json,
) => _AuraDiscoverResponse(
  intro: json['intro'] as String,
  products: (json['products'] as List<dynamic>)
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
  filtersApplied: AuraDiscoverFilters.fromJson(
    json['filters_applied'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AuraDiscoverResponseToJson(
  _AuraDiscoverResponse instance,
) => <String, dynamic>{
  'intro': instance.intro,
  'products': instance.products,
  'filters_applied': instance.filtersApplied,
};

_CreateAuraSessionResponse _$CreateAuraSessionResponseFromJson(
  Map<String, dynamic> json,
) => _CreateAuraSessionResponse(sessionId: json['session_id'] as String);

Map<String, dynamic> _$CreateAuraSessionResponseToJson(
  _CreateAuraSessionResponse instance,
) => <String, dynamic>{'session_id': instance.sessionId};

_AuraAction _$AuraActionFromJson(Map<String, dynamic> json) => _AuraAction(
  type: json['type'] as String,
  ctaLabel: json['cta_label'] as String,
  route: json['route'] as String,
);

Map<String, dynamic> _$AuraActionToJson(_AuraAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'cta_label': instance.ctaLabel,
      'route': instance.route,
    };

_AuraChatResponse _$AuraChatResponseFromJson(Map<String, dynamic> json) =>
    _AuraChatResponse(
      text: json['text'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      action: json['action'] == null
          ? null
          : AuraAction.fromJson(json['action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuraChatResponseToJson(_AuraChatResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'products': instance.products,
      'action': instance.action,
    };

_AuraMessageResponse _$AuraMessageResponseFromJson(Map<String, dynamic> json) =>
    _AuraMessageResponse(
      response: AuraChatResponse.fromJson(
        json['response'] as Map<String, dynamic>,
      ),
      sessionId: json['session_id'] as String,
    );

Map<String, dynamic> _$AuraMessageResponseToJson(
  _AuraMessageResponse instance,
) => <String, dynamic>{
  'response': instance.response,
  'session_id': instance.sessionId,
};
