// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoalTargetProduct {

 String get id; String get name;@JsonKey(name: 'primary_image') String? get primaryImage;
/// Create a copy of GoalTargetProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalTargetProductCopyWith<GoalTargetProduct> get copyWith => _$GoalTargetProductCopyWithImpl<GoalTargetProduct>(this as GoalTargetProduct, _$identity);

  /// Serializes this GoalTargetProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalTargetProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,primaryImage);

@override
String toString() {
  return 'GoalTargetProduct(id: $id, name: $name, primaryImage: $primaryImage)';
}


}

/// @nodoc
abstract mixin class $GoalTargetProductCopyWith<$Res>  {
  factory $GoalTargetProductCopyWith(GoalTargetProduct value, $Res Function(GoalTargetProduct) _then) = _$GoalTargetProductCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'primary_image') String? primaryImage
});




}
/// @nodoc
class _$GoalTargetProductCopyWithImpl<$Res>
    implements $GoalTargetProductCopyWith<$Res> {
  _$GoalTargetProductCopyWithImpl(this._self, this._then);

  final GoalTargetProduct _self;
  final $Res Function(GoalTargetProduct) _then;

/// Create a copy of GoalTargetProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? primaryImage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalTargetProduct].
extension GoalTargetProductPatterns on GoalTargetProduct {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalTargetProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalTargetProduct() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalTargetProduct value)  $default,){
final _that = this;
switch (_that) {
case _GoalTargetProduct():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalTargetProduct value)?  $default,){
final _that = this;
switch (_that) {
case _GoalTargetProduct() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'primary_image')  String? primaryImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalTargetProduct() when $default != null:
return $default(_that.id,_that.name,_that.primaryImage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'primary_image')  String? primaryImage)  $default,) {final _that = this;
switch (_that) {
case _GoalTargetProduct():
return $default(_that.id,_that.name,_that.primaryImage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'primary_image')  String? primaryImage)?  $default,) {final _that = this;
switch (_that) {
case _GoalTargetProduct() when $default != null:
return $default(_that.id,_that.name,_that.primaryImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalTargetProduct implements GoalTargetProduct {
  const _GoalTargetProduct({required this.id, required this.name, @JsonKey(name: 'primary_image') this.primaryImage});
  factory _GoalTargetProduct.fromJson(Map<String, dynamic> json) => _$GoalTargetProductFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'primary_image') final  String? primaryImage;

/// Create a copy of GoalTargetProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalTargetProductCopyWith<_GoalTargetProduct> get copyWith => __$GoalTargetProductCopyWithImpl<_GoalTargetProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalTargetProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalTargetProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,primaryImage);

@override
String toString() {
  return 'GoalTargetProduct(id: $id, name: $name, primaryImage: $primaryImage)';
}


}

/// @nodoc
abstract mixin class _$GoalTargetProductCopyWith<$Res> implements $GoalTargetProductCopyWith<$Res> {
  factory _$GoalTargetProductCopyWith(_GoalTargetProduct value, $Res Function(_GoalTargetProduct) _then) = __$GoalTargetProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'primary_image') String? primaryImage
});




}
/// @nodoc
class __$GoalTargetProductCopyWithImpl<$Res>
    implements _$GoalTargetProductCopyWith<$Res> {
  __$GoalTargetProductCopyWithImpl(this._self, this._then);

  final _GoalTargetProduct _self;
  final $Res Function(_GoalTargetProduct) _then;

/// Create a copy of GoalTargetProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? primaryImage = freezed,}) {
  return _then(_GoalTargetProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Goal {

 String get id; String get name;@JsonKey(name: 'scheme_type') String get schemeType;@JsonKey(name: 'goal_type') String get goalType; String get status;@JsonKey(name: 'status_label') String get statusLabel;@JsonKey(name: 'target_product') GoalTargetProduct? get targetProduct;@JsonKey(name: 'target_amount_paise') int? get targetAmountPaise;@JsonKey(name: 'target_amount_display') String? get targetAmountDisplay;@JsonKey(name: 'target_grams') String? get targetGrams;@JsonKey(name: 'current_grams') String get currentGrams;@JsonKey(name: 'current_grams_display') String get currentGramsDisplay;@JsonKey(name: 'current_value_paise') int get currentValuePaise;@JsonKey(name: 'current_value_display') String get currentValueDisplay;@JsonKey(name: 'percent_complete') int get percentComplete;@JsonKey(name: 'monthly_amount_paise') int get monthlyAmountPaise;@JsonKey(name: 'monthly_amount_display') String get monthlyAmountDisplay;@JsonKey(name: 'duration_months') int get durationMonths;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'next_contribution_date') String get nextContributionDate;@JsonKey(name: 'estimated_completion_date') String get estimatedCompletionDate;@JsonKey(name: 'months_remaining') int get monthsRemaining;@JsonKey(name: 'bonus_eligible') bool get bonusEligible;@JsonKey(name: 'installments_completed') int? get installmentsCompleted;@JsonKey(name: 'installments_total') int? get installmentsTotal;@JsonKey(name: 'maturity_date') String? get maturityDate;@JsonKey(name: 'redemption_window_start') String? get redemptionWindowStart;@JsonKey(name: 'redemption_window_end') String? get redemptionWindowEnd;@JsonKey(name: 'mc_waiver_eligible') bool get mcWaiverEligible;@JsonKey(name: 'mc_waiver_max_pct') int? get mcWaiverMaxPct;@JsonKey(name: 'mc_waiver_within_redemption_window') bool? get mcWaiverWithinRedemptionWindow;@JsonKey(name: 'mc_waiver_active') bool get mcWaiverActive;
/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalCopyWith<Goal> get copyWith => _$GoalCopyWithImpl<Goal>(this as Goal, _$identity);

  /// Serializes this Goal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Goal&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.schemeType, schemeType) || other.schemeType == schemeType)&&(identical(other.goalType, goalType) || other.goalType == goalType)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.targetProduct, targetProduct) || other.targetProduct == targetProduct)&&(identical(other.targetAmountPaise, targetAmountPaise) || other.targetAmountPaise == targetAmountPaise)&&(identical(other.targetAmountDisplay, targetAmountDisplay) || other.targetAmountDisplay == targetAmountDisplay)&&(identical(other.targetGrams, targetGrams) || other.targetGrams == targetGrams)&&(identical(other.currentGrams, currentGrams) || other.currentGrams == currentGrams)&&(identical(other.currentGramsDisplay, currentGramsDisplay) || other.currentGramsDisplay == currentGramsDisplay)&&(identical(other.currentValuePaise, currentValuePaise) || other.currentValuePaise == currentValuePaise)&&(identical(other.currentValueDisplay, currentValueDisplay) || other.currentValueDisplay == currentValueDisplay)&&(identical(other.percentComplete, percentComplete) || other.percentComplete == percentComplete)&&(identical(other.monthlyAmountPaise, monthlyAmountPaise) || other.monthlyAmountPaise == monthlyAmountPaise)&&(identical(other.monthlyAmountDisplay, monthlyAmountDisplay) || other.monthlyAmountDisplay == monthlyAmountDisplay)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.nextContributionDate, nextContributionDate) || other.nextContributionDate == nextContributionDate)&&(identical(other.estimatedCompletionDate, estimatedCompletionDate) || other.estimatedCompletionDate == estimatedCompletionDate)&&(identical(other.monthsRemaining, monthsRemaining) || other.monthsRemaining == monthsRemaining)&&(identical(other.bonusEligible, bonusEligible) || other.bonusEligible == bonusEligible)&&(identical(other.installmentsCompleted, installmentsCompleted) || other.installmentsCompleted == installmentsCompleted)&&(identical(other.installmentsTotal, installmentsTotal) || other.installmentsTotal == installmentsTotal)&&(identical(other.maturityDate, maturityDate) || other.maturityDate == maturityDate)&&(identical(other.redemptionWindowStart, redemptionWindowStart) || other.redemptionWindowStart == redemptionWindowStart)&&(identical(other.redemptionWindowEnd, redemptionWindowEnd) || other.redemptionWindowEnd == redemptionWindowEnd)&&(identical(other.mcWaiverEligible, mcWaiverEligible) || other.mcWaiverEligible == mcWaiverEligible)&&(identical(other.mcWaiverMaxPct, mcWaiverMaxPct) || other.mcWaiverMaxPct == mcWaiverMaxPct)&&(identical(other.mcWaiverWithinRedemptionWindow, mcWaiverWithinRedemptionWindow) || other.mcWaiverWithinRedemptionWindow == mcWaiverWithinRedemptionWindow)&&(identical(other.mcWaiverActive, mcWaiverActive) || other.mcWaiverActive == mcWaiverActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,schemeType,goalType,status,statusLabel,targetProduct,targetAmountPaise,targetAmountDisplay,targetGrams,currentGrams,currentGramsDisplay,currentValuePaise,currentValueDisplay,percentComplete,monthlyAmountPaise,monthlyAmountDisplay,durationMonths,startDate,nextContributionDate,estimatedCompletionDate,monthsRemaining,bonusEligible,installmentsCompleted,installmentsTotal,maturityDate,redemptionWindowStart,redemptionWindowEnd,mcWaiverEligible,mcWaiverMaxPct,mcWaiverWithinRedemptionWindow,mcWaiverActive]);

@override
String toString() {
  return 'Goal(id: $id, name: $name, schemeType: $schemeType, goalType: $goalType, status: $status, statusLabel: $statusLabel, targetProduct: $targetProduct, targetAmountPaise: $targetAmountPaise, targetAmountDisplay: $targetAmountDisplay, targetGrams: $targetGrams, currentGrams: $currentGrams, currentGramsDisplay: $currentGramsDisplay, currentValuePaise: $currentValuePaise, currentValueDisplay: $currentValueDisplay, percentComplete: $percentComplete, monthlyAmountPaise: $monthlyAmountPaise, monthlyAmountDisplay: $monthlyAmountDisplay, durationMonths: $durationMonths, startDate: $startDate, nextContributionDate: $nextContributionDate, estimatedCompletionDate: $estimatedCompletionDate, monthsRemaining: $monthsRemaining, bonusEligible: $bonusEligible, installmentsCompleted: $installmentsCompleted, installmentsTotal: $installmentsTotal, maturityDate: $maturityDate, redemptionWindowStart: $redemptionWindowStart, redemptionWindowEnd: $redemptionWindowEnd, mcWaiverEligible: $mcWaiverEligible, mcWaiverMaxPct: $mcWaiverMaxPct, mcWaiverWithinRedemptionWindow: $mcWaiverWithinRedemptionWindow, mcWaiverActive: $mcWaiverActive)';
}


}

/// @nodoc
abstract mixin class $GoalCopyWith<$Res>  {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) _then) = _$GoalCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'scheme_type') String schemeType,@JsonKey(name: 'goal_type') String goalType, String status,@JsonKey(name: 'status_label') String statusLabel,@JsonKey(name: 'target_product') GoalTargetProduct? targetProduct,@JsonKey(name: 'target_amount_paise') int? targetAmountPaise,@JsonKey(name: 'target_amount_display') String? targetAmountDisplay,@JsonKey(name: 'target_grams') String? targetGrams,@JsonKey(name: 'current_grams') String currentGrams,@JsonKey(name: 'current_grams_display') String currentGramsDisplay,@JsonKey(name: 'current_value_paise') int currentValuePaise,@JsonKey(name: 'current_value_display') String currentValueDisplay,@JsonKey(name: 'percent_complete') int percentComplete,@JsonKey(name: 'monthly_amount_paise') int monthlyAmountPaise,@JsonKey(name: 'monthly_amount_display') String monthlyAmountDisplay,@JsonKey(name: 'duration_months') int durationMonths,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'next_contribution_date') String nextContributionDate,@JsonKey(name: 'estimated_completion_date') String estimatedCompletionDate,@JsonKey(name: 'months_remaining') int monthsRemaining,@JsonKey(name: 'bonus_eligible') bool bonusEligible,@JsonKey(name: 'installments_completed') int? installmentsCompleted,@JsonKey(name: 'installments_total') int? installmentsTotal,@JsonKey(name: 'maturity_date') String? maturityDate,@JsonKey(name: 'redemption_window_start') String? redemptionWindowStart,@JsonKey(name: 'redemption_window_end') String? redemptionWindowEnd,@JsonKey(name: 'mc_waiver_eligible') bool mcWaiverEligible,@JsonKey(name: 'mc_waiver_max_pct') int? mcWaiverMaxPct,@JsonKey(name: 'mc_waiver_within_redemption_window') bool? mcWaiverWithinRedemptionWindow,@JsonKey(name: 'mc_waiver_active') bool mcWaiverActive
});


$GoalTargetProductCopyWith<$Res>? get targetProduct;

}
/// @nodoc
class _$GoalCopyWithImpl<$Res>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._self, this._then);

  final Goal _self;
  final $Res Function(Goal) _then;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? schemeType = null,Object? goalType = null,Object? status = null,Object? statusLabel = null,Object? targetProduct = freezed,Object? targetAmountPaise = freezed,Object? targetAmountDisplay = freezed,Object? targetGrams = freezed,Object? currentGrams = null,Object? currentGramsDisplay = null,Object? currentValuePaise = null,Object? currentValueDisplay = null,Object? percentComplete = null,Object? monthlyAmountPaise = null,Object? monthlyAmountDisplay = null,Object? durationMonths = null,Object? startDate = null,Object? nextContributionDate = null,Object? estimatedCompletionDate = null,Object? monthsRemaining = null,Object? bonusEligible = null,Object? installmentsCompleted = freezed,Object? installmentsTotal = freezed,Object? maturityDate = freezed,Object? redemptionWindowStart = freezed,Object? redemptionWindowEnd = freezed,Object? mcWaiverEligible = null,Object? mcWaiverMaxPct = freezed,Object? mcWaiverWithinRedemptionWindow = freezed,Object? mcWaiverActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,schemeType: null == schemeType ? _self.schemeType : schemeType // ignore: cast_nullable_to_non_nullable
as String,goalType: null == goalType ? _self.goalType : goalType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,targetProduct: freezed == targetProduct ? _self.targetProduct : targetProduct // ignore: cast_nullable_to_non_nullable
as GoalTargetProduct?,targetAmountPaise: freezed == targetAmountPaise ? _self.targetAmountPaise : targetAmountPaise // ignore: cast_nullable_to_non_nullable
as int?,targetAmountDisplay: freezed == targetAmountDisplay ? _self.targetAmountDisplay : targetAmountDisplay // ignore: cast_nullable_to_non_nullable
as String?,targetGrams: freezed == targetGrams ? _self.targetGrams : targetGrams // ignore: cast_nullable_to_non_nullable
as String?,currentGrams: null == currentGrams ? _self.currentGrams : currentGrams // ignore: cast_nullable_to_non_nullable
as String,currentGramsDisplay: null == currentGramsDisplay ? _self.currentGramsDisplay : currentGramsDisplay // ignore: cast_nullable_to_non_nullable
as String,currentValuePaise: null == currentValuePaise ? _self.currentValuePaise : currentValuePaise // ignore: cast_nullable_to_non_nullable
as int,currentValueDisplay: null == currentValueDisplay ? _self.currentValueDisplay : currentValueDisplay // ignore: cast_nullable_to_non_nullable
as String,percentComplete: null == percentComplete ? _self.percentComplete : percentComplete // ignore: cast_nullable_to_non_nullable
as int,monthlyAmountPaise: null == monthlyAmountPaise ? _self.monthlyAmountPaise : monthlyAmountPaise // ignore: cast_nullable_to_non_nullable
as int,monthlyAmountDisplay: null == monthlyAmountDisplay ? _self.monthlyAmountDisplay : monthlyAmountDisplay // ignore: cast_nullable_to_non_nullable
as String,durationMonths: null == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,nextContributionDate: null == nextContributionDate ? _self.nextContributionDate : nextContributionDate // ignore: cast_nullable_to_non_nullable
as String,estimatedCompletionDate: null == estimatedCompletionDate ? _self.estimatedCompletionDate : estimatedCompletionDate // ignore: cast_nullable_to_non_nullable
as String,monthsRemaining: null == monthsRemaining ? _self.monthsRemaining : monthsRemaining // ignore: cast_nullable_to_non_nullable
as int,bonusEligible: null == bonusEligible ? _self.bonusEligible : bonusEligible // ignore: cast_nullable_to_non_nullable
as bool,installmentsCompleted: freezed == installmentsCompleted ? _self.installmentsCompleted : installmentsCompleted // ignore: cast_nullable_to_non_nullable
as int?,installmentsTotal: freezed == installmentsTotal ? _self.installmentsTotal : installmentsTotal // ignore: cast_nullable_to_non_nullable
as int?,maturityDate: freezed == maturityDate ? _self.maturityDate : maturityDate // ignore: cast_nullable_to_non_nullable
as String?,redemptionWindowStart: freezed == redemptionWindowStart ? _self.redemptionWindowStart : redemptionWindowStart // ignore: cast_nullable_to_non_nullable
as String?,redemptionWindowEnd: freezed == redemptionWindowEnd ? _self.redemptionWindowEnd : redemptionWindowEnd // ignore: cast_nullable_to_non_nullable
as String?,mcWaiverEligible: null == mcWaiverEligible ? _self.mcWaiverEligible : mcWaiverEligible // ignore: cast_nullable_to_non_nullable
as bool,mcWaiverMaxPct: freezed == mcWaiverMaxPct ? _self.mcWaiverMaxPct : mcWaiverMaxPct // ignore: cast_nullable_to_non_nullable
as int?,mcWaiverWithinRedemptionWindow: freezed == mcWaiverWithinRedemptionWindow ? _self.mcWaiverWithinRedemptionWindow : mcWaiverWithinRedemptionWindow // ignore: cast_nullable_to_non_nullable
as bool?,mcWaiverActive: null == mcWaiverActive ? _self.mcWaiverActive : mcWaiverActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalTargetProductCopyWith<$Res>? get targetProduct {
    if (_self.targetProduct == null) {
    return null;
  }

  return $GoalTargetProductCopyWith<$Res>(_self.targetProduct!, (value) {
    return _then(_self.copyWith(targetProduct: value));
  });
}
}


/// Adds pattern-matching-related methods to [Goal].
extension GoalPatterns on Goal {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Goal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Goal value)  $default,){
final _that = this;
switch (_that) {
case _Goal():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Goal value)?  $default,){
final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'scheme_type')  String schemeType, @JsonKey(name: 'goal_type')  String goalType,  String status, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'target_product')  GoalTargetProduct? targetProduct, @JsonKey(name: 'target_amount_paise')  int? targetAmountPaise, @JsonKey(name: 'target_amount_display')  String? targetAmountDisplay, @JsonKey(name: 'target_grams')  String? targetGrams, @JsonKey(name: 'current_grams')  String currentGrams, @JsonKey(name: 'current_grams_display')  String currentGramsDisplay, @JsonKey(name: 'current_value_paise')  int currentValuePaise, @JsonKey(name: 'current_value_display')  String currentValueDisplay, @JsonKey(name: 'percent_complete')  int percentComplete, @JsonKey(name: 'monthly_amount_paise')  int monthlyAmountPaise, @JsonKey(name: 'monthly_amount_display')  String monthlyAmountDisplay, @JsonKey(name: 'duration_months')  int durationMonths, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'next_contribution_date')  String nextContributionDate, @JsonKey(name: 'estimated_completion_date')  String estimatedCompletionDate, @JsonKey(name: 'months_remaining')  int monthsRemaining, @JsonKey(name: 'bonus_eligible')  bool bonusEligible, @JsonKey(name: 'installments_completed')  int? installmentsCompleted, @JsonKey(name: 'installments_total')  int? installmentsTotal, @JsonKey(name: 'maturity_date')  String? maturityDate, @JsonKey(name: 'redemption_window_start')  String? redemptionWindowStart, @JsonKey(name: 'redemption_window_end')  String? redemptionWindowEnd, @JsonKey(name: 'mc_waiver_eligible')  bool mcWaiverEligible, @JsonKey(name: 'mc_waiver_max_pct')  int? mcWaiverMaxPct, @JsonKey(name: 'mc_waiver_within_redemption_window')  bool? mcWaiverWithinRedemptionWindow, @JsonKey(name: 'mc_waiver_active')  bool mcWaiverActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.name,_that.schemeType,_that.goalType,_that.status,_that.statusLabel,_that.targetProduct,_that.targetAmountPaise,_that.targetAmountDisplay,_that.targetGrams,_that.currentGrams,_that.currentGramsDisplay,_that.currentValuePaise,_that.currentValueDisplay,_that.percentComplete,_that.monthlyAmountPaise,_that.monthlyAmountDisplay,_that.durationMonths,_that.startDate,_that.nextContributionDate,_that.estimatedCompletionDate,_that.monthsRemaining,_that.bonusEligible,_that.installmentsCompleted,_that.installmentsTotal,_that.maturityDate,_that.redemptionWindowStart,_that.redemptionWindowEnd,_that.mcWaiverEligible,_that.mcWaiverMaxPct,_that.mcWaiverWithinRedemptionWindow,_that.mcWaiverActive);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'scheme_type')  String schemeType, @JsonKey(name: 'goal_type')  String goalType,  String status, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'target_product')  GoalTargetProduct? targetProduct, @JsonKey(name: 'target_amount_paise')  int? targetAmountPaise, @JsonKey(name: 'target_amount_display')  String? targetAmountDisplay, @JsonKey(name: 'target_grams')  String? targetGrams, @JsonKey(name: 'current_grams')  String currentGrams, @JsonKey(name: 'current_grams_display')  String currentGramsDisplay, @JsonKey(name: 'current_value_paise')  int currentValuePaise, @JsonKey(name: 'current_value_display')  String currentValueDisplay, @JsonKey(name: 'percent_complete')  int percentComplete, @JsonKey(name: 'monthly_amount_paise')  int monthlyAmountPaise, @JsonKey(name: 'monthly_amount_display')  String monthlyAmountDisplay, @JsonKey(name: 'duration_months')  int durationMonths, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'next_contribution_date')  String nextContributionDate, @JsonKey(name: 'estimated_completion_date')  String estimatedCompletionDate, @JsonKey(name: 'months_remaining')  int monthsRemaining, @JsonKey(name: 'bonus_eligible')  bool bonusEligible, @JsonKey(name: 'installments_completed')  int? installmentsCompleted, @JsonKey(name: 'installments_total')  int? installmentsTotal, @JsonKey(name: 'maturity_date')  String? maturityDate, @JsonKey(name: 'redemption_window_start')  String? redemptionWindowStart, @JsonKey(name: 'redemption_window_end')  String? redemptionWindowEnd, @JsonKey(name: 'mc_waiver_eligible')  bool mcWaiverEligible, @JsonKey(name: 'mc_waiver_max_pct')  int? mcWaiverMaxPct, @JsonKey(name: 'mc_waiver_within_redemption_window')  bool? mcWaiverWithinRedemptionWindow, @JsonKey(name: 'mc_waiver_active')  bool mcWaiverActive)  $default,) {final _that = this;
switch (_that) {
case _Goal():
return $default(_that.id,_that.name,_that.schemeType,_that.goalType,_that.status,_that.statusLabel,_that.targetProduct,_that.targetAmountPaise,_that.targetAmountDisplay,_that.targetGrams,_that.currentGrams,_that.currentGramsDisplay,_that.currentValuePaise,_that.currentValueDisplay,_that.percentComplete,_that.monthlyAmountPaise,_that.monthlyAmountDisplay,_that.durationMonths,_that.startDate,_that.nextContributionDate,_that.estimatedCompletionDate,_that.monthsRemaining,_that.bonusEligible,_that.installmentsCompleted,_that.installmentsTotal,_that.maturityDate,_that.redemptionWindowStart,_that.redemptionWindowEnd,_that.mcWaiverEligible,_that.mcWaiverMaxPct,_that.mcWaiverWithinRedemptionWindow,_that.mcWaiverActive);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'scheme_type')  String schemeType, @JsonKey(name: 'goal_type')  String goalType,  String status, @JsonKey(name: 'status_label')  String statusLabel, @JsonKey(name: 'target_product')  GoalTargetProduct? targetProduct, @JsonKey(name: 'target_amount_paise')  int? targetAmountPaise, @JsonKey(name: 'target_amount_display')  String? targetAmountDisplay, @JsonKey(name: 'target_grams')  String? targetGrams, @JsonKey(name: 'current_grams')  String currentGrams, @JsonKey(name: 'current_grams_display')  String currentGramsDisplay, @JsonKey(name: 'current_value_paise')  int currentValuePaise, @JsonKey(name: 'current_value_display')  String currentValueDisplay, @JsonKey(name: 'percent_complete')  int percentComplete, @JsonKey(name: 'monthly_amount_paise')  int monthlyAmountPaise, @JsonKey(name: 'monthly_amount_display')  String monthlyAmountDisplay, @JsonKey(name: 'duration_months')  int durationMonths, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'next_contribution_date')  String nextContributionDate, @JsonKey(name: 'estimated_completion_date')  String estimatedCompletionDate, @JsonKey(name: 'months_remaining')  int monthsRemaining, @JsonKey(name: 'bonus_eligible')  bool bonusEligible, @JsonKey(name: 'installments_completed')  int? installmentsCompleted, @JsonKey(name: 'installments_total')  int? installmentsTotal, @JsonKey(name: 'maturity_date')  String? maturityDate, @JsonKey(name: 'redemption_window_start')  String? redemptionWindowStart, @JsonKey(name: 'redemption_window_end')  String? redemptionWindowEnd, @JsonKey(name: 'mc_waiver_eligible')  bool mcWaiverEligible, @JsonKey(name: 'mc_waiver_max_pct')  int? mcWaiverMaxPct, @JsonKey(name: 'mc_waiver_within_redemption_window')  bool? mcWaiverWithinRedemptionWindow, @JsonKey(name: 'mc_waiver_active')  bool mcWaiverActive)?  $default,) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.name,_that.schemeType,_that.goalType,_that.status,_that.statusLabel,_that.targetProduct,_that.targetAmountPaise,_that.targetAmountDisplay,_that.targetGrams,_that.currentGrams,_that.currentGramsDisplay,_that.currentValuePaise,_that.currentValueDisplay,_that.percentComplete,_that.monthlyAmountPaise,_that.monthlyAmountDisplay,_that.durationMonths,_that.startDate,_that.nextContributionDate,_that.estimatedCompletionDate,_that.monthsRemaining,_that.bonusEligible,_that.installmentsCompleted,_that.installmentsTotal,_that.maturityDate,_that.redemptionWindowStart,_that.redemptionWindowEnd,_that.mcWaiverEligible,_that.mcWaiverMaxPct,_that.mcWaiverWithinRedemptionWindow,_that.mcWaiverActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Goal implements Goal {
  const _Goal({required this.id, required this.name, @JsonKey(name: 'scheme_type') this.schemeType = 'aura', @JsonKey(name: 'goal_type') required this.goalType, required this.status, @JsonKey(name: 'status_label') required this.statusLabel, @JsonKey(name: 'target_product') this.targetProduct, @JsonKey(name: 'target_amount_paise') this.targetAmountPaise, @JsonKey(name: 'target_amount_display') this.targetAmountDisplay, @JsonKey(name: 'target_grams') this.targetGrams, @JsonKey(name: 'current_grams') required this.currentGrams, @JsonKey(name: 'current_grams_display') required this.currentGramsDisplay, @JsonKey(name: 'current_value_paise') required this.currentValuePaise, @JsonKey(name: 'current_value_display') required this.currentValueDisplay, @JsonKey(name: 'percent_complete') required this.percentComplete, @JsonKey(name: 'monthly_amount_paise') required this.monthlyAmountPaise, @JsonKey(name: 'monthly_amount_display') required this.monthlyAmountDisplay, @JsonKey(name: 'duration_months') required this.durationMonths, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'next_contribution_date') required this.nextContributionDate, @JsonKey(name: 'estimated_completion_date') required this.estimatedCompletionDate, @JsonKey(name: 'months_remaining') required this.monthsRemaining, @JsonKey(name: 'bonus_eligible') this.bonusEligible = true, @JsonKey(name: 'installments_completed') this.installmentsCompleted, @JsonKey(name: 'installments_total') this.installmentsTotal, @JsonKey(name: 'maturity_date') this.maturityDate, @JsonKey(name: 'redemption_window_start') this.redemptionWindowStart, @JsonKey(name: 'redemption_window_end') this.redemptionWindowEnd, @JsonKey(name: 'mc_waiver_eligible') this.mcWaiverEligible = false, @JsonKey(name: 'mc_waiver_max_pct') this.mcWaiverMaxPct, @JsonKey(name: 'mc_waiver_within_redemption_window') this.mcWaiverWithinRedemptionWindow, @JsonKey(name: 'mc_waiver_active') this.mcWaiverActive = false});
  factory _Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'scheme_type') final  String schemeType;
@override@JsonKey(name: 'goal_type') final  String goalType;
@override final  String status;
@override@JsonKey(name: 'status_label') final  String statusLabel;
@override@JsonKey(name: 'target_product') final  GoalTargetProduct? targetProduct;
@override@JsonKey(name: 'target_amount_paise') final  int? targetAmountPaise;
@override@JsonKey(name: 'target_amount_display') final  String? targetAmountDisplay;
@override@JsonKey(name: 'target_grams') final  String? targetGrams;
@override@JsonKey(name: 'current_grams') final  String currentGrams;
@override@JsonKey(name: 'current_grams_display') final  String currentGramsDisplay;
@override@JsonKey(name: 'current_value_paise') final  int currentValuePaise;
@override@JsonKey(name: 'current_value_display') final  String currentValueDisplay;
@override@JsonKey(name: 'percent_complete') final  int percentComplete;
@override@JsonKey(name: 'monthly_amount_paise') final  int monthlyAmountPaise;
@override@JsonKey(name: 'monthly_amount_display') final  String monthlyAmountDisplay;
@override@JsonKey(name: 'duration_months') final  int durationMonths;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'next_contribution_date') final  String nextContributionDate;
@override@JsonKey(name: 'estimated_completion_date') final  String estimatedCompletionDate;
@override@JsonKey(name: 'months_remaining') final  int monthsRemaining;
@override@JsonKey(name: 'bonus_eligible') final  bool bonusEligible;
@override@JsonKey(name: 'installments_completed') final  int? installmentsCompleted;
@override@JsonKey(name: 'installments_total') final  int? installmentsTotal;
@override@JsonKey(name: 'maturity_date') final  String? maturityDate;
@override@JsonKey(name: 'redemption_window_start') final  String? redemptionWindowStart;
@override@JsonKey(name: 'redemption_window_end') final  String? redemptionWindowEnd;
@override@JsonKey(name: 'mc_waiver_eligible') final  bool mcWaiverEligible;
@override@JsonKey(name: 'mc_waiver_max_pct') final  int? mcWaiverMaxPct;
@override@JsonKey(name: 'mc_waiver_within_redemption_window') final  bool? mcWaiverWithinRedemptionWindow;
@override@JsonKey(name: 'mc_waiver_active') final  bool mcWaiverActive;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalCopyWith<_Goal> get copyWith => __$GoalCopyWithImpl<_Goal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Goal&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.schemeType, schemeType) || other.schemeType == schemeType)&&(identical(other.goalType, goalType) || other.goalType == goalType)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.targetProduct, targetProduct) || other.targetProduct == targetProduct)&&(identical(other.targetAmountPaise, targetAmountPaise) || other.targetAmountPaise == targetAmountPaise)&&(identical(other.targetAmountDisplay, targetAmountDisplay) || other.targetAmountDisplay == targetAmountDisplay)&&(identical(other.targetGrams, targetGrams) || other.targetGrams == targetGrams)&&(identical(other.currentGrams, currentGrams) || other.currentGrams == currentGrams)&&(identical(other.currentGramsDisplay, currentGramsDisplay) || other.currentGramsDisplay == currentGramsDisplay)&&(identical(other.currentValuePaise, currentValuePaise) || other.currentValuePaise == currentValuePaise)&&(identical(other.currentValueDisplay, currentValueDisplay) || other.currentValueDisplay == currentValueDisplay)&&(identical(other.percentComplete, percentComplete) || other.percentComplete == percentComplete)&&(identical(other.monthlyAmountPaise, monthlyAmountPaise) || other.monthlyAmountPaise == monthlyAmountPaise)&&(identical(other.monthlyAmountDisplay, monthlyAmountDisplay) || other.monthlyAmountDisplay == monthlyAmountDisplay)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.nextContributionDate, nextContributionDate) || other.nextContributionDate == nextContributionDate)&&(identical(other.estimatedCompletionDate, estimatedCompletionDate) || other.estimatedCompletionDate == estimatedCompletionDate)&&(identical(other.monthsRemaining, monthsRemaining) || other.monthsRemaining == monthsRemaining)&&(identical(other.bonusEligible, bonusEligible) || other.bonusEligible == bonusEligible)&&(identical(other.installmentsCompleted, installmentsCompleted) || other.installmentsCompleted == installmentsCompleted)&&(identical(other.installmentsTotal, installmentsTotal) || other.installmentsTotal == installmentsTotal)&&(identical(other.maturityDate, maturityDate) || other.maturityDate == maturityDate)&&(identical(other.redemptionWindowStart, redemptionWindowStart) || other.redemptionWindowStart == redemptionWindowStart)&&(identical(other.redemptionWindowEnd, redemptionWindowEnd) || other.redemptionWindowEnd == redemptionWindowEnd)&&(identical(other.mcWaiverEligible, mcWaiverEligible) || other.mcWaiverEligible == mcWaiverEligible)&&(identical(other.mcWaiverMaxPct, mcWaiverMaxPct) || other.mcWaiverMaxPct == mcWaiverMaxPct)&&(identical(other.mcWaiverWithinRedemptionWindow, mcWaiverWithinRedemptionWindow) || other.mcWaiverWithinRedemptionWindow == mcWaiverWithinRedemptionWindow)&&(identical(other.mcWaiverActive, mcWaiverActive) || other.mcWaiverActive == mcWaiverActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,schemeType,goalType,status,statusLabel,targetProduct,targetAmountPaise,targetAmountDisplay,targetGrams,currentGrams,currentGramsDisplay,currentValuePaise,currentValueDisplay,percentComplete,monthlyAmountPaise,monthlyAmountDisplay,durationMonths,startDate,nextContributionDate,estimatedCompletionDate,monthsRemaining,bonusEligible,installmentsCompleted,installmentsTotal,maturityDate,redemptionWindowStart,redemptionWindowEnd,mcWaiverEligible,mcWaiverMaxPct,mcWaiverWithinRedemptionWindow,mcWaiverActive]);

@override
String toString() {
  return 'Goal(id: $id, name: $name, schemeType: $schemeType, goalType: $goalType, status: $status, statusLabel: $statusLabel, targetProduct: $targetProduct, targetAmountPaise: $targetAmountPaise, targetAmountDisplay: $targetAmountDisplay, targetGrams: $targetGrams, currentGrams: $currentGrams, currentGramsDisplay: $currentGramsDisplay, currentValuePaise: $currentValuePaise, currentValueDisplay: $currentValueDisplay, percentComplete: $percentComplete, monthlyAmountPaise: $monthlyAmountPaise, monthlyAmountDisplay: $monthlyAmountDisplay, durationMonths: $durationMonths, startDate: $startDate, nextContributionDate: $nextContributionDate, estimatedCompletionDate: $estimatedCompletionDate, monthsRemaining: $monthsRemaining, bonusEligible: $bonusEligible, installmentsCompleted: $installmentsCompleted, installmentsTotal: $installmentsTotal, maturityDate: $maturityDate, redemptionWindowStart: $redemptionWindowStart, redemptionWindowEnd: $redemptionWindowEnd, mcWaiverEligible: $mcWaiverEligible, mcWaiverMaxPct: $mcWaiverMaxPct, mcWaiverWithinRedemptionWindow: $mcWaiverWithinRedemptionWindow, mcWaiverActive: $mcWaiverActive)';
}


}

/// @nodoc
abstract mixin class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) _then) = __$GoalCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'scheme_type') String schemeType,@JsonKey(name: 'goal_type') String goalType, String status,@JsonKey(name: 'status_label') String statusLabel,@JsonKey(name: 'target_product') GoalTargetProduct? targetProduct,@JsonKey(name: 'target_amount_paise') int? targetAmountPaise,@JsonKey(name: 'target_amount_display') String? targetAmountDisplay,@JsonKey(name: 'target_grams') String? targetGrams,@JsonKey(name: 'current_grams') String currentGrams,@JsonKey(name: 'current_grams_display') String currentGramsDisplay,@JsonKey(name: 'current_value_paise') int currentValuePaise,@JsonKey(name: 'current_value_display') String currentValueDisplay,@JsonKey(name: 'percent_complete') int percentComplete,@JsonKey(name: 'monthly_amount_paise') int monthlyAmountPaise,@JsonKey(name: 'monthly_amount_display') String monthlyAmountDisplay,@JsonKey(name: 'duration_months') int durationMonths,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'next_contribution_date') String nextContributionDate,@JsonKey(name: 'estimated_completion_date') String estimatedCompletionDate,@JsonKey(name: 'months_remaining') int monthsRemaining,@JsonKey(name: 'bonus_eligible') bool bonusEligible,@JsonKey(name: 'installments_completed') int? installmentsCompleted,@JsonKey(name: 'installments_total') int? installmentsTotal,@JsonKey(name: 'maturity_date') String? maturityDate,@JsonKey(name: 'redemption_window_start') String? redemptionWindowStart,@JsonKey(name: 'redemption_window_end') String? redemptionWindowEnd,@JsonKey(name: 'mc_waiver_eligible') bool mcWaiverEligible,@JsonKey(name: 'mc_waiver_max_pct') int? mcWaiverMaxPct,@JsonKey(name: 'mc_waiver_within_redemption_window') bool? mcWaiverWithinRedemptionWindow,@JsonKey(name: 'mc_waiver_active') bool mcWaiverActive
});


@override $GoalTargetProductCopyWith<$Res>? get targetProduct;

}
/// @nodoc
class __$GoalCopyWithImpl<$Res>
    implements _$GoalCopyWith<$Res> {
  __$GoalCopyWithImpl(this._self, this._then);

  final _Goal _self;
  final $Res Function(_Goal) _then;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? schemeType = null,Object? goalType = null,Object? status = null,Object? statusLabel = null,Object? targetProduct = freezed,Object? targetAmountPaise = freezed,Object? targetAmountDisplay = freezed,Object? targetGrams = freezed,Object? currentGrams = null,Object? currentGramsDisplay = null,Object? currentValuePaise = null,Object? currentValueDisplay = null,Object? percentComplete = null,Object? monthlyAmountPaise = null,Object? monthlyAmountDisplay = null,Object? durationMonths = null,Object? startDate = null,Object? nextContributionDate = null,Object? estimatedCompletionDate = null,Object? monthsRemaining = null,Object? bonusEligible = null,Object? installmentsCompleted = freezed,Object? installmentsTotal = freezed,Object? maturityDate = freezed,Object? redemptionWindowStart = freezed,Object? redemptionWindowEnd = freezed,Object? mcWaiverEligible = null,Object? mcWaiverMaxPct = freezed,Object? mcWaiverWithinRedemptionWindow = freezed,Object? mcWaiverActive = null,}) {
  return _then(_Goal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,schemeType: null == schemeType ? _self.schemeType : schemeType // ignore: cast_nullable_to_non_nullable
as String,goalType: null == goalType ? _self.goalType : goalType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,targetProduct: freezed == targetProduct ? _self.targetProduct : targetProduct // ignore: cast_nullable_to_non_nullable
as GoalTargetProduct?,targetAmountPaise: freezed == targetAmountPaise ? _self.targetAmountPaise : targetAmountPaise // ignore: cast_nullable_to_non_nullable
as int?,targetAmountDisplay: freezed == targetAmountDisplay ? _self.targetAmountDisplay : targetAmountDisplay // ignore: cast_nullable_to_non_nullable
as String?,targetGrams: freezed == targetGrams ? _self.targetGrams : targetGrams // ignore: cast_nullable_to_non_nullable
as String?,currentGrams: null == currentGrams ? _self.currentGrams : currentGrams // ignore: cast_nullable_to_non_nullable
as String,currentGramsDisplay: null == currentGramsDisplay ? _self.currentGramsDisplay : currentGramsDisplay // ignore: cast_nullable_to_non_nullable
as String,currentValuePaise: null == currentValuePaise ? _self.currentValuePaise : currentValuePaise // ignore: cast_nullable_to_non_nullable
as int,currentValueDisplay: null == currentValueDisplay ? _self.currentValueDisplay : currentValueDisplay // ignore: cast_nullable_to_non_nullable
as String,percentComplete: null == percentComplete ? _self.percentComplete : percentComplete // ignore: cast_nullable_to_non_nullable
as int,monthlyAmountPaise: null == monthlyAmountPaise ? _self.monthlyAmountPaise : monthlyAmountPaise // ignore: cast_nullable_to_non_nullable
as int,monthlyAmountDisplay: null == monthlyAmountDisplay ? _self.monthlyAmountDisplay : monthlyAmountDisplay // ignore: cast_nullable_to_non_nullable
as String,durationMonths: null == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,nextContributionDate: null == nextContributionDate ? _self.nextContributionDate : nextContributionDate // ignore: cast_nullable_to_non_nullable
as String,estimatedCompletionDate: null == estimatedCompletionDate ? _self.estimatedCompletionDate : estimatedCompletionDate // ignore: cast_nullable_to_non_nullable
as String,monthsRemaining: null == monthsRemaining ? _self.monthsRemaining : monthsRemaining // ignore: cast_nullable_to_non_nullable
as int,bonusEligible: null == bonusEligible ? _self.bonusEligible : bonusEligible // ignore: cast_nullable_to_non_nullable
as bool,installmentsCompleted: freezed == installmentsCompleted ? _self.installmentsCompleted : installmentsCompleted // ignore: cast_nullable_to_non_nullable
as int?,installmentsTotal: freezed == installmentsTotal ? _self.installmentsTotal : installmentsTotal // ignore: cast_nullable_to_non_nullable
as int?,maturityDate: freezed == maturityDate ? _self.maturityDate : maturityDate // ignore: cast_nullable_to_non_nullable
as String?,redemptionWindowStart: freezed == redemptionWindowStart ? _self.redemptionWindowStart : redemptionWindowStart // ignore: cast_nullable_to_non_nullable
as String?,redemptionWindowEnd: freezed == redemptionWindowEnd ? _self.redemptionWindowEnd : redemptionWindowEnd // ignore: cast_nullable_to_non_nullable
as String?,mcWaiverEligible: null == mcWaiverEligible ? _self.mcWaiverEligible : mcWaiverEligible // ignore: cast_nullable_to_non_nullable
as bool,mcWaiverMaxPct: freezed == mcWaiverMaxPct ? _self.mcWaiverMaxPct : mcWaiverMaxPct // ignore: cast_nullable_to_non_nullable
as int?,mcWaiverWithinRedemptionWindow: freezed == mcWaiverWithinRedemptionWindow ? _self.mcWaiverWithinRedemptionWindow : mcWaiverWithinRedemptionWindow // ignore: cast_nullable_to_non_nullable
as bool?,mcWaiverActive: null == mcWaiverActive ? _self.mcWaiverActive : mcWaiverActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalTargetProductCopyWith<$Res>? get targetProduct {
    if (_self.targetProduct == null) {
    return null;
  }

  return $GoalTargetProductCopyWith<$Res>(_self.targetProduct!, (value) {
    return _then(_self.copyWith(targetProduct: value));
  });
}
}


/// @nodoc
mixin _$GoalsSummary {

@JsonKey(name: 'total_grams') String get totalGrams;@JsonKey(name: 'total_grams_display') String get totalGramsDisplay;@JsonKey(name: 'total_value_paise') int get totalValuePaise;@JsonKey(name: 'total_value_display') String get totalValueDisplay;@JsonKey(name: 'active_count') int get activeCount;@JsonKey(name: 'monthly_total_paise') int get monthlyTotalPaise;@JsonKey(name: 'monthly_total_display') String get monthlyTotalDisplay;
/// Create a copy of GoalsSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalsSummaryCopyWith<GoalsSummary> get copyWith => _$GoalsSummaryCopyWithImpl<GoalsSummary>(this as GoalsSummary, _$identity);

  /// Serializes this GoalsSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalsSummary&&(identical(other.totalGrams, totalGrams) || other.totalGrams == totalGrams)&&(identical(other.totalGramsDisplay, totalGramsDisplay) || other.totalGramsDisplay == totalGramsDisplay)&&(identical(other.totalValuePaise, totalValuePaise) || other.totalValuePaise == totalValuePaise)&&(identical(other.totalValueDisplay, totalValueDisplay) || other.totalValueDisplay == totalValueDisplay)&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.monthlyTotalPaise, monthlyTotalPaise) || other.monthlyTotalPaise == monthlyTotalPaise)&&(identical(other.monthlyTotalDisplay, monthlyTotalDisplay) || other.monthlyTotalDisplay == monthlyTotalDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalGrams,totalGramsDisplay,totalValuePaise,totalValueDisplay,activeCount,monthlyTotalPaise,monthlyTotalDisplay);

@override
String toString() {
  return 'GoalsSummary(totalGrams: $totalGrams, totalGramsDisplay: $totalGramsDisplay, totalValuePaise: $totalValuePaise, totalValueDisplay: $totalValueDisplay, activeCount: $activeCount, monthlyTotalPaise: $monthlyTotalPaise, monthlyTotalDisplay: $monthlyTotalDisplay)';
}


}

/// @nodoc
abstract mixin class $GoalsSummaryCopyWith<$Res>  {
  factory $GoalsSummaryCopyWith(GoalsSummary value, $Res Function(GoalsSummary) _then) = _$GoalsSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_grams') String totalGrams,@JsonKey(name: 'total_grams_display') String totalGramsDisplay,@JsonKey(name: 'total_value_paise') int totalValuePaise,@JsonKey(name: 'total_value_display') String totalValueDisplay,@JsonKey(name: 'active_count') int activeCount,@JsonKey(name: 'monthly_total_paise') int monthlyTotalPaise,@JsonKey(name: 'monthly_total_display') String monthlyTotalDisplay
});




}
/// @nodoc
class _$GoalsSummaryCopyWithImpl<$Res>
    implements $GoalsSummaryCopyWith<$Res> {
  _$GoalsSummaryCopyWithImpl(this._self, this._then);

  final GoalsSummary _self;
  final $Res Function(GoalsSummary) _then;

/// Create a copy of GoalsSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalGrams = null,Object? totalGramsDisplay = null,Object? totalValuePaise = null,Object? totalValueDisplay = null,Object? activeCount = null,Object? monthlyTotalPaise = null,Object? monthlyTotalDisplay = null,}) {
  return _then(_self.copyWith(
totalGrams: null == totalGrams ? _self.totalGrams : totalGrams // ignore: cast_nullable_to_non_nullable
as String,totalGramsDisplay: null == totalGramsDisplay ? _self.totalGramsDisplay : totalGramsDisplay // ignore: cast_nullable_to_non_nullable
as String,totalValuePaise: null == totalValuePaise ? _self.totalValuePaise : totalValuePaise // ignore: cast_nullable_to_non_nullable
as int,totalValueDisplay: null == totalValueDisplay ? _self.totalValueDisplay : totalValueDisplay // ignore: cast_nullable_to_non_nullable
as String,activeCount: null == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int,monthlyTotalPaise: null == monthlyTotalPaise ? _self.monthlyTotalPaise : monthlyTotalPaise // ignore: cast_nullable_to_non_nullable
as int,monthlyTotalDisplay: null == monthlyTotalDisplay ? _self.monthlyTotalDisplay : monthlyTotalDisplay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalsSummary].
extension GoalsSummaryPatterns on GoalsSummary {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalsSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalsSummary() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalsSummary value)  $default,){
final _that = this;
switch (_that) {
case _GoalsSummary():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalsSummary value)?  $default,){
final _that = this;
switch (_that) {
case _GoalsSummary() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_grams')  String totalGrams, @JsonKey(name: 'total_grams_display')  String totalGramsDisplay, @JsonKey(name: 'total_value_paise')  int totalValuePaise, @JsonKey(name: 'total_value_display')  String totalValueDisplay, @JsonKey(name: 'active_count')  int activeCount, @JsonKey(name: 'monthly_total_paise')  int monthlyTotalPaise, @JsonKey(name: 'monthly_total_display')  String monthlyTotalDisplay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalsSummary() when $default != null:
return $default(_that.totalGrams,_that.totalGramsDisplay,_that.totalValuePaise,_that.totalValueDisplay,_that.activeCount,_that.monthlyTotalPaise,_that.monthlyTotalDisplay);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_grams')  String totalGrams, @JsonKey(name: 'total_grams_display')  String totalGramsDisplay, @JsonKey(name: 'total_value_paise')  int totalValuePaise, @JsonKey(name: 'total_value_display')  String totalValueDisplay, @JsonKey(name: 'active_count')  int activeCount, @JsonKey(name: 'monthly_total_paise')  int monthlyTotalPaise, @JsonKey(name: 'monthly_total_display')  String monthlyTotalDisplay)  $default,) {final _that = this;
switch (_that) {
case _GoalsSummary():
return $default(_that.totalGrams,_that.totalGramsDisplay,_that.totalValuePaise,_that.totalValueDisplay,_that.activeCount,_that.monthlyTotalPaise,_that.monthlyTotalDisplay);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_grams')  String totalGrams, @JsonKey(name: 'total_grams_display')  String totalGramsDisplay, @JsonKey(name: 'total_value_paise')  int totalValuePaise, @JsonKey(name: 'total_value_display')  String totalValueDisplay, @JsonKey(name: 'active_count')  int activeCount, @JsonKey(name: 'monthly_total_paise')  int monthlyTotalPaise, @JsonKey(name: 'monthly_total_display')  String monthlyTotalDisplay)?  $default,) {final _that = this;
switch (_that) {
case _GoalsSummary() when $default != null:
return $default(_that.totalGrams,_that.totalGramsDisplay,_that.totalValuePaise,_that.totalValueDisplay,_that.activeCount,_that.monthlyTotalPaise,_that.monthlyTotalDisplay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalsSummary implements GoalsSummary {
  const _GoalsSummary({@JsonKey(name: 'total_grams') required this.totalGrams, @JsonKey(name: 'total_grams_display') required this.totalGramsDisplay, @JsonKey(name: 'total_value_paise') required this.totalValuePaise, @JsonKey(name: 'total_value_display') required this.totalValueDisplay, @JsonKey(name: 'active_count') required this.activeCount, @JsonKey(name: 'monthly_total_paise') required this.monthlyTotalPaise, @JsonKey(name: 'monthly_total_display') required this.monthlyTotalDisplay});
  factory _GoalsSummary.fromJson(Map<String, dynamic> json) => _$GoalsSummaryFromJson(json);

@override@JsonKey(name: 'total_grams') final  String totalGrams;
@override@JsonKey(name: 'total_grams_display') final  String totalGramsDisplay;
@override@JsonKey(name: 'total_value_paise') final  int totalValuePaise;
@override@JsonKey(name: 'total_value_display') final  String totalValueDisplay;
@override@JsonKey(name: 'active_count') final  int activeCount;
@override@JsonKey(name: 'monthly_total_paise') final  int monthlyTotalPaise;
@override@JsonKey(name: 'monthly_total_display') final  String monthlyTotalDisplay;

/// Create a copy of GoalsSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalsSummaryCopyWith<_GoalsSummary> get copyWith => __$GoalsSummaryCopyWithImpl<_GoalsSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalsSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalsSummary&&(identical(other.totalGrams, totalGrams) || other.totalGrams == totalGrams)&&(identical(other.totalGramsDisplay, totalGramsDisplay) || other.totalGramsDisplay == totalGramsDisplay)&&(identical(other.totalValuePaise, totalValuePaise) || other.totalValuePaise == totalValuePaise)&&(identical(other.totalValueDisplay, totalValueDisplay) || other.totalValueDisplay == totalValueDisplay)&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.monthlyTotalPaise, monthlyTotalPaise) || other.monthlyTotalPaise == monthlyTotalPaise)&&(identical(other.monthlyTotalDisplay, monthlyTotalDisplay) || other.monthlyTotalDisplay == monthlyTotalDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalGrams,totalGramsDisplay,totalValuePaise,totalValueDisplay,activeCount,monthlyTotalPaise,monthlyTotalDisplay);

@override
String toString() {
  return 'GoalsSummary(totalGrams: $totalGrams, totalGramsDisplay: $totalGramsDisplay, totalValuePaise: $totalValuePaise, totalValueDisplay: $totalValueDisplay, activeCount: $activeCount, monthlyTotalPaise: $monthlyTotalPaise, monthlyTotalDisplay: $monthlyTotalDisplay)';
}


}

/// @nodoc
abstract mixin class _$GoalsSummaryCopyWith<$Res> implements $GoalsSummaryCopyWith<$Res> {
  factory _$GoalsSummaryCopyWith(_GoalsSummary value, $Res Function(_GoalsSummary) _then) = __$GoalsSummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_grams') String totalGrams,@JsonKey(name: 'total_grams_display') String totalGramsDisplay,@JsonKey(name: 'total_value_paise') int totalValuePaise,@JsonKey(name: 'total_value_display') String totalValueDisplay,@JsonKey(name: 'active_count') int activeCount,@JsonKey(name: 'monthly_total_paise') int monthlyTotalPaise,@JsonKey(name: 'monthly_total_display') String monthlyTotalDisplay
});




}
/// @nodoc
class __$GoalsSummaryCopyWithImpl<$Res>
    implements _$GoalsSummaryCopyWith<$Res> {
  __$GoalsSummaryCopyWithImpl(this._self, this._then);

  final _GoalsSummary _self;
  final $Res Function(_GoalsSummary) _then;

/// Create a copy of GoalsSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalGrams = null,Object? totalGramsDisplay = null,Object? totalValuePaise = null,Object? totalValueDisplay = null,Object? activeCount = null,Object? monthlyTotalPaise = null,Object? monthlyTotalDisplay = null,}) {
  return _then(_GoalsSummary(
totalGrams: null == totalGrams ? _self.totalGrams : totalGrams // ignore: cast_nullable_to_non_nullable
as String,totalGramsDisplay: null == totalGramsDisplay ? _self.totalGramsDisplay : totalGramsDisplay // ignore: cast_nullable_to_non_nullable
as String,totalValuePaise: null == totalValuePaise ? _self.totalValuePaise : totalValuePaise // ignore: cast_nullable_to_non_nullable
as int,totalValueDisplay: null == totalValueDisplay ? _self.totalValueDisplay : totalValueDisplay // ignore: cast_nullable_to_non_nullable
as String,activeCount: null == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int,monthlyTotalPaise: null == monthlyTotalPaise ? _self.monthlyTotalPaise : monthlyTotalPaise // ignore: cast_nullable_to_non_nullable
as int,monthlyTotalDisplay: null == monthlyTotalDisplay ? _self.monthlyTotalDisplay : monthlyTotalDisplay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GoalsListResponse {

 List<Goal> get goals; GoalsSummary get summary;
/// Create a copy of GoalsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalsListResponseCopyWith<GoalsListResponse> get copyWith => _$GoalsListResponseCopyWithImpl<GoalsListResponse>(this as GoalsListResponse, _$identity);

  /// Serializes this GoalsListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalsListResponse&&const DeepCollectionEquality().equals(other.goals, goals)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(goals),summary);

@override
String toString() {
  return 'GoalsListResponse(goals: $goals, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $GoalsListResponseCopyWith<$Res>  {
  factory $GoalsListResponseCopyWith(GoalsListResponse value, $Res Function(GoalsListResponse) _then) = _$GoalsListResponseCopyWithImpl;
@useResult
$Res call({
 List<Goal> goals, GoalsSummary summary
});


$GoalsSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$GoalsListResponseCopyWithImpl<$Res>
    implements $GoalsListResponseCopyWith<$Res> {
  _$GoalsListResponseCopyWithImpl(this._self, this._then);

  final GoalsListResponse _self;
  final $Res Function(GoalsListResponse) _then;

/// Create a copy of GoalsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goals = null,Object? summary = null,}) {
  return _then(_self.copyWith(
goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<Goal>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as GoalsSummary,
  ));
}
/// Create a copy of GoalsListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsSummaryCopyWith<$Res> get summary {
  
  return $GoalsSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoalsListResponse].
extension GoalsListResponsePatterns on GoalsListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalsListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalsListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalsListResponse value)  $default,){
final _that = this;
switch (_that) {
case _GoalsListResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalsListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GoalsListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Goal> goals,  GoalsSummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalsListResponse() when $default != null:
return $default(_that.goals,_that.summary);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Goal> goals,  GoalsSummary summary)  $default,) {final _that = this;
switch (_that) {
case _GoalsListResponse():
return $default(_that.goals,_that.summary);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Goal> goals,  GoalsSummary summary)?  $default,) {final _that = this;
switch (_that) {
case _GoalsListResponse() when $default != null:
return $default(_that.goals,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalsListResponse implements GoalsListResponse {
  const _GoalsListResponse({required final  List<Goal> goals, required this.summary}): _goals = goals;
  factory _GoalsListResponse.fromJson(Map<String, dynamic> json) => _$GoalsListResponseFromJson(json);

 final  List<Goal> _goals;
@override List<Goal> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

@override final  GoalsSummary summary;

/// Create a copy of GoalsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalsListResponseCopyWith<_GoalsListResponse> get copyWith => __$GoalsListResponseCopyWithImpl<_GoalsListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalsListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalsListResponse&&const DeepCollectionEquality().equals(other._goals, _goals)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_goals),summary);

@override
String toString() {
  return 'GoalsListResponse(goals: $goals, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$GoalsListResponseCopyWith<$Res> implements $GoalsListResponseCopyWith<$Res> {
  factory _$GoalsListResponseCopyWith(_GoalsListResponse value, $Res Function(_GoalsListResponse) _then) = __$GoalsListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Goal> goals, GoalsSummary summary
});


@override $GoalsSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$GoalsListResponseCopyWithImpl<$Res>
    implements _$GoalsListResponseCopyWith<$Res> {
  __$GoalsListResponseCopyWithImpl(this._self, this._then);

  final _GoalsListResponse _self;
  final $Res Function(_GoalsListResponse) _then;

/// Create a copy of GoalsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goals = null,Object? summary = null,}) {
  return _then(_GoalsListResponse(
goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<Goal>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as GoalsSummary,
  ));
}

/// Create a copy of GoalsListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalsSummaryCopyWith<$Res> get summary {
  
  return $GoalsSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$CreateGoalResponse {

 Goal get goal;@JsonKey(name: 'first_contribution_scheduled') String get firstContributionScheduled;
/// Create a copy of CreateGoalResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateGoalResponseCopyWith<CreateGoalResponse> get copyWith => _$CreateGoalResponseCopyWithImpl<CreateGoalResponse>(this as CreateGoalResponse, _$identity);

  /// Serializes this CreateGoalResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateGoalResponse&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.firstContributionScheduled, firstContributionScheduled) || other.firstContributionScheduled == firstContributionScheduled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goal,firstContributionScheduled);

@override
String toString() {
  return 'CreateGoalResponse(goal: $goal, firstContributionScheduled: $firstContributionScheduled)';
}


}

/// @nodoc
abstract mixin class $CreateGoalResponseCopyWith<$Res>  {
  factory $CreateGoalResponseCopyWith(CreateGoalResponse value, $Res Function(CreateGoalResponse) _then) = _$CreateGoalResponseCopyWithImpl;
@useResult
$Res call({
 Goal goal,@JsonKey(name: 'first_contribution_scheduled') String firstContributionScheduled
});


$GoalCopyWith<$Res> get goal;

}
/// @nodoc
class _$CreateGoalResponseCopyWithImpl<$Res>
    implements $CreateGoalResponseCopyWith<$Res> {
  _$CreateGoalResponseCopyWithImpl(this._self, this._then);

  final CreateGoalResponse _self;
  final $Res Function(CreateGoalResponse) _then;

/// Create a copy of CreateGoalResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goal = null,Object? firstContributionScheduled = null,}) {
  return _then(_self.copyWith(
goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal,firstContributionScheduled: null == firstContributionScheduled ? _self.firstContributionScheduled : firstContributionScheduled // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CreateGoalResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalCopyWith<$Res> get goal {
  
  return $GoalCopyWith<$Res>(_self.goal, (value) {
    return _then(_self.copyWith(goal: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateGoalResponse].
extension CreateGoalResponsePatterns on CreateGoalResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateGoalResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateGoalResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateGoalResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateGoalResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateGoalResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateGoalResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Goal goal, @JsonKey(name: 'first_contribution_scheduled')  String firstContributionScheduled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateGoalResponse() when $default != null:
return $default(_that.goal,_that.firstContributionScheduled);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Goal goal, @JsonKey(name: 'first_contribution_scheduled')  String firstContributionScheduled)  $default,) {final _that = this;
switch (_that) {
case _CreateGoalResponse():
return $default(_that.goal,_that.firstContributionScheduled);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Goal goal, @JsonKey(name: 'first_contribution_scheduled')  String firstContributionScheduled)?  $default,) {final _that = this;
switch (_that) {
case _CreateGoalResponse() when $default != null:
return $default(_that.goal,_that.firstContributionScheduled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateGoalResponse implements CreateGoalResponse {
  const _CreateGoalResponse({required this.goal, @JsonKey(name: 'first_contribution_scheduled') required this.firstContributionScheduled});
  factory _CreateGoalResponse.fromJson(Map<String, dynamic> json) => _$CreateGoalResponseFromJson(json);

@override final  Goal goal;
@override@JsonKey(name: 'first_contribution_scheduled') final  String firstContributionScheduled;

/// Create a copy of CreateGoalResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateGoalResponseCopyWith<_CreateGoalResponse> get copyWith => __$CreateGoalResponseCopyWithImpl<_CreateGoalResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateGoalResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateGoalResponse&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.firstContributionScheduled, firstContributionScheduled) || other.firstContributionScheduled == firstContributionScheduled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goal,firstContributionScheduled);

@override
String toString() {
  return 'CreateGoalResponse(goal: $goal, firstContributionScheduled: $firstContributionScheduled)';
}


}

/// @nodoc
abstract mixin class _$CreateGoalResponseCopyWith<$Res> implements $CreateGoalResponseCopyWith<$Res> {
  factory _$CreateGoalResponseCopyWith(_CreateGoalResponse value, $Res Function(_CreateGoalResponse) _then) = __$CreateGoalResponseCopyWithImpl;
@override @useResult
$Res call({
 Goal goal,@JsonKey(name: 'first_contribution_scheduled') String firstContributionScheduled
});


@override $GoalCopyWith<$Res> get goal;

}
/// @nodoc
class __$CreateGoalResponseCopyWithImpl<$Res>
    implements _$CreateGoalResponseCopyWith<$Res> {
  __$CreateGoalResponseCopyWithImpl(this._self, this._then);

  final _CreateGoalResponse _self;
  final $Res Function(_CreateGoalResponse) _then;

/// Create a copy of CreateGoalResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goal = null,Object? firstContributionScheduled = null,}) {
  return _then(_CreateGoalResponse(
goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal,firstContributionScheduled: null == firstContributionScheduled ? _self.firstContributionScheduled : firstContributionScheduled // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CreateGoalResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalCopyWith<$Res> get goal {
  
  return $GoalCopyWith<$Res>(_self.goal, (value) {
    return _then(_self.copyWith(goal: value));
  });
}
}


/// @nodoc
mixin _$GoalDetailResponse {

 Goal get goal; List<GoalContribution> get contributions;@JsonKey(name: 'redeemable_products') List<Product> get redeemableProducts;
/// Create a copy of GoalDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalDetailResponseCopyWith<GoalDetailResponse> get copyWith => _$GoalDetailResponseCopyWithImpl<GoalDetailResponse>(this as GoalDetailResponse, _$identity);

  /// Serializes this GoalDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalDetailResponse&&(identical(other.goal, goal) || other.goal == goal)&&const DeepCollectionEquality().equals(other.contributions, contributions)&&const DeepCollectionEquality().equals(other.redeemableProducts, redeemableProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goal,const DeepCollectionEquality().hash(contributions),const DeepCollectionEquality().hash(redeemableProducts));

@override
String toString() {
  return 'GoalDetailResponse(goal: $goal, contributions: $contributions, redeemableProducts: $redeemableProducts)';
}


}

/// @nodoc
abstract mixin class $GoalDetailResponseCopyWith<$Res>  {
  factory $GoalDetailResponseCopyWith(GoalDetailResponse value, $Res Function(GoalDetailResponse) _then) = _$GoalDetailResponseCopyWithImpl;
@useResult
$Res call({
 Goal goal, List<GoalContribution> contributions,@JsonKey(name: 'redeemable_products') List<Product> redeemableProducts
});


$GoalCopyWith<$Res> get goal;

}
/// @nodoc
class _$GoalDetailResponseCopyWithImpl<$Res>
    implements $GoalDetailResponseCopyWith<$Res> {
  _$GoalDetailResponseCopyWithImpl(this._self, this._then);

  final GoalDetailResponse _self;
  final $Res Function(GoalDetailResponse) _then;

/// Create a copy of GoalDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goal = null,Object? contributions = null,Object? redeemableProducts = null,}) {
  return _then(_self.copyWith(
goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal,contributions: null == contributions ? _self.contributions : contributions // ignore: cast_nullable_to_non_nullable
as List<GoalContribution>,redeemableProducts: null == redeemableProducts ? _self.redeemableProducts : redeemableProducts // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}
/// Create a copy of GoalDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalCopyWith<$Res> get goal {
  
  return $GoalCopyWith<$Res>(_self.goal, (value) {
    return _then(_self.copyWith(goal: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoalDetailResponse].
extension GoalDetailResponsePatterns on GoalDetailResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalDetailResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _GoalDetailResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GoalDetailResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Goal goal,  List<GoalContribution> contributions, @JsonKey(name: 'redeemable_products')  List<Product> redeemableProducts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalDetailResponse() when $default != null:
return $default(_that.goal,_that.contributions,_that.redeemableProducts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Goal goal,  List<GoalContribution> contributions, @JsonKey(name: 'redeemable_products')  List<Product> redeemableProducts)  $default,) {final _that = this;
switch (_that) {
case _GoalDetailResponse():
return $default(_that.goal,_that.contributions,_that.redeemableProducts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Goal goal,  List<GoalContribution> contributions, @JsonKey(name: 'redeemable_products')  List<Product> redeemableProducts)?  $default,) {final _that = this;
switch (_that) {
case _GoalDetailResponse() when $default != null:
return $default(_that.goal,_that.contributions,_that.redeemableProducts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalDetailResponse implements GoalDetailResponse {
  const _GoalDetailResponse({required this.goal, required final  List<GoalContribution> contributions, @JsonKey(name: 'redeemable_products') required final  List<Product> redeemableProducts}): _contributions = contributions,_redeemableProducts = redeemableProducts;
  factory _GoalDetailResponse.fromJson(Map<String, dynamic> json) => _$GoalDetailResponseFromJson(json);

@override final  Goal goal;
 final  List<GoalContribution> _contributions;
@override List<GoalContribution> get contributions {
  if (_contributions is EqualUnmodifiableListView) return _contributions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contributions);
}

 final  List<Product> _redeemableProducts;
@override@JsonKey(name: 'redeemable_products') List<Product> get redeemableProducts {
  if (_redeemableProducts is EqualUnmodifiableListView) return _redeemableProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_redeemableProducts);
}


/// Create a copy of GoalDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalDetailResponseCopyWith<_GoalDetailResponse> get copyWith => __$GoalDetailResponseCopyWithImpl<_GoalDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalDetailResponse&&(identical(other.goal, goal) || other.goal == goal)&&const DeepCollectionEquality().equals(other._contributions, _contributions)&&const DeepCollectionEquality().equals(other._redeemableProducts, _redeemableProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goal,const DeepCollectionEquality().hash(_contributions),const DeepCollectionEquality().hash(_redeemableProducts));

@override
String toString() {
  return 'GoalDetailResponse(goal: $goal, contributions: $contributions, redeemableProducts: $redeemableProducts)';
}


}

/// @nodoc
abstract mixin class _$GoalDetailResponseCopyWith<$Res> implements $GoalDetailResponseCopyWith<$Res> {
  factory _$GoalDetailResponseCopyWith(_GoalDetailResponse value, $Res Function(_GoalDetailResponse) _then) = __$GoalDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 Goal goal, List<GoalContribution> contributions,@JsonKey(name: 'redeemable_products') List<Product> redeemableProducts
});


@override $GoalCopyWith<$Res> get goal;

}
/// @nodoc
class __$GoalDetailResponseCopyWithImpl<$Res>
    implements _$GoalDetailResponseCopyWith<$Res> {
  __$GoalDetailResponseCopyWithImpl(this._self, this._then);

  final _GoalDetailResponse _self;
  final $Res Function(_GoalDetailResponse) _then;

/// Create a copy of GoalDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goal = null,Object? contributions = null,Object? redeemableProducts = null,}) {
  return _then(_GoalDetailResponse(
goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal,contributions: null == contributions ? _self._contributions : contributions // ignore: cast_nullable_to_non_nullable
as List<GoalContribution>,redeemableProducts: null == redeemableProducts ? _self._redeemableProducts : redeemableProducts // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}

/// Create a copy of GoalDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalCopyWith<$Res> get goal {
  
  return $GoalCopyWith<$Res>(_self.goal, (value) {
    return _then(_self.copyWith(goal: value));
  });
}
}


/// @nodoc
mixin _$GoalContribution {

 String get id;@JsonKey(name: 'amount_paise') int get amountPaise;@JsonKey(name: 'grams_credited') String? get gramsCredited; String get type; String get status;@JsonKey(name: 'contribution_month') String get contributionMonth;@JsonKey(name: 'completed_at') String? get completedAt;
/// Create a copy of GoalContribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalContributionCopyWith<GoalContribution> get copyWith => _$GoalContributionCopyWithImpl<GoalContribution>(this as GoalContribution, _$identity);

  /// Serializes this GoalContribution to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalContribution&&(identical(other.id, id) || other.id == id)&&(identical(other.amountPaise, amountPaise) || other.amountPaise == amountPaise)&&(identical(other.gramsCredited, gramsCredited) || other.gramsCredited == gramsCredited)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.contributionMonth, contributionMonth) || other.contributionMonth == contributionMonth)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amountPaise,gramsCredited,type,status,contributionMonth,completedAt);

@override
String toString() {
  return 'GoalContribution(id: $id, amountPaise: $amountPaise, gramsCredited: $gramsCredited, type: $type, status: $status, contributionMonth: $contributionMonth, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $GoalContributionCopyWith<$Res>  {
  factory $GoalContributionCopyWith(GoalContribution value, $Res Function(GoalContribution) _then) = _$GoalContributionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'amount_paise') int amountPaise,@JsonKey(name: 'grams_credited') String? gramsCredited, String type, String status,@JsonKey(name: 'contribution_month') String contributionMonth,@JsonKey(name: 'completed_at') String? completedAt
});




}
/// @nodoc
class _$GoalContributionCopyWithImpl<$Res>
    implements $GoalContributionCopyWith<$Res> {
  _$GoalContributionCopyWithImpl(this._self, this._then);

  final GoalContribution _self;
  final $Res Function(GoalContribution) _then;

/// Create a copy of GoalContribution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amountPaise = null,Object? gramsCredited = freezed,Object? type = null,Object? status = null,Object? contributionMonth = null,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountPaise: null == amountPaise ? _self.amountPaise : amountPaise // ignore: cast_nullable_to_non_nullable
as int,gramsCredited: freezed == gramsCredited ? _self.gramsCredited : gramsCredited // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contributionMonth: null == contributionMonth ? _self.contributionMonth : contributionMonth // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalContribution].
extension GoalContributionPatterns on GoalContribution {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalContribution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalContribution() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalContribution value)  $default,){
final _that = this;
switch (_that) {
case _GoalContribution():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalContribution value)?  $default,){
final _that = this;
switch (_that) {
case _GoalContribution() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'grams_credited')  String? gramsCredited,  String type,  String status, @JsonKey(name: 'contribution_month')  String contributionMonth, @JsonKey(name: 'completed_at')  String? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalContribution() when $default != null:
return $default(_that.id,_that.amountPaise,_that.gramsCredited,_that.type,_that.status,_that.contributionMonth,_that.completedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'grams_credited')  String? gramsCredited,  String type,  String status, @JsonKey(name: 'contribution_month')  String contributionMonth, @JsonKey(name: 'completed_at')  String? completedAt)  $default,) {final _that = this;
switch (_that) {
case _GoalContribution():
return $default(_that.id,_that.amountPaise,_that.gramsCredited,_that.type,_that.status,_that.contributionMonth,_that.completedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'grams_credited')  String? gramsCredited,  String type,  String status, @JsonKey(name: 'contribution_month')  String contributionMonth, @JsonKey(name: 'completed_at')  String? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _GoalContribution() when $default != null:
return $default(_that.id,_that.amountPaise,_that.gramsCredited,_that.type,_that.status,_that.contributionMonth,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalContribution implements GoalContribution {
  const _GoalContribution({required this.id, @JsonKey(name: 'amount_paise') required this.amountPaise, @JsonKey(name: 'grams_credited') this.gramsCredited, required this.type, required this.status, @JsonKey(name: 'contribution_month') required this.contributionMonth, @JsonKey(name: 'completed_at') this.completedAt});
  factory _GoalContribution.fromJson(Map<String, dynamic> json) => _$GoalContributionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'amount_paise') final  int amountPaise;
@override@JsonKey(name: 'grams_credited') final  String? gramsCredited;
@override final  String type;
@override final  String status;
@override@JsonKey(name: 'contribution_month') final  String contributionMonth;
@override@JsonKey(name: 'completed_at') final  String? completedAt;

/// Create a copy of GoalContribution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalContributionCopyWith<_GoalContribution> get copyWith => __$GoalContributionCopyWithImpl<_GoalContribution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalContributionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalContribution&&(identical(other.id, id) || other.id == id)&&(identical(other.amountPaise, amountPaise) || other.amountPaise == amountPaise)&&(identical(other.gramsCredited, gramsCredited) || other.gramsCredited == gramsCredited)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.contributionMonth, contributionMonth) || other.contributionMonth == contributionMonth)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amountPaise,gramsCredited,type,status,contributionMonth,completedAt);

@override
String toString() {
  return 'GoalContribution(id: $id, amountPaise: $amountPaise, gramsCredited: $gramsCredited, type: $type, status: $status, contributionMonth: $contributionMonth, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$GoalContributionCopyWith<$Res> implements $GoalContributionCopyWith<$Res> {
  factory _$GoalContributionCopyWith(_GoalContribution value, $Res Function(_GoalContribution) _then) = __$GoalContributionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'amount_paise') int amountPaise,@JsonKey(name: 'grams_credited') String? gramsCredited, String type, String status,@JsonKey(name: 'contribution_month') String contributionMonth,@JsonKey(name: 'completed_at') String? completedAt
});




}
/// @nodoc
class __$GoalContributionCopyWithImpl<$Res>
    implements _$GoalContributionCopyWith<$Res> {
  __$GoalContributionCopyWithImpl(this._self, this._then);

  final _GoalContribution _self;
  final $Res Function(_GoalContribution) _then;

/// Create a copy of GoalContribution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountPaise = null,Object? gramsCredited = freezed,Object? type = null,Object? status = null,Object? contributionMonth = null,Object? completedAt = freezed,}) {
  return _then(_GoalContribution(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountPaise: null == amountPaise ? _self.amountPaise : amountPaise // ignore: cast_nullable_to_non_nullable
as int,gramsCredited: freezed == gramsCredited ? _self.gramsCredited : gramsCredited // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,contributionMonth: null == contributionMonth ? _self.contributionMonth : contributionMonth // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ContributeResponse {

 ContributionResult get contribution;@JsonKey(name: 'payment_required') bool get paymentRequired;@JsonKey(name: 'payment_session_id') String? get paymentSessionId;@JsonKey(name: 'razorpay_order_id') String? get razorpayOrderId;@JsonKey(name: 'razorpay_key_id') String? get razorpayKeyId;
/// Create a copy of ContributeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributeResponseCopyWith<ContributeResponse> get copyWith => _$ContributeResponseCopyWithImpl<ContributeResponse>(this as ContributeResponse, _$identity);

  /// Serializes this ContributeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributeResponse&&(identical(other.contribution, contribution) || other.contribution == contribution)&&(identical(other.paymentRequired, paymentRequired) || other.paymentRequired == paymentRequired)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.razorpayOrderId, razorpayOrderId) || other.razorpayOrderId == razorpayOrderId)&&(identical(other.razorpayKeyId, razorpayKeyId) || other.razorpayKeyId == razorpayKeyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contribution,paymentRequired,paymentSessionId,razorpayOrderId,razorpayKeyId);

@override
String toString() {
  return 'ContributeResponse(contribution: $contribution, paymentRequired: $paymentRequired, paymentSessionId: $paymentSessionId, razorpayOrderId: $razorpayOrderId, razorpayKeyId: $razorpayKeyId)';
}


}

/// @nodoc
abstract mixin class $ContributeResponseCopyWith<$Res>  {
  factory $ContributeResponseCopyWith(ContributeResponse value, $Res Function(ContributeResponse) _then) = _$ContributeResponseCopyWithImpl;
@useResult
$Res call({
 ContributionResult contribution,@JsonKey(name: 'payment_required') bool paymentRequired,@JsonKey(name: 'payment_session_id') String? paymentSessionId,@JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,@JsonKey(name: 'razorpay_key_id') String? razorpayKeyId
});


$ContributionResultCopyWith<$Res> get contribution;

}
/// @nodoc
class _$ContributeResponseCopyWithImpl<$Res>
    implements $ContributeResponseCopyWith<$Res> {
  _$ContributeResponseCopyWithImpl(this._self, this._then);

  final ContributeResponse _self;
  final $Res Function(ContributeResponse) _then;

/// Create a copy of ContributeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contribution = null,Object? paymentRequired = null,Object? paymentSessionId = freezed,Object? razorpayOrderId = freezed,Object? razorpayKeyId = freezed,}) {
  return _then(_self.copyWith(
contribution: null == contribution ? _self.contribution : contribution // ignore: cast_nullable_to_non_nullable
as ContributionResult,paymentRequired: null == paymentRequired ? _self.paymentRequired : paymentRequired // ignore: cast_nullable_to_non_nullable
as bool,paymentSessionId: freezed == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as String?,razorpayOrderId: freezed == razorpayOrderId ? _self.razorpayOrderId : razorpayOrderId // ignore: cast_nullable_to_non_nullable
as String?,razorpayKeyId: freezed == razorpayKeyId ? _self.razorpayKeyId : razorpayKeyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ContributeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContributionResultCopyWith<$Res> get contribution {
  
  return $ContributionResultCopyWith<$Res>(_self.contribution, (value) {
    return _then(_self.copyWith(contribution: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContributeResponse].
extension ContributeResponsePatterns on ContributeResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContributeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContributeResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContributeResponse value)  $default,){
final _that = this;
switch (_that) {
case _ContributeResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContributeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ContributeResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ContributionResult contribution, @JsonKey(name: 'payment_required')  bool paymentRequired, @JsonKey(name: 'payment_session_id')  String? paymentSessionId, @JsonKey(name: 'razorpay_order_id')  String? razorpayOrderId, @JsonKey(name: 'razorpay_key_id')  String? razorpayKeyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributeResponse() when $default != null:
return $default(_that.contribution,_that.paymentRequired,_that.paymentSessionId,_that.razorpayOrderId,_that.razorpayKeyId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ContributionResult contribution, @JsonKey(name: 'payment_required')  bool paymentRequired, @JsonKey(name: 'payment_session_id')  String? paymentSessionId, @JsonKey(name: 'razorpay_order_id')  String? razorpayOrderId, @JsonKey(name: 'razorpay_key_id')  String? razorpayKeyId)  $default,) {final _that = this;
switch (_that) {
case _ContributeResponse():
return $default(_that.contribution,_that.paymentRequired,_that.paymentSessionId,_that.razorpayOrderId,_that.razorpayKeyId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ContributionResult contribution, @JsonKey(name: 'payment_required')  bool paymentRequired, @JsonKey(name: 'payment_session_id')  String? paymentSessionId, @JsonKey(name: 'razorpay_order_id')  String? razorpayOrderId, @JsonKey(name: 'razorpay_key_id')  String? razorpayKeyId)?  $default,) {final _that = this;
switch (_that) {
case _ContributeResponse() when $default != null:
return $default(_that.contribution,_that.paymentRequired,_that.paymentSessionId,_that.razorpayOrderId,_that.razorpayKeyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContributeResponse implements ContributeResponse {
  const _ContributeResponse({required this.contribution, @JsonKey(name: 'payment_required') required this.paymentRequired, @JsonKey(name: 'payment_session_id') this.paymentSessionId, @JsonKey(name: 'razorpay_order_id') this.razorpayOrderId, @JsonKey(name: 'razorpay_key_id') this.razorpayKeyId});
  factory _ContributeResponse.fromJson(Map<String, dynamic> json) => _$ContributeResponseFromJson(json);

@override final  ContributionResult contribution;
@override@JsonKey(name: 'payment_required') final  bool paymentRequired;
@override@JsonKey(name: 'payment_session_id') final  String? paymentSessionId;
@override@JsonKey(name: 'razorpay_order_id') final  String? razorpayOrderId;
@override@JsonKey(name: 'razorpay_key_id') final  String? razorpayKeyId;

/// Create a copy of ContributeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributeResponseCopyWith<_ContributeResponse> get copyWith => __$ContributeResponseCopyWithImpl<_ContributeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContributeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributeResponse&&(identical(other.contribution, contribution) || other.contribution == contribution)&&(identical(other.paymentRequired, paymentRequired) || other.paymentRequired == paymentRequired)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.razorpayOrderId, razorpayOrderId) || other.razorpayOrderId == razorpayOrderId)&&(identical(other.razorpayKeyId, razorpayKeyId) || other.razorpayKeyId == razorpayKeyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contribution,paymentRequired,paymentSessionId,razorpayOrderId,razorpayKeyId);

@override
String toString() {
  return 'ContributeResponse(contribution: $contribution, paymentRequired: $paymentRequired, paymentSessionId: $paymentSessionId, razorpayOrderId: $razorpayOrderId, razorpayKeyId: $razorpayKeyId)';
}


}

/// @nodoc
abstract mixin class _$ContributeResponseCopyWith<$Res> implements $ContributeResponseCopyWith<$Res> {
  factory _$ContributeResponseCopyWith(_ContributeResponse value, $Res Function(_ContributeResponse) _then) = __$ContributeResponseCopyWithImpl;
@override @useResult
$Res call({
 ContributionResult contribution,@JsonKey(name: 'payment_required') bool paymentRequired,@JsonKey(name: 'payment_session_id') String? paymentSessionId,@JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,@JsonKey(name: 'razorpay_key_id') String? razorpayKeyId
});


@override $ContributionResultCopyWith<$Res> get contribution;

}
/// @nodoc
class __$ContributeResponseCopyWithImpl<$Res>
    implements _$ContributeResponseCopyWith<$Res> {
  __$ContributeResponseCopyWithImpl(this._self, this._then);

  final _ContributeResponse _self;
  final $Res Function(_ContributeResponse) _then;

/// Create a copy of ContributeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contribution = null,Object? paymentRequired = null,Object? paymentSessionId = freezed,Object? razorpayOrderId = freezed,Object? razorpayKeyId = freezed,}) {
  return _then(_ContributeResponse(
contribution: null == contribution ? _self.contribution : contribution // ignore: cast_nullable_to_non_nullable
as ContributionResult,paymentRequired: null == paymentRequired ? _self.paymentRequired : paymentRequired // ignore: cast_nullable_to_non_nullable
as bool,paymentSessionId: freezed == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as String?,razorpayOrderId: freezed == razorpayOrderId ? _self.razorpayOrderId : razorpayOrderId // ignore: cast_nullable_to_non_nullable
as String?,razorpayKeyId: freezed == razorpayKeyId ? _self.razorpayKeyId : razorpayKeyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ContributeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContributionResultCopyWith<$Res> get contribution {
  
  return $ContributionResultCopyWith<$Res>(_self.contribution, (value) {
    return _then(_self.copyWith(contribution: value));
  });
}
}


/// @nodoc
mixin _$ContributionResult {

 String get id; String get status;@JsonKey(name: 'amount_paise') int get amountPaise;@JsonKey(name: 'amount_display') String get amountDisplay;
/// Create a copy of ContributionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionResultCopyWith<ContributionResult> get copyWith => _$ContributionResultCopyWithImpl<ContributionResult>(this as ContributionResult, _$identity);

  /// Serializes this ContributionResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributionResult&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.amountPaise, amountPaise) || other.amountPaise == amountPaise)&&(identical(other.amountDisplay, amountDisplay) || other.amountDisplay == amountDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,amountPaise,amountDisplay);

@override
String toString() {
  return 'ContributionResult(id: $id, status: $status, amountPaise: $amountPaise, amountDisplay: $amountDisplay)';
}


}

/// @nodoc
abstract mixin class $ContributionResultCopyWith<$Res>  {
  factory $ContributionResultCopyWith(ContributionResult value, $Res Function(ContributionResult) _then) = _$ContributionResultCopyWithImpl;
@useResult
$Res call({
 String id, String status,@JsonKey(name: 'amount_paise') int amountPaise,@JsonKey(name: 'amount_display') String amountDisplay
});




}
/// @nodoc
class _$ContributionResultCopyWithImpl<$Res>
    implements $ContributionResultCopyWith<$Res> {
  _$ContributionResultCopyWithImpl(this._self, this._then);

  final ContributionResult _self;
  final $Res Function(ContributionResult) _then;

/// Create a copy of ContributionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? amountPaise = null,Object? amountDisplay = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,amountPaise: null == amountPaise ? _self.amountPaise : amountPaise // ignore: cast_nullable_to_non_nullable
as int,amountDisplay: null == amountDisplay ? _self.amountDisplay : amountDisplay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContributionResult].
extension ContributionResultPatterns on ContributionResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContributionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContributionResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContributionResult value)  $default,){
final _that = this;
switch (_that) {
case _ContributionResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContributionResult value)?  $default,){
final _that = this;
switch (_that) {
case _ContributionResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status, @JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'amount_display')  String amountDisplay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributionResult() when $default != null:
return $default(_that.id,_that.status,_that.amountPaise,_that.amountDisplay);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status, @JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'amount_display')  String amountDisplay)  $default,) {final _that = this;
switch (_that) {
case _ContributionResult():
return $default(_that.id,_that.status,_that.amountPaise,_that.amountDisplay);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status, @JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'amount_display')  String amountDisplay)?  $default,) {final _that = this;
switch (_that) {
case _ContributionResult() when $default != null:
return $default(_that.id,_that.status,_that.amountPaise,_that.amountDisplay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContributionResult implements ContributionResult {
  const _ContributionResult({required this.id, required this.status, @JsonKey(name: 'amount_paise') required this.amountPaise, @JsonKey(name: 'amount_display') required this.amountDisplay});
  factory _ContributionResult.fromJson(Map<String, dynamic> json) => _$ContributionResultFromJson(json);

@override final  String id;
@override final  String status;
@override@JsonKey(name: 'amount_paise') final  int amountPaise;
@override@JsonKey(name: 'amount_display') final  String amountDisplay;

/// Create a copy of ContributionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributionResultCopyWith<_ContributionResult> get copyWith => __$ContributionResultCopyWithImpl<_ContributionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContributionResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributionResult&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.amountPaise, amountPaise) || other.amountPaise == amountPaise)&&(identical(other.amountDisplay, amountDisplay) || other.amountDisplay == amountDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,amountPaise,amountDisplay);

@override
String toString() {
  return 'ContributionResult(id: $id, status: $status, amountPaise: $amountPaise, amountDisplay: $amountDisplay)';
}


}

/// @nodoc
abstract mixin class _$ContributionResultCopyWith<$Res> implements $ContributionResultCopyWith<$Res> {
  factory _$ContributionResultCopyWith(_ContributionResult value, $Res Function(_ContributionResult) _then) = __$ContributionResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String status,@JsonKey(name: 'amount_paise') int amountPaise,@JsonKey(name: 'amount_display') String amountDisplay
});




}
/// @nodoc
class __$ContributionResultCopyWithImpl<$Res>
    implements _$ContributionResultCopyWith<$Res> {
  __$ContributionResultCopyWithImpl(this._self, this._then);

  final _ContributionResult _self;
  final $Res Function(_ContributionResult) _then;

/// Create a copy of ContributionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? amountPaise = null,Object? amountDisplay = null,}) {
  return _then(_ContributionResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,amountPaise: null == amountPaise ? _self.amountPaise : amountPaise // ignore: cast_nullable_to_non_nullable
as int,amountDisplay: null == amountDisplay ? _self.amountDisplay : amountDisplay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CancelGoalResponse {

 bool get success;@JsonKey(name: 'gold_retained_grams') String get goldRetainedGrams; String get message;
/// Create a copy of CancelGoalResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelGoalResponseCopyWith<CancelGoalResponse> get copyWith => _$CancelGoalResponseCopyWithImpl<CancelGoalResponse>(this as CancelGoalResponse, _$identity);

  /// Serializes this CancelGoalResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelGoalResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.goldRetainedGrams, goldRetainedGrams) || other.goldRetainedGrams == goldRetainedGrams)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,goldRetainedGrams,message);

@override
String toString() {
  return 'CancelGoalResponse(success: $success, goldRetainedGrams: $goldRetainedGrams, message: $message)';
}


}

/// @nodoc
abstract mixin class $CancelGoalResponseCopyWith<$Res>  {
  factory $CancelGoalResponseCopyWith(CancelGoalResponse value, $Res Function(CancelGoalResponse) _then) = _$CancelGoalResponseCopyWithImpl;
@useResult
$Res call({
 bool success,@JsonKey(name: 'gold_retained_grams') String goldRetainedGrams, String message
});




}
/// @nodoc
class _$CancelGoalResponseCopyWithImpl<$Res>
    implements $CancelGoalResponseCopyWith<$Res> {
  _$CancelGoalResponseCopyWithImpl(this._self, this._then);

  final CancelGoalResponse _self;
  final $Res Function(CancelGoalResponse) _then;

/// Create a copy of CancelGoalResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? goldRetainedGrams = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,goldRetainedGrams: null == goldRetainedGrams ? _self.goldRetainedGrams : goldRetainedGrams // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CancelGoalResponse].
extension CancelGoalResponsePatterns on CancelGoalResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CancelGoalResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CancelGoalResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CancelGoalResponse value)  $default,){
final _that = this;
switch (_that) {
case _CancelGoalResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CancelGoalResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CancelGoalResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'gold_retained_grams')  String goldRetainedGrams,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CancelGoalResponse() when $default != null:
return $default(_that.success,_that.goldRetainedGrams,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'gold_retained_grams')  String goldRetainedGrams,  String message)  $default,) {final _that = this;
switch (_that) {
case _CancelGoalResponse():
return $default(_that.success,_that.goldRetainedGrams,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @JsonKey(name: 'gold_retained_grams')  String goldRetainedGrams,  String message)?  $default,) {final _that = this;
switch (_that) {
case _CancelGoalResponse() when $default != null:
return $default(_that.success,_that.goldRetainedGrams,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CancelGoalResponse implements CancelGoalResponse {
  const _CancelGoalResponse({required this.success, @JsonKey(name: 'gold_retained_grams') required this.goldRetainedGrams, required this.message});
  factory _CancelGoalResponse.fromJson(Map<String, dynamic> json) => _$CancelGoalResponseFromJson(json);

@override final  bool success;
@override@JsonKey(name: 'gold_retained_grams') final  String goldRetainedGrams;
@override final  String message;

/// Create a copy of CancelGoalResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelGoalResponseCopyWith<_CancelGoalResponse> get copyWith => __$CancelGoalResponseCopyWithImpl<_CancelGoalResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CancelGoalResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelGoalResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.goldRetainedGrams, goldRetainedGrams) || other.goldRetainedGrams == goldRetainedGrams)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,goldRetainedGrams,message);

@override
String toString() {
  return 'CancelGoalResponse(success: $success, goldRetainedGrams: $goldRetainedGrams, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CancelGoalResponseCopyWith<$Res> implements $CancelGoalResponseCopyWith<$Res> {
  factory _$CancelGoalResponseCopyWith(_CancelGoalResponse value, $Res Function(_CancelGoalResponse) _then) = __$CancelGoalResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success,@JsonKey(name: 'gold_retained_grams') String goldRetainedGrams, String message
});




}
/// @nodoc
class __$CancelGoalResponseCopyWithImpl<$Res>
    implements _$CancelGoalResponseCopyWith<$Res> {
  __$CancelGoalResponseCopyWithImpl(this._self, this._then);

  final _CancelGoalResponse _self;
  final $Res Function(_CancelGoalResponse) _then;

/// Create a copy of CancelGoalResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? goldRetainedGrams = null,Object? message = null,}) {
  return _then(_CancelGoalResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,goldRetainedGrams: null == goldRetainedGrams ? _self.goldRetainedGrams : goldRetainedGrams // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
