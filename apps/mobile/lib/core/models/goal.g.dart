// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoalTargetProduct _$GoalTargetProductFromJson(Map<String, dynamic> json) =>
    _GoalTargetProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      primaryImage: json['primary_image'] as String?,
    );

Map<String, dynamic> _$GoalTargetProductToJson(_GoalTargetProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'primary_image': instance.primaryImage,
    };

_Goal _$GoalFromJson(Map<String, dynamic> json) => _Goal(
  id: json['id'] as String,
  name: json['name'] as String,
  schemeType: json['scheme_type'] as String? ?? 'aura',
  goalType: json['goal_type'] as String,
  status: json['status'] as String,
  statusLabel: json['status_label'] as String,
  targetProduct: json['target_product'] == null
      ? null
      : GoalTargetProduct.fromJson(
          json['target_product'] as Map<String, dynamic>,
        ),
  targetAmountPaise: (json['target_amount_paise'] as num?)?.toInt(),
  targetAmountDisplay: json['target_amount_display'] as String?,
  targetGrams: json['target_grams'] as String?,
  currentGrams: json['current_grams'] as String,
  currentGramsDisplay: json['current_grams_display'] as String,
  currentValuePaise: (json['current_value_paise'] as num).toInt(),
  currentValueDisplay: json['current_value_display'] as String,
  percentComplete: (json['percent_complete'] as num).toInt(),
  monthlyAmountPaise: (json['monthly_amount_paise'] as num).toInt(),
  monthlyAmountDisplay: json['monthly_amount_display'] as String,
  durationMonths: (json['duration_months'] as num).toInt(),
  startDate: json['start_date'] as String,
  nextContributionDate: json['next_contribution_date'] as String,
  estimatedCompletionDate: json['estimated_completion_date'] as String,
  monthsRemaining: (json['months_remaining'] as num).toInt(),
  bonusEligible: json['bonus_eligible'] as bool? ?? true,
  installmentsCompleted: (json['installments_completed'] as num?)?.toInt(),
  installmentsTotal: (json['installments_total'] as num?)?.toInt(),
  maturityDate: json['maturity_date'] as String?,
  redemptionWindowStart: json['redemption_window_start'] as String?,
  redemptionWindowEnd: json['redemption_window_end'] as String?,
  mcWaiverEligible: json['mc_waiver_eligible'] as bool? ?? false,
  mcWaiverMaxPct: (json['mc_waiver_max_pct'] as num?)?.toInt(),
  mcWaiverWithinRedemptionWindow:
      json['mc_waiver_within_redemption_window'] as bool?,
  mcWaiverActive: json['mc_waiver_active'] as bool? ?? false,
);

Map<String, dynamic> _$GoalToJson(_Goal instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'scheme_type': instance.schemeType,
  'goal_type': instance.goalType,
  'status': instance.status,
  'status_label': instance.statusLabel,
  'target_product': instance.targetProduct,
  'target_amount_paise': instance.targetAmountPaise,
  'target_amount_display': instance.targetAmountDisplay,
  'target_grams': instance.targetGrams,
  'current_grams': instance.currentGrams,
  'current_grams_display': instance.currentGramsDisplay,
  'current_value_paise': instance.currentValuePaise,
  'current_value_display': instance.currentValueDisplay,
  'percent_complete': instance.percentComplete,
  'monthly_amount_paise': instance.monthlyAmountPaise,
  'monthly_amount_display': instance.monthlyAmountDisplay,
  'duration_months': instance.durationMonths,
  'start_date': instance.startDate,
  'next_contribution_date': instance.nextContributionDate,
  'estimated_completion_date': instance.estimatedCompletionDate,
  'months_remaining': instance.monthsRemaining,
  'bonus_eligible': instance.bonusEligible,
  'installments_completed': instance.installmentsCompleted,
  'installments_total': instance.installmentsTotal,
  'maturity_date': instance.maturityDate,
  'redemption_window_start': instance.redemptionWindowStart,
  'redemption_window_end': instance.redemptionWindowEnd,
  'mc_waiver_eligible': instance.mcWaiverEligible,
  'mc_waiver_max_pct': instance.mcWaiverMaxPct,
  'mc_waiver_within_redemption_window': instance.mcWaiverWithinRedemptionWindow,
  'mc_waiver_active': instance.mcWaiverActive,
};

_GoalsSummary _$GoalsSummaryFromJson(Map<String, dynamic> json) =>
    _GoalsSummary(
      totalGrams: json['total_grams'] as String,
      totalGramsDisplay: json['total_grams_display'] as String,
      totalValuePaise: (json['total_value_paise'] as num).toInt(),
      totalValueDisplay: json['total_value_display'] as String,
      activeCount: (json['active_count'] as num).toInt(),
      monthlyTotalPaise: (json['monthly_total_paise'] as num).toInt(),
      monthlyTotalDisplay: json['monthly_total_display'] as String,
    );

Map<String, dynamic> _$GoalsSummaryToJson(_GoalsSummary instance) =>
    <String, dynamic>{
      'total_grams': instance.totalGrams,
      'total_grams_display': instance.totalGramsDisplay,
      'total_value_paise': instance.totalValuePaise,
      'total_value_display': instance.totalValueDisplay,
      'active_count': instance.activeCount,
      'monthly_total_paise': instance.monthlyTotalPaise,
      'monthly_total_display': instance.monthlyTotalDisplay,
    };

_GoalsListResponse _$GoalsListResponseFromJson(Map<String, dynamic> json) =>
    _GoalsListResponse(
      goals: (json['goals'] as List<dynamic>)
          .map((e) => Goal.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: GoalsSummary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoalsListResponseToJson(_GoalsListResponse instance) =>
    <String, dynamic>{'goals': instance.goals, 'summary': instance.summary};

_CreateGoalResponse _$CreateGoalResponseFromJson(Map<String, dynamic> json) =>
    _CreateGoalResponse(
      goal: Goal.fromJson(json['goal'] as Map<String, dynamic>),
      firstContributionScheduled:
          json['first_contribution_scheduled'] as String,
    );

Map<String, dynamic> _$CreateGoalResponseToJson(_CreateGoalResponse instance) =>
    <String, dynamic>{
      'goal': instance.goal,
      'first_contribution_scheduled': instance.firstContributionScheduled,
    };

_GoalDetailResponse _$GoalDetailResponseFromJson(Map<String, dynamic> json) =>
    _GoalDetailResponse(
      goal: Goal.fromJson(json['goal'] as Map<String, dynamic>),
      contributions: (json['contributions'] as List<dynamic>)
          .map((e) => GoalContribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      redeemableProducts: (json['redeemable_products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoalDetailResponseToJson(_GoalDetailResponse instance) =>
    <String, dynamic>{
      'goal': instance.goal,
      'contributions': instance.contributions,
      'redeemable_products': instance.redeemableProducts,
    };

_GoalContribution _$GoalContributionFromJson(Map<String, dynamic> json) =>
    _GoalContribution(
      id: json['id'] as String,
      amountPaise: (json['amount_paise'] as num).toInt(),
      gramsCredited: json['grams_credited'] as String?,
      type: json['type'] as String,
      status: json['status'] as String,
      contributionMonth: json['contribution_month'] as String,
      completedAt: json['completed_at'] as String?,
    );

Map<String, dynamic> _$GoalContributionToJson(_GoalContribution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount_paise': instance.amountPaise,
      'grams_credited': instance.gramsCredited,
      'type': instance.type,
      'status': instance.status,
      'contribution_month': instance.contributionMonth,
      'completed_at': instance.completedAt,
    };

_ContributeResponse _$ContributeResponseFromJson(Map<String, dynamic> json) =>
    _ContributeResponse(
      contribution: ContributionResult.fromJson(
        json['contribution'] as Map<String, dynamic>,
      ),
      paymentRequired: json['payment_required'] as bool,
      paymentSessionId: json['payment_session_id'] as String?,
      razorpayOrderId: json['razorpay_order_id'] as String?,
      razorpayKeyId: json['razorpay_key_id'] as String?,
    );

Map<String, dynamic> _$ContributeResponseToJson(_ContributeResponse instance) =>
    <String, dynamic>{
      'contribution': instance.contribution,
      'payment_required': instance.paymentRequired,
      'payment_session_id': instance.paymentSessionId,
      'razorpay_order_id': instance.razorpayOrderId,
      'razorpay_key_id': instance.razorpayKeyId,
    };

_ContributionResult _$ContributionResultFromJson(Map<String, dynamic> json) =>
    _ContributionResult(
      id: json['id'] as String,
      status: json['status'] as String,
      amountPaise: (json['amount_paise'] as num).toInt(),
      amountDisplay: json['amount_display'] as String,
    );

Map<String, dynamic> _$ContributionResultToJson(_ContributionResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'amount_paise': instance.amountPaise,
      'amount_display': instance.amountDisplay,
    };

_CancelGoalResponse _$CancelGoalResponseFromJson(Map<String, dynamic> json) =>
    _CancelGoalResponse(
      success: json['success'] as bool,
      goldRetainedGrams: json['gold_retained_grams'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CancelGoalResponseToJson(_CancelGoalResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'gold_retained_grams': instance.goldRetainedGrams,
      'message': instance.message,
    };
