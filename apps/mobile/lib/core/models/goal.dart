// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
abstract class GoalTargetProduct with _$GoalTargetProduct {
  const factory GoalTargetProduct({
    required String id,
    required String name,
    @JsonKey(name: 'primary_image') String? primaryImage,
  }) = _GoalTargetProduct;

  factory GoalTargetProduct.fromJson(Map<String, dynamic> json) =>
      _$GoalTargetProductFromJson(json);
}

@freezed
abstract class Goal with _$Goal {
  const factory Goal({
    required String id,
    required String name,
    @JsonKey(name: 'scheme_type') @Default('aura') String schemeType,
    @JsonKey(name: 'goal_type') required String goalType,
    required String status,
    @JsonKey(name: 'status_label') required String statusLabel,
    @JsonKey(name: 'target_product') GoalTargetProduct? targetProduct,
    @JsonKey(name: 'target_amount_paise') int? targetAmountPaise,
    @JsonKey(name: 'target_amount_display') String? targetAmountDisplay,
    @JsonKey(name: 'target_grams') String? targetGrams,
    @JsonKey(name: 'current_grams') required String currentGrams,
    @JsonKey(name: 'current_grams_display') required String currentGramsDisplay,
    @JsonKey(name: 'current_value_paise') required int currentValuePaise,
    @JsonKey(name: 'current_value_display') required String currentValueDisplay,
    @JsonKey(name: 'percent_complete') required int percentComplete,
    @JsonKey(name: 'monthly_amount_paise') required int monthlyAmountPaise,
    @JsonKey(name: 'monthly_amount_display')
    required String monthlyAmountDisplay,
    @JsonKey(name: 'duration_months') required int durationMonths,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'next_contribution_date')
    required String nextContributionDate,
    @JsonKey(name: 'estimated_completion_date')
    required String estimatedCompletionDate,
    @JsonKey(name: 'months_remaining') required int monthsRemaining,
    @JsonKey(name: 'bonus_eligible') @Default(true) bool bonusEligible,
    @JsonKey(name: 'installments_completed') int? installmentsCompleted,
    @JsonKey(name: 'installments_total') int? installmentsTotal,
    @JsonKey(name: 'maturity_date') String? maturityDate,
    @JsonKey(name: 'redemption_window_start') String? redemptionWindowStart,
    @JsonKey(name: 'redemption_window_end') String? redemptionWindowEnd,
    @JsonKey(name: 'mc_waiver_eligible') @Default(false) bool mcWaiverEligible,
    @JsonKey(name: 'mc_waiver_max_pct') int? mcWaiverMaxPct,
    @JsonKey(name: 'mc_waiver_within_redemption_window')
    bool? mcWaiverWithinRedemptionWindow,
    @JsonKey(name: 'mc_waiver_active') @Default(false) bool mcWaiverActive,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}

@freezed
abstract class GoalsSummary with _$GoalsSummary {
  const factory GoalsSummary({
    @JsonKey(name: 'total_grams') required String totalGrams,
    @JsonKey(name: 'total_grams_display') required String totalGramsDisplay,
    @JsonKey(name: 'total_value_paise') required int totalValuePaise,
    @JsonKey(name: 'total_value_display') required String totalValueDisplay,
    @JsonKey(name: 'active_count') required int activeCount,
    @JsonKey(name: 'monthly_total_paise') required int monthlyTotalPaise,
    @JsonKey(name: 'monthly_total_display') required String monthlyTotalDisplay,
  }) = _GoalsSummary;

  factory GoalsSummary.fromJson(Map<String, dynamic> json) =>
      _$GoalsSummaryFromJson(json);
}

@freezed
abstract class GoalsListResponse with _$GoalsListResponse {
  const factory GoalsListResponse({
    required List<Goal> goals,
    required GoalsSummary summary,
  }) = _GoalsListResponse;

  factory GoalsListResponse.fromJson(Map<String, dynamic> json) =>
      _$GoalsListResponseFromJson(json);
}

@freezed
abstract class CreateGoalResponse with _$CreateGoalResponse {
  const factory CreateGoalResponse({
    required Goal goal,
    @JsonKey(name: 'first_contribution_scheduled')
    required String firstContributionScheduled,
  }) = _CreateGoalResponse;

  factory CreateGoalResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGoalResponseFromJson(json);
}

@freezed
abstract class GoalDetailResponse with _$GoalDetailResponse {
  const factory GoalDetailResponse({
    required Goal goal,
    required List<GoalContribution> contributions,
    @JsonKey(name: 'redeemable_products')
    required List<Product> redeemableProducts,
  }) = _GoalDetailResponse;

  factory GoalDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GoalDetailResponseFromJson(json);
}

@freezed
abstract class GoalContribution with _$GoalContribution {
  const factory GoalContribution({
    required String id,
    @JsonKey(name: 'amount_paise') required int amountPaise,
    @JsonKey(name: 'grams_credited') String? gramsCredited,
    required String type,
    required String status,
    @JsonKey(name: 'contribution_month') required String contributionMonth,
    @JsonKey(name: 'completed_at') String? completedAt,
  }) = _GoalContribution;

  factory GoalContribution.fromJson(Map<String, dynamic> json) =>
      _$GoalContributionFromJson(json);
}

@freezed
abstract class ContributeResponse with _$ContributeResponse {
  const factory ContributeResponse({
    required ContributionResult contribution,
    @JsonKey(name: 'payment_required') required bool paymentRequired,
    @JsonKey(name: 'payment_session_id') String? paymentSessionId,
    @JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,
    @JsonKey(name: 'razorpay_key_id') String? razorpayKeyId,
  }) = _ContributeResponse;

  factory ContributeResponse.fromJson(Map<String, dynamic> json) =>
      _$ContributeResponseFromJson(json);
}

@freezed
abstract class ContributionResult with _$ContributionResult {
  const factory ContributionResult({
    required String id,
    required String status,
    @JsonKey(name: 'amount_paise') required int amountPaise,
    @JsonKey(name: 'amount_display') required String amountDisplay,
  }) = _ContributionResult;

  factory ContributionResult.fromJson(Map<String, dynamic> json) =>
      _$ContributionResultFromJson(json);
}

@freezed
abstract class CancelGoalResponse with _$CancelGoalResponse {
  const factory CancelGoalResponse({
    required bool success,
    @JsonKey(name: 'gold_retained_grams') required String goldRetainedGrams,
    required String message,
  }) = _CancelGoalResponse;

  factory CancelGoalResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelGoalResponseFromJson(json);
}
