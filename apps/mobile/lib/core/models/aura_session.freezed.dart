// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aura_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuraInsightResponse {

@JsonKey(name: 'insight_text') String get insightText;@JsonKey(name: 'insight_type') String get insightType;@JsonKey(name: 'link_route') String get linkRoute; Map<String, dynamic>? get data;
/// Create a copy of AuraInsightResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraInsightResponseCopyWith<AuraInsightResponse> get copyWith => _$AuraInsightResponseCopyWithImpl<AuraInsightResponse>(this as AuraInsightResponse, _$identity);

  /// Serializes this AuraInsightResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraInsightResponse&&(identical(other.insightText, insightText) || other.insightText == insightText)&&(identical(other.insightType, insightType) || other.insightType == insightType)&&(identical(other.linkRoute, linkRoute) || other.linkRoute == linkRoute)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,insightText,insightType,linkRoute,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AuraInsightResponse(insightText: $insightText, insightType: $insightType, linkRoute: $linkRoute, data: $data)';
}


}

/// @nodoc
abstract mixin class $AuraInsightResponseCopyWith<$Res>  {
  factory $AuraInsightResponseCopyWith(AuraInsightResponse value, $Res Function(AuraInsightResponse) _then) = _$AuraInsightResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'insight_text') String insightText,@JsonKey(name: 'insight_type') String insightType,@JsonKey(name: 'link_route') String linkRoute, Map<String, dynamic>? data
});




}
/// @nodoc
class _$AuraInsightResponseCopyWithImpl<$Res>
    implements $AuraInsightResponseCopyWith<$Res> {
  _$AuraInsightResponseCopyWithImpl(this._self, this._then);

  final AuraInsightResponse _self;
  final $Res Function(AuraInsightResponse) _then;

/// Create a copy of AuraInsightResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? insightText = null,Object? insightType = null,Object? linkRoute = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
insightText: null == insightText ? _self.insightText : insightText // ignore: cast_nullable_to_non_nullable
as String,insightType: null == insightType ? _self.insightType : insightType // ignore: cast_nullable_to_non_nullable
as String,linkRoute: null == linkRoute ? _self.linkRoute : linkRoute // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuraInsightResponse].
extension AuraInsightResponsePatterns on AuraInsightResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraInsightResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraInsightResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraInsightResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuraInsightResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraInsightResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuraInsightResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'insight_text')  String insightText, @JsonKey(name: 'insight_type')  String insightType, @JsonKey(name: 'link_route')  String linkRoute,  Map<String, dynamic>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraInsightResponse() when $default != null:
return $default(_that.insightText,_that.insightType,_that.linkRoute,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'insight_text')  String insightText, @JsonKey(name: 'insight_type')  String insightType, @JsonKey(name: 'link_route')  String linkRoute,  Map<String, dynamic>? data)  $default,) {final _that = this;
switch (_that) {
case _AuraInsightResponse():
return $default(_that.insightText,_that.insightType,_that.linkRoute,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'insight_text')  String insightText, @JsonKey(name: 'insight_type')  String insightType, @JsonKey(name: 'link_route')  String linkRoute,  Map<String, dynamic>? data)?  $default,) {final _that = this;
switch (_that) {
case _AuraInsightResponse() when $default != null:
return $default(_that.insightText,_that.insightType,_that.linkRoute,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuraInsightResponse implements AuraInsightResponse {
  const _AuraInsightResponse({@JsonKey(name: 'insight_text') required this.insightText, @JsonKey(name: 'insight_type') required this.insightType, @JsonKey(name: 'link_route') required this.linkRoute, final  Map<String, dynamic>? data}): _data = data;
  factory _AuraInsightResponse.fromJson(Map<String, dynamic> json) => _$AuraInsightResponseFromJson(json);

@override@JsonKey(name: 'insight_text') final  String insightText;
@override@JsonKey(name: 'insight_type') final  String insightType;
@override@JsonKey(name: 'link_route') final  String linkRoute;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AuraInsightResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraInsightResponseCopyWith<_AuraInsightResponse> get copyWith => __$AuraInsightResponseCopyWithImpl<_AuraInsightResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuraInsightResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraInsightResponse&&(identical(other.insightText, insightText) || other.insightText == insightText)&&(identical(other.insightType, insightType) || other.insightType == insightType)&&(identical(other.linkRoute, linkRoute) || other.linkRoute == linkRoute)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,insightText,insightType,linkRoute,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'AuraInsightResponse(insightText: $insightText, insightType: $insightType, linkRoute: $linkRoute, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AuraInsightResponseCopyWith<$Res> implements $AuraInsightResponseCopyWith<$Res> {
  factory _$AuraInsightResponseCopyWith(_AuraInsightResponse value, $Res Function(_AuraInsightResponse) _then) = __$AuraInsightResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'insight_text') String insightText,@JsonKey(name: 'insight_type') String insightType,@JsonKey(name: 'link_route') String linkRoute, Map<String, dynamic>? data
});




}
/// @nodoc
class __$AuraInsightResponseCopyWithImpl<$Res>
    implements _$AuraInsightResponseCopyWith<$Res> {
  __$AuraInsightResponseCopyWithImpl(this._self, this._then);

  final _AuraInsightResponse _self;
  final $Res Function(_AuraInsightResponse) _then;

/// Create a copy of AuraInsightResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? insightText = null,Object? insightType = null,Object? linkRoute = null,Object? data = freezed,}) {
  return _then(_AuraInsightResponse(
insightText: null == insightText ? _self.insightText : insightText // ignore: cast_nullable_to_non_nullable
as String,insightType: null == insightType ? _self.insightType : insightType // ignore: cast_nullable_to_non_nullable
as String,linkRoute: null == linkRoute ? _self.linkRoute : linkRoute // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$AuraPlanDetails {

 String get occasion;@JsonKey(name: 'target_date') String get targetDate;@JsonKey(name: 'budget_display') String get budgetDisplay;@JsonKey(name: 'suggested_monthly_display') String get suggestedMonthlyDisplay;@JsonKey(name: 'duration_months') int get durationMonths; String get rationale;
/// Create a copy of AuraPlanDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraPlanDetailsCopyWith<AuraPlanDetails> get copyWith => _$AuraPlanDetailsCopyWithImpl<AuraPlanDetails>(this as AuraPlanDetails, _$identity);

  /// Serializes this AuraPlanDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraPlanDetails&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.budgetDisplay, budgetDisplay) || other.budgetDisplay == budgetDisplay)&&(identical(other.suggestedMonthlyDisplay, suggestedMonthlyDisplay) || other.suggestedMonthlyDisplay == suggestedMonthlyDisplay)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.rationale, rationale) || other.rationale == rationale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,occasion,targetDate,budgetDisplay,suggestedMonthlyDisplay,durationMonths,rationale);

@override
String toString() {
  return 'AuraPlanDetails(occasion: $occasion, targetDate: $targetDate, budgetDisplay: $budgetDisplay, suggestedMonthlyDisplay: $suggestedMonthlyDisplay, durationMonths: $durationMonths, rationale: $rationale)';
}


}

/// @nodoc
abstract mixin class $AuraPlanDetailsCopyWith<$Res>  {
  factory $AuraPlanDetailsCopyWith(AuraPlanDetails value, $Res Function(AuraPlanDetails) _then) = _$AuraPlanDetailsCopyWithImpl;
@useResult
$Res call({
 String occasion,@JsonKey(name: 'target_date') String targetDate,@JsonKey(name: 'budget_display') String budgetDisplay,@JsonKey(name: 'suggested_monthly_display') String suggestedMonthlyDisplay,@JsonKey(name: 'duration_months') int durationMonths, String rationale
});




}
/// @nodoc
class _$AuraPlanDetailsCopyWithImpl<$Res>
    implements $AuraPlanDetailsCopyWith<$Res> {
  _$AuraPlanDetailsCopyWithImpl(this._self, this._then);

  final AuraPlanDetails _self;
  final $Res Function(AuraPlanDetails) _then;

/// Create a copy of AuraPlanDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? occasion = null,Object? targetDate = null,Object? budgetDisplay = null,Object? suggestedMonthlyDisplay = null,Object? durationMonths = null,Object? rationale = null,}) {
  return _then(_self.copyWith(
occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as String,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as String,budgetDisplay: null == budgetDisplay ? _self.budgetDisplay : budgetDisplay // ignore: cast_nullable_to_non_nullable
as String,suggestedMonthlyDisplay: null == suggestedMonthlyDisplay ? _self.suggestedMonthlyDisplay : suggestedMonthlyDisplay // ignore: cast_nullable_to_non_nullable
as String,durationMonths: null == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int,rationale: null == rationale ? _self.rationale : rationale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuraPlanDetails].
extension AuraPlanDetailsPatterns on AuraPlanDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraPlanDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraPlanDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraPlanDetails value)  $default,){
final _that = this;
switch (_that) {
case _AuraPlanDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraPlanDetails value)?  $default,){
final _that = this;
switch (_that) {
case _AuraPlanDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String occasion, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'budget_display')  String budgetDisplay, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'duration_months')  int durationMonths,  String rationale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraPlanDetails() when $default != null:
return $default(_that.occasion,_that.targetDate,_that.budgetDisplay,_that.suggestedMonthlyDisplay,_that.durationMonths,_that.rationale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String occasion, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'budget_display')  String budgetDisplay, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'duration_months')  int durationMonths,  String rationale)  $default,) {final _that = this;
switch (_that) {
case _AuraPlanDetails():
return $default(_that.occasion,_that.targetDate,_that.budgetDisplay,_that.suggestedMonthlyDisplay,_that.durationMonths,_that.rationale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String occasion, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'budget_display')  String budgetDisplay, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'duration_months')  int durationMonths,  String rationale)?  $default,) {final _that = this;
switch (_that) {
case _AuraPlanDetails() when $default != null:
return $default(_that.occasion,_that.targetDate,_that.budgetDisplay,_that.suggestedMonthlyDisplay,_that.durationMonths,_that.rationale);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuraPlanDetails implements AuraPlanDetails {
  const _AuraPlanDetails({required this.occasion, @JsonKey(name: 'target_date') required this.targetDate, @JsonKey(name: 'budget_display') required this.budgetDisplay, @JsonKey(name: 'suggested_monthly_display') required this.suggestedMonthlyDisplay, @JsonKey(name: 'duration_months') required this.durationMonths, required this.rationale});
  factory _AuraPlanDetails.fromJson(Map<String, dynamic> json) => _$AuraPlanDetailsFromJson(json);

@override final  String occasion;
@override@JsonKey(name: 'target_date') final  String targetDate;
@override@JsonKey(name: 'budget_display') final  String budgetDisplay;
@override@JsonKey(name: 'suggested_monthly_display') final  String suggestedMonthlyDisplay;
@override@JsonKey(name: 'duration_months') final  int durationMonths;
@override final  String rationale;

/// Create a copy of AuraPlanDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraPlanDetailsCopyWith<_AuraPlanDetails> get copyWith => __$AuraPlanDetailsCopyWithImpl<_AuraPlanDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuraPlanDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraPlanDetails&&(identical(other.occasion, occasion) || other.occasion == occasion)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.budgetDisplay, budgetDisplay) || other.budgetDisplay == budgetDisplay)&&(identical(other.suggestedMonthlyDisplay, suggestedMonthlyDisplay) || other.suggestedMonthlyDisplay == suggestedMonthlyDisplay)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.rationale, rationale) || other.rationale == rationale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,occasion,targetDate,budgetDisplay,suggestedMonthlyDisplay,durationMonths,rationale);

@override
String toString() {
  return 'AuraPlanDetails(occasion: $occasion, targetDate: $targetDate, budgetDisplay: $budgetDisplay, suggestedMonthlyDisplay: $suggestedMonthlyDisplay, durationMonths: $durationMonths, rationale: $rationale)';
}


}

/// @nodoc
abstract mixin class _$AuraPlanDetailsCopyWith<$Res> implements $AuraPlanDetailsCopyWith<$Res> {
  factory _$AuraPlanDetailsCopyWith(_AuraPlanDetails value, $Res Function(_AuraPlanDetails) _then) = __$AuraPlanDetailsCopyWithImpl;
@override @useResult
$Res call({
 String occasion,@JsonKey(name: 'target_date') String targetDate,@JsonKey(name: 'budget_display') String budgetDisplay,@JsonKey(name: 'suggested_monthly_display') String suggestedMonthlyDisplay,@JsonKey(name: 'duration_months') int durationMonths, String rationale
});




}
/// @nodoc
class __$AuraPlanDetailsCopyWithImpl<$Res>
    implements _$AuraPlanDetailsCopyWith<$Res> {
  __$AuraPlanDetailsCopyWithImpl(this._self, this._then);

  final _AuraPlanDetails _self;
  final $Res Function(_AuraPlanDetails) _then;

/// Create a copy of AuraPlanDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? occasion = null,Object? targetDate = null,Object? budgetDisplay = null,Object? suggestedMonthlyDisplay = null,Object? durationMonths = null,Object? rationale = null,}) {
  return _then(_AuraPlanDetails(
occasion: null == occasion ? _self.occasion : occasion // ignore: cast_nullable_to_non_nullable
as String,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as String,budgetDisplay: null == budgetDisplay ? _self.budgetDisplay : budgetDisplay // ignore: cast_nullable_to_non_nullable
as String,suggestedMonthlyDisplay: null == suggestedMonthlyDisplay ? _self.suggestedMonthlyDisplay : suggestedMonthlyDisplay // ignore: cast_nullable_to_non_nullable
as String,durationMonths: null == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int,rationale: null == rationale ? _self.rationale : rationale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuraPlanResponse {

 AuraPlanDetails get plan;@JsonKey(name: 'recommended_products') List<Product> get recommendedProducts;@JsonKey(name: 'context_summary') Map<String, dynamic>? get contextSummary;
/// Create a copy of AuraPlanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraPlanResponseCopyWith<AuraPlanResponse> get copyWith => _$AuraPlanResponseCopyWithImpl<AuraPlanResponse>(this as AuraPlanResponse, _$identity);

  /// Serializes this AuraPlanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraPlanResponse&&(identical(other.plan, plan) || other.plan == plan)&&const DeepCollectionEquality().equals(other.recommendedProducts, recommendedProducts)&&const DeepCollectionEquality().equals(other.contextSummary, contextSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plan,const DeepCollectionEquality().hash(recommendedProducts),const DeepCollectionEquality().hash(contextSummary));

@override
String toString() {
  return 'AuraPlanResponse(plan: $plan, recommendedProducts: $recommendedProducts, contextSummary: $contextSummary)';
}


}

/// @nodoc
abstract mixin class $AuraPlanResponseCopyWith<$Res>  {
  factory $AuraPlanResponseCopyWith(AuraPlanResponse value, $Res Function(AuraPlanResponse) _then) = _$AuraPlanResponseCopyWithImpl;
@useResult
$Res call({
 AuraPlanDetails plan,@JsonKey(name: 'recommended_products') List<Product> recommendedProducts,@JsonKey(name: 'context_summary') Map<String, dynamic>? contextSummary
});


$AuraPlanDetailsCopyWith<$Res> get plan;

}
/// @nodoc
class _$AuraPlanResponseCopyWithImpl<$Res>
    implements $AuraPlanResponseCopyWith<$Res> {
  _$AuraPlanResponseCopyWithImpl(this._self, this._then);

  final AuraPlanResponse _self;
  final $Res Function(AuraPlanResponse) _then;

/// Create a copy of AuraPlanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plan = null,Object? recommendedProducts = null,Object? contextSummary = freezed,}) {
  return _then(_self.copyWith(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as AuraPlanDetails,recommendedProducts: null == recommendedProducts ? _self.recommendedProducts : recommendedProducts // ignore: cast_nullable_to_non_nullable
as List<Product>,contextSummary: freezed == contextSummary ? _self.contextSummary : contextSummary // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of AuraPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraPlanDetailsCopyWith<$Res> get plan {
  
  return $AuraPlanDetailsCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuraPlanResponse].
extension AuraPlanResponsePatterns on AuraPlanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraPlanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraPlanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraPlanResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuraPlanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraPlanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuraPlanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuraPlanDetails plan, @JsonKey(name: 'recommended_products')  List<Product> recommendedProducts, @JsonKey(name: 'context_summary')  Map<String, dynamic>? contextSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraPlanResponse() when $default != null:
return $default(_that.plan,_that.recommendedProducts,_that.contextSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuraPlanDetails plan, @JsonKey(name: 'recommended_products')  List<Product> recommendedProducts, @JsonKey(name: 'context_summary')  Map<String, dynamic>? contextSummary)  $default,) {final _that = this;
switch (_that) {
case _AuraPlanResponse():
return $default(_that.plan,_that.recommendedProducts,_that.contextSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuraPlanDetails plan, @JsonKey(name: 'recommended_products')  List<Product> recommendedProducts, @JsonKey(name: 'context_summary')  Map<String, dynamic>? contextSummary)?  $default,) {final _that = this;
switch (_that) {
case _AuraPlanResponse() when $default != null:
return $default(_that.plan,_that.recommendedProducts,_that.contextSummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuraPlanResponse implements AuraPlanResponse {
  const _AuraPlanResponse({required this.plan, @JsonKey(name: 'recommended_products') required final  List<Product> recommendedProducts, @JsonKey(name: 'context_summary') final  Map<String, dynamic>? contextSummary}): _recommendedProducts = recommendedProducts,_contextSummary = contextSummary;
  factory _AuraPlanResponse.fromJson(Map<String, dynamic> json) => _$AuraPlanResponseFromJson(json);

@override final  AuraPlanDetails plan;
 final  List<Product> _recommendedProducts;
@override@JsonKey(name: 'recommended_products') List<Product> get recommendedProducts {
  if (_recommendedProducts is EqualUnmodifiableListView) return _recommendedProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendedProducts);
}

 final  Map<String, dynamic>? _contextSummary;
@override@JsonKey(name: 'context_summary') Map<String, dynamic>? get contextSummary {
  final value = _contextSummary;
  if (value == null) return null;
  if (_contextSummary is EqualUnmodifiableMapView) return _contextSummary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AuraPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraPlanResponseCopyWith<_AuraPlanResponse> get copyWith => __$AuraPlanResponseCopyWithImpl<_AuraPlanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuraPlanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraPlanResponse&&(identical(other.plan, plan) || other.plan == plan)&&const DeepCollectionEquality().equals(other._recommendedProducts, _recommendedProducts)&&const DeepCollectionEquality().equals(other._contextSummary, _contextSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plan,const DeepCollectionEquality().hash(_recommendedProducts),const DeepCollectionEquality().hash(_contextSummary));

@override
String toString() {
  return 'AuraPlanResponse(plan: $plan, recommendedProducts: $recommendedProducts, contextSummary: $contextSummary)';
}


}

/// @nodoc
abstract mixin class _$AuraPlanResponseCopyWith<$Res> implements $AuraPlanResponseCopyWith<$Res> {
  factory _$AuraPlanResponseCopyWith(_AuraPlanResponse value, $Res Function(_AuraPlanResponse) _then) = __$AuraPlanResponseCopyWithImpl;
@override @useResult
$Res call({
 AuraPlanDetails plan,@JsonKey(name: 'recommended_products') List<Product> recommendedProducts,@JsonKey(name: 'context_summary') Map<String, dynamic>? contextSummary
});


@override $AuraPlanDetailsCopyWith<$Res> get plan;

}
/// @nodoc
class __$AuraPlanResponseCopyWithImpl<$Res>
    implements _$AuraPlanResponseCopyWith<$Res> {
  __$AuraPlanResponseCopyWithImpl(this._self, this._then);

  final _AuraPlanResponse _self;
  final $Res Function(_AuraPlanResponse) _then;

/// Create a copy of AuraPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plan = null,Object? recommendedProducts = null,Object? contextSummary = freezed,}) {
  return _then(_AuraPlanResponse(
plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as AuraPlanDetails,recommendedProducts: null == recommendedProducts ? _self._recommendedProducts : recommendedProducts // ignore: cast_nullable_to_non_nullable
as List<Product>,contextSummary: freezed == contextSummary ? _self._contextSummary : contextSummary // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of AuraPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraPlanDetailsCopyWith<$Res> get plan {
  
  return $AuraPlanDetailsCopyWith<$Res>(_self.plan, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}


/// @nodoc
mixin _$AuraDiscoverFilters {

@JsonKey(name: 'in_stock_only') bool get inStockOnly;@JsonKey(name: 'budget_paise') int get budgetPaise;@JsonKey(name: 'budget_ceiling_paise') int get budgetCeilingPaise;
/// Create a copy of AuraDiscoverFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraDiscoverFiltersCopyWith<AuraDiscoverFilters> get copyWith => _$AuraDiscoverFiltersCopyWithImpl<AuraDiscoverFilters>(this as AuraDiscoverFilters, _$identity);

  /// Serializes this AuraDiscoverFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraDiscoverFilters&&(identical(other.inStockOnly, inStockOnly) || other.inStockOnly == inStockOnly)&&(identical(other.budgetPaise, budgetPaise) || other.budgetPaise == budgetPaise)&&(identical(other.budgetCeilingPaise, budgetCeilingPaise) || other.budgetCeilingPaise == budgetCeilingPaise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inStockOnly,budgetPaise,budgetCeilingPaise);

@override
String toString() {
  return 'AuraDiscoverFilters(inStockOnly: $inStockOnly, budgetPaise: $budgetPaise, budgetCeilingPaise: $budgetCeilingPaise)';
}


}

/// @nodoc
abstract mixin class $AuraDiscoverFiltersCopyWith<$Res>  {
  factory $AuraDiscoverFiltersCopyWith(AuraDiscoverFilters value, $Res Function(AuraDiscoverFilters) _then) = _$AuraDiscoverFiltersCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'in_stock_only') bool inStockOnly,@JsonKey(name: 'budget_paise') int budgetPaise,@JsonKey(name: 'budget_ceiling_paise') int budgetCeilingPaise
});




}
/// @nodoc
class _$AuraDiscoverFiltersCopyWithImpl<$Res>
    implements $AuraDiscoverFiltersCopyWith<$Res> {
  _$AuraDiscoverFiltersCopyWithImpl(this._self, this._then);

  final AuraDiscoverFilters _self;
  final $Res Function(AuraDiscoverFilters) _then;

/// Create a copy of AuraDiscoverFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inStockOnly = null,Object? budgetPaise = null,Object? budgetCeilingPaise = null,}) {
  return _then(_self.copyWith(
inStockOnly: null == inStockOnly ? _self.inStockOnly : inStockOnly // ignore: cast_nullable_to_non_nullable
as bool,budgetPaise: null == budgetPaise ? _self.budgetPaise : budgetPaise // ignore: cast_nullable_to_non_nullable
as int,budgetCeilingPaise: null == budgetCeilingPaise ? _self.budgetCeilingPaise : budgetCeilingPaise // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AuraDiscoverFilters].
extension AuraDiscoverFiltersPatterns on AuraDiscoverFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraDiscoverFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraDiscoverFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraDiscoverFilters value)  $default,){
final _that = this;
switch (_that) {
case _AuraDiscoverFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraDiscoverFilters value)?  $default,){
final _that = this;
switch (_that) {
case _AuraDiscoverFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'in_stock_only')  bool inStockOnly, @JsonKey(name: 'budget_paise')  int budgetPaise, @JsonKey(name: 'budget_ceiling_paise')  int budgetCeilingPaise)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraDiscoverFilters() when $default != null:
return $default(_that.inStockOnly,_that.budgetPaise,_that.budgetCeilingPaise);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'in_stock_only')  bool inStockOnly, @JsonKey(name: 'budget_paise')  int budgetPaise, @JsonKey(name: 'budget_ceiling_paise')  int budgetCeilingPaise)  $default,) {final _that = this;
switch (_that) {
case _AuraDiscoverFilters():
return $default(_that.inStockOnly,_that.budgetPaise,_that.budgetCeilingPaise);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'in_stock_only')  bool inStockOnly, @JsonKey(name: 'budget_paise')  int budgetPaise, @JsonKey(name: 'budget_ceiling_paise')  int budgetCeilingPaise)?  $default,) {final _that = this;
switch (_that) {
case _AuraDiscoverFilters() when $default != null:
return $default(_that.inStockOnly,_that.budgetPaise,_that.budgetCeilingPaise);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuraDiscoverFilters implements AuraDiscoverFilters {
  const _AuraDiscoverFilters({@JsonKey(name: 'in_stock_only') required this.inStockOnly, @JsonKey(name: 'budget_paise') required this.budgetPaise, @JsonKey(name: 'budget_ceiling_paise') required this.budgetCeilingPaise});
  factory _AuraDiscoverFilters.fromJson(Map<String, dynamic> json) => _$AuraDiscoverFiltersFromJson(json);

@override@JsonKey(name: 'in_stock_only') final  bool inStockOnly;
@override@JsonKey(name: 'budget_paise') final  int budgetPaise;
@override@JsonKey(name: 'budget_ceiling_paise') final  int budgetCeilingPaise;

/// Create a copy of AuraDiscoverFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraDiscoverFiltersCopyWith<_AuraDiscoverFilters> get copyWith => __$AuraDiscoverFiltersCopyWithImpl<_AuraDiscoverFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuraDiscoverFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraDiscoverFilters&&(identical(other.inStockOnly, inStockOnly) || other.inStockOnly == inStockOnly)&&(identical(other.budgetPaise, budgetPaise) || other.budgetPaise == budgetPaise)&&(identical(other.budgetCeilingPaise, budgetCeilingPaise) || other.budgetCeilingPaise == budgetCeilingPaise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inStockOnly,budgetPaise,budgetCeilingPaise);

@override
String toString() {
  return 'AuraDiscoverFilters(inStockOnly: $inStockOnly, budgetPaise: $budgetPaise, budgetCeilingPaise: $budgetCeilingPaise)';
}


}

/// @nodoc
abstract mixin class _$AuraDiscoverFiltersCopyWith<$Res> implements $AuraDiscoverFiltersCopyWith<$Res> {
  factory _$AuraDiscoverFiltersCopyWith(_AuraDiscoverFilters value, $Res Function(_AuraDiscoverFilters) _then) = __$AuraDiscoverFiltersCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'in_stock_only') bool inStockOnly,@JsonKey(name: 'budget_paise') int budgetPaise,@JsonKey(name: 'budget_ceiling_paise') int budgetCeilingPaise
});




}
/// @nodoc
class __$AuraDiscoverFiltersCopyWithImpl<$Res>
    implements _$AuraDiscoverFiltersCopyWith<$Res> {
  __$AuraDiscoverFiltersCopyWithImpl(this._self, this._then);

  final _AuraDiscoverFilters _self;
  final $Res Function(_AuraDiscoverFilters) _then;

/// Create a copy of AuraDiscoverFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inStockOnly = null,Object? budgetPaise = null,Object? budgetCeilingPaise = null,}) {
  return _then(_AuraDiscoverFilters(
inStockOnly: null == inStockOnly ? _self.inStockOnly : inStockOnly // ignore: cast_nullable_to_non_nullable
as bool,budgetPaise: null == budgetPaise ? _self.budgetPaise : budgetPaise // ignore: cast_nullable_to_non_nullable
as int,budgetCeilingPaise: null == budgetCeilingPaise ? _self.budgetCeilingPaise : budgetCeilingPaise // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AuraDiscoverResponse {

 String get intro; List<Product> get products;@JsonKey(name: 'filters_applied') AuraDiscoverFilters get filtersApplied;
/// Create a copy of AuraDiscoverResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraDiscoverResponseCopyWith<AuraDiscoverResponse> get copyWith => _$AuraDiscoverResponseCopyWithImpl<AuraDiscoverResponse>(this as AuraDiscoverResponse, _$identity);

  /// Serializes this AuraDiscoverResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraDiscoverResponse&&(identical(other.intro, intro) || other.intro == intro)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.filtersApplied, filtersApplied) || other.filtersApplied == filtersApplied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,intro,const DeepCollectionEquality().hash(products),filtersApplied);

@override
String toString() {
  return 'AuraDiscoverResponse(intro: $intro, products: $products, filtersApplied: $filtersApplied)';
}


}

/// @nodoc
abstract mixin class $AuraDiscoverResponseCopyWith<$Res>  {
  factory $AuraDiscoverResponseCopyWith(AuraDiscoverResponse value, $Res Function(AuraDiscoverResponse) _then) = _$AuraDiscoverResponseCopyWithImpl;
@useResult
$Res call({
 String intro, List<Product> products,@JsonKey(name: 'filters_applied') AuraDiscoverFilters filtersApplied
});


$AuraDiscoverFiltersCopyWith<$Res> get filtersApplied;

}
/// @nodoc
class _$AuraDiscoverResponseCopyWithImpl<$Res>
    implements $AuraDiscoverResponseCopyWith<$Res> {
  _$AuraDiscoverResponseCopyWithImpl(this._self, this._then);

  final AuraDiscoverResponse _self;
  final $Res Function(AuraDiscoverResponse) _then;

/// Create a copy of AuraDiscoverResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intro = null,Object? products = null,Object? filtersApplied = null,}) {
  return _then(_self.copyWith(
intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,filtersApplied: null == filtersApplied ? _self.filtersApplied : filtersApplied // ignore: cast_nullable_to_non_nullable
as AuraDiscoverFilters,
  ));
}
/// Create a copy of AuraDiscoverResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraDiscoverFiltersCopyWith<$Res> get filtersApplied {
  
  return $AuraDiscoverFiltersCopyWith<$Res>(_self.filtersApplied, (value) {
    return _then(_self.copyWith(filtersApplied: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuraDiscoverResponse].
extension AuraDiscoverResponsePatterns on AuraDiscoverResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraDiscoverResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraDiscoverResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraDiscoverResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuraDiscoverResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraDiscoverResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuraDiscoverResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String intro,  List<Product> products, @JsonKey(name: 'filters_applied')  AuraDiscoverFilters filtersApplied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraDiscoverResponse() when $default != null:
return $default(_that.intro,_that.products,_that.filtersApplied);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String intro,  List<Product> products, @JsonKey(name: 'filters_applied')  AuraDiscoverFilters filtersApplied)  $default,) {final _that = this;
switch (_that) {
case _AuraDiscoverResponse():
return $default(_that.intro,_that.products,_that.filtersApplied);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String intro,  List<Product> products, @JsonKey(name: 'filters_applied')  AuraDiscoverFilters filtersApplied)?  $default,) {final _that = this;
switch (_that) {
case _AuraDiscoverResponse() when $default != null:
return $default(_that.intro,_that.products,_that.filtersApplied);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuraDiscoverResponse implements AuraDiscoverResponse {
  const _AuraDiscoverResponse({required this.intro, required final  List<Product> products, @JsonKey(name: 'filters_applied') required this.filtersApplied}): _products = products;
  factory _AuraDiscoverResponse.fromJson(Map<String, dynamic> json) => _$AuraDiscoverResponseFromJson(json);

@override final  String intro;
 final  List<Product> _products;
@override List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey(name: 'filters_applied') final  AuraDiscoverFilters filtersApplied;

/// Create a copy of AuraDiscoverResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraDiscoverResponseCopyWith<_AuraDiscoverResponse> get copyWith => __$AuraDiscoverResponseCopyWithImpl<_AuraDiscoverResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuraDiscoverResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraDiscoverResponse&&(identical(other.intro, intro) || other.intro == intro)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.filtersApplied, filtersApplied) || other.filtersApplied == filtersApplied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,intro,const DeepCollectionEquality().hash(_products),filtersApplied);

@override
String toString() {
  return 'AuraDiscoverResponse(intro: $intro, products: $products, filtersApplied: $filtersApplied)';
}


}

/// @nodoc
abstract mixin class _$AuraDiscoverResponseCopyWith<$Res> implements $AuraDiscoverResponseCopyWith<$Res> {
  factory _$AuraDiscoverResponseCopyWith(_AuraDiscoverResponse value, $Res Function(_AuraDiscoverResponse) _then) = __$AuraDiscoverResponseCopyWithImpl;
@override @useResult
$Res call({
 String intro, List<Product> products,@JsonKey(name: 'filters_applied') AuraDiscoverFilters filtersApplied
});


@override $AuraDiscoverFiltersCopyWith<$Res> get filtersApplied;

}
/// @nodoc
class __$AuraDiscoverResponseCopyWithImpl<$Res>
    implements _$AuraDiscoverResponseCopyWith<$Res> {
  __$AuraDiscoverResponseCopyWithImpl(this._self, this._then);

  final _AuraDiscoverResponse _self;
  final $Res Function(_AuraDiscoverResponse) _then;

/// Create a copy of AuraDiscoverResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intro = null,Object? products = null,Object? filtersApplied = null,}) {
  return _then(_AuraDiscoverResponse(
intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,filtersApplied: null == filtersApplied ? _self.filtersApplied : filtersApplied // ignore: cast_nullable_to_non_nullable
as AuraDiscoverFilters,
  ));
}

/// Create a copy of AuraDiscoverResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraDiscoverFiltersCopyWith<$Res> get filtersApplied {
  
  return $AuraDiscoverFiltersCopyWith<$Res>(_self.filtersApplied, (value) {
    return _then(_self.copyWith(filtersApplied: value));
  });
}
}


/// @nodoc
mixin _$CreateAuraSessionResponse {

@JsonKey(name: 'session_id') String get sessionId;
/// Create a copy of CreateAuraSessionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAuraSessionResponseCopyWith<CreateAuraSessionResponse> get copyWith => _$CreateAuraSessionResponseCopyWithImpl<CreateAuraSessionResponse>(this as CreateAuraSessionResponse, _$identity);

  /// Serializes this CreateAuraSessionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAuraSessionResponse&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'CreateAuraSessionResponse(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $CreateAuraSessionResponseCopyWith<$Res>  {
  factory $CreateAuraSessionResponseCopyWith(CreateAuraSessionResponse value, $Res Function(CreateAuraSessionResponse) _then) = _$CreateAuraSessionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId
});




}
/// @nodoc
class _$CreateAuraSessionResponseCopyWithImpl<$Res>
    implements $CreateAuraSessionResponseCopyWith<$Res> {
  _$CreateAuraSessionResponseCopyWithImpl(this._self, this._then);

  final CreateAuraSessionResponse _self;
  final $Res Function(CreateAuraSessionResponse) _then;

/// Create a copy of CreateAuraSessionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAuraSessionResponse].
extension CreateAuraSessionResponsePatterns on CreateAuraSessionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAuraSessionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAuraSessionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAuraSessionResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateAuraSessionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAuraSessionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAuraSessionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAuraSessionResponse() when $default != null:
return $default(_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId)  $default,) {final _that = this;
switch (_that) {
case _CreateAuraSessionResponse():
return $default(_that.sessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_id')  String sessionId)?  $default,) {final _that = this;
switch (_that) {
case _CreateAuraSessionResponse() when $default != null:
return $default(_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAuraSessionResponse implements CreateAuraSessionResponse {
  const _CreateAuraSessionResponse({@JsonKey(name: 'session_id') required this.sessionId});
  factory _CreateAuraSessionResponse.fromJson(Map<String, dynamic> json) => _$CreateAuraSessionResponseFromJson(json);

@override@JsonKey(name: 'session_id') final  String sessionId;

/// Create a copy of CreateAuraSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAuraSessionResponseCopyWith<_CreateAuraSessionResponse> get copyWith => __$CreateAuraSessionResponseCopyWithImpl<_CreateAuraSessionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAuraSessionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAuraSessionResponse&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'CreateAuraSessionResponse(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$CreateAuraSessionResponseCopyWith<$Res> implements $CreateAuraSessionResponseCopyWith<$Res> {
  factory _$CreateAuraSessionResponseCopyWith(_CreateAuraSessionResponse value, $Res Function(_CreateAuraSessionResponse) _then) = __$CreateAuraSessionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId
});




}
/// @nodoc
class __$CreateAuraSessionResponseCopyWithImpl<$Res>
    implements _$CreateAuraSessionResponseCopyWith<$Res> {
  __$CreateAuraSessionResponseCopyWithImpl(this._self, this._then);

  final _CreateAuraSessionResponse _self;
  final $Res Function(_CreateAuraSessionResponse) _then;

/// Create a copy of CreateAuraSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_CreateAuraSessionResponse(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuraAction {

 String get type;@JsonKey(name: 'cta_label') String get ctaLabel; String get route;
/// Create a copy of AuraAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraActionCopyWith<AuraAction> get copyWith => _$AuraActionCopyWithImpl<AuraAction>(this as AuraAction, _$identity);

  /// Serializes this AuraAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraAction&&(identical(other.type, type) || other.type == type)&&(identical(other.ctaLabel, ctaLabel) || other.ctaLabel == ctaLabel)&&(identical(other.route, route) || other.route == route));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ctaLabel,route);

@override
String toString() {
  return 'AuraAction(type: $type, ctaLabel: $ctaLabel, route: $route)';
}


}

/// @nodoc
abstract mixin class $AuraActionCopyWith<$Res>  {
  factory $AuraActionCopyWith(AuraAction value, $Res Function(AuraAction) _then) = _$AuraActionCopyWithImpl;
@useResult
$Res call({
 String type,@JsonKey(name: 'cta_label') String ctaLabel, String route
});




}
/// @nodoc
class _$AuraActionCopyWithImpl<$Res>
    implements $AuraActionCopyWith<$Res> {
  _$AuraActionCopyWithImpl(this._self, this._then);

  final AuraAction _self;
  final $Res Function(AuraAction) _then;

/// Create a copy of AuraAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? ctaLabel = null,Object? route = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,ctaLabel: null == ctaLabel ? _self.ctaLabel : ctaLabel // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuraAction].
extension AuraActionPatterns on AuraAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraAction value)  $default,){
final _that = this;
switch (_that) {
case _AuraAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraAction value)?  $default,){
final _that = this;
switch (_that) {
case _AuraAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'cta_label')  String ctaLabel,  String route)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraAction() when $default != null:
return $default(_that.type,_that.ctaLabel,_that.route);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'cta_label')  String ctaLabel,  String route)  $default,) {final _that = this;
switch (_that) {
case _AuraAction():
return $default(_that.type,_that.ctaLabel,_that.route);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type, @JsonKey(name: 'cta_label')  String ctaLabel,  String route)?  $default,) {final _that = this;
switch (_that) {
case _AuraAction() when $default != null:
return $default(_that.type,_that.ctaLabel,_that.route);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuraAction implements AuraAction {
  const _AuraAction({required this.type, @JsonKey(name: 'cta_label') required this.ctaLabel, required this.route});
  factory _AuraAction.fromJson(Map<String, dynamic> json) => _$AuraActionFromJson(json);

@override final  String type;
@override@JsonKey(name: 'cta_label') final  String ctaLabel;
@override final  String route;

/// Create a copy of AuraAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraActionCopyWith<_AuraAction> get copyWith => __$AuraActionCopyWithImpl<_AuraAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuraActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraAction&&(identical(other.type, type) || other.type == type)&&(identical(other.ctaLabel, ctaLabel) || other.ctaLabel == ctaLabel)&&(identical(other.route, route) || other.route == route));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,ctaLabel,route);

@override
String toString() {
  return 'AuraAction(type: $type, ctaLabel: $ctaLabel, route: $route)';
}


}

/// @nodoc
abstract mixin class _$AuraActionCopyWith<$Res> implements $AuraActionCopyWith<$Res> {
  factory _$AuraActionCopyWith(_AuraAction value, $Res Function(_AuraAction) _then) = __$AuraActionCopyWithImpl;
@override @useResult
$Res call({
 String type,@JsonKey(name: 'cta_label') String ctaLabel, String route
});




}
/// @nodoc
class __$AuraActionCopyWithImpl<$Res>
    implements _$AuraActionCopyWith<$Res> {
  __$AuraActionCopyWithImpl(this._self, this._then);

  final _AuraAction _self;
  final $Res Function(_AuraAction) _then;

/// Create a copy of AuraAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? ctaLabel = null,Object? route = null,}) {
  return _then(_AuraAction(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,ctaLabel: null == ctaLabel ? _self.ctaLabel : ctaLabel // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuraChatResponse {

 String get text; List<Product> get products; AuraAction? get action;
/// Create a copy of AuraChatResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraChatResponseCopyWith<AuraChatResponse> get copyWith => _$AuraChatResponseCopyWithImpl<AuraChatResponse>(this as AuraChatResponse, _$identity);

  /// Serializes this AuraChatResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraChatResponse&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(products),action);

@override
String toString() {
  return 'AuraChatResponse(text: $text, products: $products, action: $action)';
}


}

/// @nodoc
abstract mixin class $AuraChatResponseCopyWith<$Res>  {
  factory $AuraChatResponseCopyWith(AuraChatResponse value, $Res Function(AuraChatResponse) _then) = _$AuraChatResponseCopyWithImpl;
@useResult
$Res call({
 String text, List<Product> products, AuraAction? action
});


$AuraActionCopyWith<$Res>? get action;

}
/// @nodoc
class _$AuraChatResponseCopyWithImpl<$Res>
    implements $AuraChatResponseCopyWith<$Res> {
  _$AuraChatResponseCopyWithImpl(this._self, this._then);

  final AuraChatResponse _self;
  final $Res Function(AuraChatResponse) _then;

/// Create a copy of AuraChatResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? products = null,Object? action = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuraAction?,
  ));
}
/// Create a copy of AuraChatResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraActionCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $AuraActionCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuraChatResponse].
extension AuraChatResponsePatterns on AuraChatResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraChatResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraChatResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraChatResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuraChatResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraChatResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuraChatResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  List<Product> products,  AuraAction? action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraChatResponse() when $default != null:
return $default(_that.text,_that.products,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  List<Product> products,  AuraAction? action)  $default,) {final _that = this;
switch (_that) {
case _AuraChatResponse():
return $default(_that.text,_that.products,_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  List<Product> products,  AuraAction? action)?  $default,) {final _that = this;
switch (_that) {
case _AuraChatResponse() when $default != null:
return $default(_that.text,_that.products,_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuraChatResponse implements AuraChatResponse {
  const _AuraChatResponse({required this.text, required final  List<Product> products, this.action}): _products = products;
  factory _AuraChatResponse.fromJson(Map<String, dynamic> json) => _$AuraChatResponseFromJson(json);

@override final  String text;
 final  List<Product> _products;
@override List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  AuraAction? action;

/// Create a copy of AuraChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraChatResponseCopyWith<_AuraChatResponse> get copyWith => __$AuraChatResponseCopyWithImpl<_AuraChatResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuraChatResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraChatResponse&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_products),action);

@override
String toString() {
  return 'AuraChatResponse(text: $text, products: $products, action: $action)';
}


}

/// @nodoc
abstract mixin class _$AuraChatResponseCopyWith<$Res> implements $AuraChatResponseCopyWith<$Res> {
  factory _$AuraChatResponseCopyWith(_AuraChatResponse value, $Res Function(_AuraChatResponse) _then) = __$AuraChatResponseCopyWithImpl;
@override @useResult
$Res call({
 String text, List<Product> products, AuraAction? action
});


@override $AuraActionCopyWith<$Res>? get action;

}
/// @nodoc
class __$AuraChatResponseCopyWithImpl<$Res>
    implements _$AuraChatResponseCopyWith<$Res> {
  __$AuraChatResponseCopyWithImpl(this._self, this._then);

  final _AuraChatResponse _self;
  final $Res Function(_AuraChatResponse) _then;

/// Create a copy of AuraChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? products = null,Object? action = freezed,}) {
  return _then(_AuraChatResponse(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuraAction?,
  ));
}

/// Create a copy of AuraChatResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraActionCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $AuraActionCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}


/// @nodoc
mixin _$AuraMessageResponse {

 AuraChatResponse get response;@JsonKey(name: 'session_id') String get sessionId;
/// Create a copy of AuraMessageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraMessageResponseCopyWith<AuraMessageResponse> get copyWith => _$AuraMessageResponseCopyWithImpl<AuraMessageResponse>(this as AuraMessageResponse, _$identity);

  /// Serializes this AuraMessageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraMessageResponse&&(identical(other.response, response) || other.response == response)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response,sessionId);

@override
String toString() {
  return 'AuraMessageResponse(response: $response, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $AuraMessageResponseCopyWith<$Res>  {
  factory $AuraMessageResponseCopyWith(AuraMessageResponse value, $Res Function(AuraMessageResponse) _then) = _$AuraMessageResponseCopyWithImpl;
@useResult
$Res call({
 AuraChatResponse response,@JsonKey(name: 'session_id') String sessionId
});


$AuraChatResponseCopyWith<$Res> get response;

}
/// @nodoc
class _$AuraMessageResponseCopyWithImpl<$Res>
    implements $AuraMessageResponseCopyWith<$Res> {
  _$AuraMessageResponseCopyWithImpl(this._self, this._then);

  final AuraMessageResponse _self;
  final $Res Function(AuraMessageResponse) _then;

/// Create a copy of AuraMessageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? response = null,Object? sessionId = null,}) {
  return _then(_self.copyWith(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AuraChatResponse,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AuraMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraChatResponseCopyWith<$Res> get response {
  
  return $AuraChatResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuraMessageResponse].
extension AuraMessageResponsePatterns on AuraMessageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraMessageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraMessageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraMessageResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuraMessageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraMessageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuraMessageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuraChatResponse response, @JsonKey(name: 'session_id')  String sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraMessageResponse() when $default != null:
return $default(_that.response,_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuraChatResponse response, @JsonKey(name: 'session_id')  String sessionId)  $default,) {final _that = this;
switch (_that) {
case _AuraMessageResponse():
return $default(_that.response,_that.sessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuraChatResponse response, @JsonKey(name: 'session_id')  String sessionId)?  $default,) {final _that = this;
switch (_that) {
case _AuraMessageResponse() when $default != null:
return $default(_that.response,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuraMessageResponse implements AuraMessageResponse {
  const _AuraMessageResponse({required this.response, @JsonKey(name: 'session_id') required this.sessionId});
  factory _AuraMessageResponse.fromJson(Map<String, dynamic> json) => _$AuraMessageResponseFromJson(json);

@override final  AuraChatResponse response;
@override@JsonKey(name: 'session_id') final  String sessionId;

/// Create a copy of AuraMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraMessageResponseCopyWith<_AuraMessageResponse> get copyWith => __$AuraMessageResponseCopyWithImpl<_AuraMessageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuraMessageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraMessageResponse&&(identical(other.response, response) || other.response == response)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response,sessionId);

@override
String toString() {
  return 'AuraMessageResponse(response: $response, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$AuraMessageResponseCopyWith<$Res> implements $AuraMessageResponseCopyWith<$Res> {
  factory _$AuraMessageResponseCopyWith(_AuraMessageResponse value, $Res Function(_AuraMessageResponse) _then) = __$AuraMessageResponseCopyWithImpl;
@override @useResult
$Res call({
 AuraChatResponse response,@JsonKey(name: 'session_id') String sessionId
});


@override $AuraChatResponseCopyWith<$Res> get response;

}
/// @nodoc
class __$AuraMessageResponseCopyWithImpl<$Res>
    implements _$AuraMessageResponseCopyWith<$Res> {
  __$AuraMessageResponseCopyWithImpl(this._self, this._then);

  final _AuraMessageResponse _self;
  final $Res Function(_AuraMessageResponse) _then;

/// Create a copy of AuraMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = null,Object? sessionId = null,}) {
  return _then(_AuraMessageResponse(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AuraChatResponse,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AuraMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraChatResponseCopyWith<$Res> get response {
  
  return $AuraChatResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}

/// @nodoc
mixin _$AuraConversationMessage {

 String get role; String get content; AuraAction? get action; List<Product>? get products;
/// Create a copy of AuraConversationMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuraConversationMessageCopyWith<AuraConversationMessage> get copyWith => _$AuraConversationMessageCopyWithImpl<AuraConversationMessage>(this as AuraConversationMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuraConversationMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other.products, products));
}


@override
int get hashCode => Object.hash(runtimeType,role,content,action,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'AuraConversationMessage(role: $role, content: $content, action: $action, products: $products)';
}


}

/// @nodoc
abstract mixin class $AuraConversationMessageCopyWith<$Res>  {
  factory $AuraConversationMessageCopyWith(AuraConversationMessage value, $Res Function(AuraConversationMessage) _then) = _$AuraConversationMessageCopyWithImpl;
@useResult
$Res call({
 String role, String content, AuraAction? action, List<Product>? products
});


$AuraActionCopyWith<$Res>? get action;

}
/// @nodoc
class _$AuraConversationMessageCopyWithImpl<$Res>
    implements $AuraConversationMessageCopyWith<$Res> {
  _$AuraConversationMessageCopyWithImpl(this._self, this._then);

  final AuraConversationMessage _self;
  final $Res Function(AuraConversationMessage) _then;

/// Create a copy of AuraConversationMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = null,Object? action = freezed,Object? products = freezed,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuraAction?,products: freezed == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>?,
  ));
}
/// Create a copy of AuraConversationMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraActionCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $AuraActionCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuraConversationMessage].
extension AuraConversationMessagePatterns on AuraConversationMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuraConversationMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuraConversationMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuraConversationMessage value)  $default,){
final _that = this;
switch (_that) {
case _AuraConversationMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuraConversationMessage value)?  $default,){
final _that = this;
switch (_that) {
case _AuraConversationMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  String content,  AuraAction? action,  List<Product>? products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuraConversationMessage() when $default != null:
return $default(_that.role,_that.content,_that.action,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  String content,  AuraAction? action,  List<Product>? products)  $default,) {final _that = this;
switch (_that) {
case _AuraConversationMessage():
return $default(_that.role,_that.content,_that.action,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  String content,  AuraAction? action,  List<Product>? products)?  $default,) {final _that = this;
switch (_that) {
case _AuraConversationMessage() when $default != null:
return $default(_that.role,_that.content,_that.action,_that.products);case _:
  return null;

}
}

}

/// @nodoc


class _AuraConversationMessage implements AuraConversationMessage {
  const _AuraConversationMessage({required this.role, required this.content, this.action, final  List<Product>? products}): _products = products;
  

@override final  String role;
@override final  String content;
@override final  AuraAction? action;
 final  List<Product>? _products;
@override List<Product>? get products {
  final value = _products;
  if (value == null) return null;
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AuraConversationMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuraConversationMessageCopyWith<_AuraConversationMessage> get copyWith => __$AuraConversationMessageCopyWithImpl<_AuraConversationMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuraConversationMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,role,content,action,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'AuraConversationMessage(role: $role, content: $content, action: $action, products: $products)';
}


}

/// @nodoc
abstract mixin class _$AuraConversationMessageCopyWith<$Res> implements $AuraConversationMessageCopyWith<$Res> {
  factory _$AuraConversationMessageCopyWith(_AuraConversationMessage value, $Res Function(_AuraConversationMessage) _then) = __$AuraConversationMessageCopyWithImpl;
@override @useResult
$Res call({
 String role, String content, AuraAction? action, List<Product>? products
});


@override $AuraActionCopyWith<$Res>? get action;

}
/// @nodoc
class __$AuraConversationMessageCopyWithImpl<$Res>
    implements _$AuraConversationMessageCopyWith<$Res> {
  __$AuraConversationMessageCopyWithImpl(this._self, this._then);

  final _AuraConversationMessage _self;
  final $Res Function(_AuraConversationMessage) _then;

/// Create a copy of AuraConversationMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,Object? action = freezed,Object? products = freezed,}) {
  return _then(_AuraConversationMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuraAction?,products: freezed == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>?,
  ));
}

/// Create a copy of AuraConversationMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuraActionCopyWith<$Res>? get action {
    if (_self.action == null) {
    return null;
  }

  return $AuraActionCopyWith<$Res>(_self.action!, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

// dart format on
