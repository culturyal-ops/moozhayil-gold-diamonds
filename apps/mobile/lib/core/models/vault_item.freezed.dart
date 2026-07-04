// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VaultAffordability {

@JsonKey(name: 'can_afford_now') bool get canAffordNow;@JsonKey(name: 'percent_complete') int get percentComplete;@JsonKey(name: 'grams_needed_display') String get gramsNeededDisplay;@JsonKey(name: 'suggested_monthly_paise') int get suggestedMonthlyPaise;@JsonKey(name: 'suggested_monthly_display') String get suggestedMonthlyDisplay;@JsonKey(name: 'months_to_afford') int get monthsToAfford;
/// Create a copy of VaultAffordability
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultAffordabilityCopyWith<VaultAffordability> get copyWith => _$VaultAffordabilityCopyWithImpl<VaultAffordability>(this as VaultAffordability, _$identity);

  /// Serializes this VaultAffordability to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultAffordability&&(identical(other.canAffordNow, canAffordNow) || other.canAffordNow == canAffordNow)&&(identical(other.percentComplete, percentComplete) || other.percentComplete == percentComplete)&&(identical(other.gramsNeededDisplay, gramsNeededDisplay) || other.gramsNeededDisplay == gramsNeededDisplay)&&(identical(other.suggestedMonthlyPaise, suggestedMonthlyPaise) || other.suggestedMonthlyPaise == suggestedMonthlyPaise)&&(identical(other.suggestedMonthlyDisplay, suggestedMonthlyDisplay) || other.suggestedMonthlyDisplay == suggestedMonthlyDisplay)&&(identical(other.monthsToAfford, monthsToAfford) || other.monthsToAfford == monthsToAfford));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canAffordNow,percentComplete,gramsNeededDisplay,suggestedMonthlyPaise,suggestedMonthlyDisplay,monthsToAfford);

@override
String toString() {
  return 'VaultAffordability(canAffordNow: $canAffordNow, percentComplete: $percentComplete, gramsNeededDisplay: $gramsNeededDisplay, suggestedMonthlyPaise: $suggestedMonthlyPaise, suggestedMonthlyDisplay: $suggestedMonthlyDisplay, monthsToAfford: $monthsToAfford)';
}


}

/// @nodoc
abstract mixin class $VaultAffordabilityCopyWith<$Res>  {
  factory $VaultAffordabilityCopyWith(VaultAffordability value, $Res Function(VaultAffordability) _then) = _$VaultAffordabilityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'can_afford_now') bool canAffordNow,@JsonKey(name: 'percent_complete') int percentComplete,@JsonKey(name: 'grams_needed_display') String gramsNeededDisplay,@JsonKey(name: 'suggested_monthly_paise') int suggestedMonthlyPaise,@JsonKey(name: 'suggested_monthly_display') String suggestedMonthlyDisplay,@JsonKey(name: 'months_to_afford') int monthsToAfford
});




}
/// @nodoc
class _$VaultAffordabilityCopyWithImpl<$Res>
    implements $VaultAffordabilityCopyWith<$Res> {
  _$VaultAffordabilityCopyWithImpl(this._self, this._then);

  final VaultAffordability _self;
  final $Res Function(VaultAffordability) _then;

/// Create a copy of VaultAffordability
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canAffordNow = null,Object? percentComplete = null,Object? gramsNeededDisplay = null,Object? suggestedMonthlyPaise = null,Object? suggestedMonthlyDisplay = null,Object? monthsToAfford = null,}) {
  return _then(_self.copyWith(
canAffordNow: null == canAffordNow ? _self.canAffordNow : canAffordNow // ignore: cast_nullable_to_non_nullable
as bool,percentComplete: null == percentComplete ? _self.percentComplete : percentComplete // ignore: cast_nullable_to_non_nullable
as int,gramsNeededDisplay: null == gramsNeededDisplay ? _self.gramsNeededDisplay : gramsNeededDisplay // ignore: cast_nullable_to_non_nullable
as String,suggestedMonthlyPaise: null == suggestedMonthlyPaise ? _self.suggestedMonthlyPaise : suggestedMonthlyPaise // ignore: cast_nullable_to_non_nullable
as int,suggestedMonthlyDisplay: null == suggestedMonthlyDisplay ? _self.suggestedMonthlyDisplay : suggestedMonthlyDisplay // ignore: cast_nullable_to_non_nullable
as String,monthsToAfford: null == monthsToAfford ? _self.monthsToAfford : monthsToAfford // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VaultAffordability].
extension VaultAffordabilityPatterns on VaultAffordability {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VaultAffordability value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VaultAffordability() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VaultAffordability value)  $default,){
final _that = this;
switch (_that) {
case _VaultAffordability():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VaultAffordability value)?  $default,){
final _that = this;
switch (_that) {
case _VaultAffordability() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'can_afford_now')  bool canAffordNow, @JsonKey(name: 'percent_complete')  int percentComplete, @JsonKey(name: 'grams_needed_display')  String gramsNeededDisplay, @JsonKey(name: 'suggested_monthly_paise')  int suggestedMonthlyPaise, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'months_to_afford')  int monthsToAfford)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VaultAffordability() when $default != null:
return $default(_that.canAffordNow,_that.percentComplete,_that.gramsNeededDisplay,_that.suggestedMonthlyPaise,_that.suggestedMonthlyDisplay,_that.monthsToAfford);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'can_afford_now')  bool canAffordNow, @JsonKey(name: 'percent_complete')  int percentComplete, @JsonKey(name: 'grams_needed_display')  String gramsNeededDisplay, @JsonKey(name: 'suggested_monthly_paise')  int suggestedMonthlyPaise, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'months_to_afford')  int monthsToAfford)  $default,) {final _that = this;
switch (_that) {
case _VaultAffordability():
return $default(_that.canAffordNow,_that.percentComplete,_that.gramsNeededDisplay,_that.suggestedMonthlyPaise,_that.suggestedMonthlyDisplay,_that.monthsToAfford);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'can_afford_now')  bool canAffordNow, @JsonKey(name: 'percent_complete')  int percentComplete, @JsonKey(name: 'grams_needed_display')  String gramsNeededDisplay, @JsonKey(name: 'suggested_monthly_paise')  int suggestedMonthlyPaise, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'months_to_afford')  int monthsToAfford)?  $default,) {final _that = this;
switch (_that) {
case _VaultAffordability() when $default != null:
return $default(_that.canAffordNow,_that.percentComplete,_that.gramsNeededDisplay,_that.suggestedMonthlyPaise,_that.suggestedMonthlyDisplay,_that.monthsToAfford);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VaultAffordability implements VaultAffordability {
  const _VaultAffordability({@JsonKey(name: 'can_afford_now') required this.canAffordNow, @JsonKey(name: 'percent_complete') required this.percentComplete, @JsonKey(name: 'grams_needed_display') required this.gramsNeededDisplay, @JsonKey(name: 'suggested_monthly_paise') required this.suggestedMonthlyPaise, @JsonKey(name: 'suggested_monthly_display') required this.suggestedMonthlyDisplay, @JsonKey(name: 'months_to_afford') required this.monthsToAfford});
  factory _VaultAffordability.fromJson(Map<String, dynamic> json) => _$VaultAffordabilityFromJson(json);

@override@JsonKey(name: 'can_afford_now') final  bool canAffordNow;
@override@JsonKey(name: 'percent_complete') final  int percentComplete;
@override@JsonKey(name: 'grams_needed_display') final  String gramsNeededDisplay;
@override@JsonKey(name: 'suggested_monthly_paise') final  int suggestedMonthlyPaise;
@override@JsonKey(name: 'suggested_monthly_display') final  String suggestedMonthlyDisplay;
@override@JsonKey(name: 'months_to_afford') final  int monthsToAfford;

/// Create a copy of VaultAffordability
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultAffordabilityCopyWith<_VaultAffordability> get copyWith => __$VaultAffordabilityCopyWithImpl<_VaultAffordability>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VaultAffordabilityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultAffordability&&(identical(other.canAffordNow, canAffordNow) || other.canAffordNow == canAffordNow)&&(identical(other.percentComplete, percentComplete) || other.percentComplete == percentComplete)&&(identical(other.gramsNeededDisplay, gramsNeededDisplay) || other.gramsNeededDisplay == gramsNeededDisplay)&&(identical(other.suggestedMonthlyPaise, suggestedMonthlyPaise) || other.suggestedMonthlyPaise == suggestedMonthlyPaise)&&(identical(other.suggestedMonthlyDisplay, suggestedMonthlyDisplay) || other.suggestedMonthlyDisplay == suggestedMonthlyDisplay)&&(identical(other.monthsToAfford, monthsToAfford) || other.monthsToAfford == monthsToAfford));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canAffordNow,percentComplete,gramsNeededDisplay,suggestedMonthlyPaise,suggestedMonthlyDisplay,monthsToAfford);

@override
String toString() {
  return 'VaultAffordability(canAffordNow: $canAffordNow, percentComplete: $percentComplete, gramsNeededDisplay: $gramsNeededDisplay, suggestedMonthlyPaise: $suggestedMonthlyPaise, suggestedMonthlyDisplay: $suggestedMonthlyDisplay, monthsToAfford: $monthsToAfford)';
}


}

/// @nodoc
abstract mixin class _$VaultAffordabilityCopyWith<$Res> implements $VaultAffordabilityCopyWith<$Res> {
  factory _$VaultAffordabilityCopyWith(_VaultAffordability value, $Res Function(_VaultAffordability) _then) = __$VaultAffordabilityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'can_afford_now') bool canAffordNow,@JsonKey(name: 'percent_complete') int percentComplete,@JsonKey(name: 'grams_needed_display') String gramsNeededDisplay,@JsonKey(name: 'suggested_monthly_paise') int suggestedMonthlyPaise,@JsonKey(name: 'suggested_monthly_display') String suggestedMonthlyDisplay,@JsonKey(name: 'months_to_afford') int monthsToAfford
});




}
/// @nodoc
class __$VaultAffordabilityCopyWithImpl<$Res>
    implements _$VaultAffordabilityCopyWith<$Res> {
  __$VaultAffordabilityCopyWithImpl(this._self, this._then);

  final _VaultAffordability _self;
  final $Res Function(_VaultAffordability) _then;

/// Create a copy of VaultAffordability
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canAffordNow = null,Object? percentComplete = null,Object? gramsNeededDisplay = null,Object? suggestedMonthlyPaise = null,Object? suggestedMonthlyDisplay = null,Object? monthsToAfford = null,}) {
  return _then(_VaultAffordability(
canAffordNow: null == canAffordNow ? _self.canAffordNow : canAffordNow // ignore: cast_nullable_to_non_nullable
as bool,percentComplete: null == percentComplete ? _self.percentComplete : percentComplete // ignore: cast_nullable_to_non_nullable
as int,gramsNeededDisplay: null == gramsNeededDisplay ? _self.gramsNeededDisplay : gramsNeededDisplay // ignore: cast_nullable_to_non_nullable
as String,suggestedMonthlyPaise: null == suggestedMonthlyPaise ? _self.suggestedMonthlyPaise : suggestedMonthlyPaise // ignore: cast_nullable_to_non_nullable
as int,suggestedMonthlyDisplay: null == suggestedMonthlyDisplay ? _self.suggestedMonthlyDisplay : suggestedMonthlyDisplay // ignore: cast_nullable_to_non_nullable
as String,monthsToAfford: null == monthsToAfford ? _self.monthsToAfford : monthsToAfford // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GoalSuggestion {

@JsonKey(name: 'suggested_monthly_paise') int get suggestedMonthlyPaise;@JsonKey(name: 'suggested_monthly_display') String get suggestedMonthlyDisplay;@JsonKey(name: 'months_to_complete') int get monthsToComplete;@JsonKey(name: 'completion_date_display') String get completionDateDisplay;
/// Create a copy of GoalSuggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalSuggestionCopyWith<GoalSuggestion> get copyWith => _$GoalSuggestionCopyWithImpl<GoalSuggestion>(this as GoalSuggestion, _$identity);

  /// Serializes this GoalSuggestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalSuggestion&&(identical(other.suggestedMonthlyPaise, suggestedMonthlyPaise) || other.suggestedMonthlyPaise == suggestedMonthlyPaise)&&(identical(other.suggestedMonthlyDisplay, suggestedMonthlyDisplay) || other.suggestedMonthlyDisplay == suggestedMonthlyDisplay)&&(identical(other.monthsToComplete, monthsToComplete) || other.monthsToComplete == monthsToComplete)&&(identical(other.completionDateDisplay, completionDateDisplay) || other.completionDateDisplay == completionDateDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suggestedMonthlyPaise,suggestedMonthlyDisplay,monthsToComplete,completionDateDisplay);

@override
String toString() {
  return 'GoalSuggestion(suggestedMonthlyPaise: $suggestedMonthlyPaise, suggestedMonthlyDisplay: $suggestedMonthlyDisplay, monthsToComplete: $monthsToComplete, completionDateDisplay: $completionDateDisplay)';
}


}

/// @nodoc
abstract mixin class $GoalSuggestionCopyWith<$Res>  {
  factory $GoalSuggestionCopyWith(GoalSuggestion value, $Res Function(GoalSuggestion) _then) = _$GoalSuggestionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'suggested_monthly_paise') int suggestedMonthlyPaise,@JsonKey(name: 'suggested_monthly_display') String suggestedMonthlyDisplay,@JsonKey(name: 'months_to_complete') int monthsToComplete,@JsonKey(name: 'completion_date_display') String completionDateDisplay
});




}
/// @nodoc
class _$GoalSuggestionCopyWithImpl<$Res>
    implements $GoalSuggestionCopyWith<$Res> {
  _$GoalSuggestionCopyWithImpl(this._self, this._then);

  final GoalSuggestion _self;
  final $Res Function(GoalSuggestion) _then;

/// Create a copy of GoalSuggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suggestedMonthlyPaise = null,Object? suggestedMonthlyDisplay = null,Object? monthsToComplete = null,Object? completionDateDisplay = null,}) {
  return _then(_self.copyWith(
suggestedMonthlyPaise: null == suggestedMonthlyPaise ? _self.suggestedMonthlyPaise : suggestedMonthlyPaise // ignore: cast_nullable_to_non_nullable
as int,suggestedMonthlyDisplay: null == suggestedMonthlyDisplay ? _self.suggestedMonthlyDisplay : suggestedMonthlyDisplay // ignore: cast_nullable_to_non_nullable
as String,monthsToComplete: null == monthsToComplete ? _self.monthsToComplete : monthsToComplete // ignore: cast_nullable_to_non_nullable
as int,completionDateDisplay: null == completionDateDisplay ? _self.completionDateDisplay : completionDateDisplay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalSuggestion].
extension GoalSuggestionPatterns on GoalSuggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalSuggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalSuggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalSuggestion value)  $default,){
final _that = this;
switch (_that) {
case _GoalSuggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalSuggestion value)?  $default,){
final _that = this;
switch (_that) {
case _GoalSuggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'suggested_monthly_paise')  int suggestedMonthlyPaise, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'months_to_complete')  int monthsToComplete, @JsonKey(name: 'completion_date_display')  String completionDateDisplay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalSuggestion() when $default != null:
return $default(_that.suggestedMonthlyPaise,_that.suggestedMonthlyDisplay,_that.monthsToComplete,_that.completionDateDisplay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'suggested_monthly_paise')  int suggestedMonthlyPaise, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'months_to_complete')  int monthsToComplete, @JsonKey(name: 'completion_date_display')  String completionDateDisplay)  $default,) {final _that = this;
switch (_that) {
case _GoalSuggestion():
return $default(_that.suggestedMonthlyPaise,_that.suggestedMonthlyDisplay,_that.monthsToComplete,_that.completionDateDisplay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'suggested_monthly_paise')  int suggestedMonthlyPaise, @JsonKey(name: 'suggested_monthly_display')  String suggestedMonthlyDisplay, @JsonKey(name: 'months_to_complete')  int monthsToComplete, @JsonKey(name: 'completion_date_display')  String completionDateDisplay)?  $default,) {final _that = this;
switch (_that) {
case _GoalSuggestion() when $default != null:
return $default(_that.suggestedMonthlyPaise,_that.suggestedMonthlyDisplay,_that.monthsToComplete,_that.completionDateDisplay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalSuggestion implements GoalSuggestion {
  const _GoalSuggestion({@JsonKey(name: 'suggested_monthly_paise') required this.suggestedMonthlyPaise, @JsonKey(name: 'suggested_monthly_display') required this.suggestedMonthlyDisplay, @JsonKey(name: 'months_to_complete') required this.monthsToComplete, @JsonKey(name: 'completion_date_display') required this.completionDateDisplay});
  factory _GoalSuggestion.fromJson(Map<String, dynamic> json) => _$GoalSuggestionFromJson(json);

@override@JsonKey(name: 'suggested_monthly_paise') final  int suggestedMonthlyPaise;
@override@JsonKey(name: 'suggested_monthly_display') final  String suggestedMonthlyDisplay;
@override@JsonKey(name: 'months_to_complete') final  int monthsToComplete;
@override@JsonKey(name: 'completion_date_display') final  String completionDateDisplay;

/// Create a copy of GoalSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalSuggestionCopyWith<_GoalSuggestion> get copyWith => __$GoalSuggestionCopyWithImpl<_GoalSuggestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalSuggestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalSuggestion&&(identical(other.suggestedMonthlyPaise, suggestedMonthlyPaise) || other.suggestedMonthlyPaise == suggestedMonthlyPaise)&&(identical(other.suggestedMonthlyDisplay, suggestedMonthlyDisplay) || other.suggestedMonthlyDisplay == suggestedMonthlyDisplay)&&(identical(other.monthsToComplete, monthsToComplete) || other.monthsToComplete == monthsToComplete)&&(identical(other.completionDateDisplay, completionDateDisplay) || other.completionDateDisplay == completionDateDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suggestedMonthlyPaise,suggestedMonthlyDisplay,monthsToComplete,completionDateDisplay);

@override
String toString() {
  return 'GoalSuggestion(suggestedMonthlyPaise: $suggestedMonthlyPaise, suggestedMonthlyDisplay: $suggestedMonthlyDisplay, monthsToComplete: $monthsToComplete, completionDateDisplay: $completionDateDisplay)';
}


}

/// @nodoc
abstract mixin class _$GoalSuggestionCopyWith<$Res> implements $GoalSuggestionCopyWith<$Res> {
  factory _$GoalSuggestionCopyWith(_GoalSuggestion value, $Res Function(_GoalSuggestion) _then) = __$GoalSuggestionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'suggested_monthly_paise') int suggestedMonthlyPaise,@JsonKey(name: 'suggested_monthly_display') String suggestedMonthlyDisplay,@JsonKey(name: 'months_to_complete') int monthsToComplete,@JsonKey(name: 'completion_date_display') String completionDateDisplay
});




}
/// @nodoc
class __$GoalSuggestionCopyWithImpl<$Res>
    implements _$GoalSuggestionCopyWith<$Res> {
  __$GoalSuggestionCopyWithImpl(this._self, this._then);

  final _GoalSuggestion _self;
  final $Res Function(_GoalSuggestion) _then;

/// Create a copy of GoalSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suggestedMonthlyPaise = null,Object? suggestedMonthlyDisplay = null,Object? monthsToComplete = null,Object? completionDateDisplay = null,}) {
  return _then(_GoalSuggestion(
suggestedMonthlyPaise: null == suggestedMonthlyPaise ? _self.suggestedMonthlyPaise : suggestedMonthlyPaise // ignore: cast_nullable_to_non_nullable
as int,suggestedMonthlyDisplay: null == suggestedMonthlyDisplay ? _self.suggestedMonthlyDisplay : suggestedMonthlyDisplay // ignore: cast_nullable_to_non_nullable
as String,monthsToComplete: null == monthsToComplete ? _self.monthsToComplete : monthsToComplete // ignore: cast_nullable_to_non_nullable
as int,completionDateDisplay: null == completionDateDisplay ? _self.completionDateDisplay : completionDateDisplay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VaultItem {

 String get id; Product get product; Object? get goal; VaultAffordability get affordability;@JsonKey(name: 'added_at') String get addedAt;
/// Create a copy of VaultItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultItemCopyWith<VaultItem> get copyWith => _$VaultItemCopyWithImpl<VaultItem>(this as VaultItem, _$identity);

  /// Serializes this VaultItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultItem&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other.goal, goal)&&(identical(other.affordability, affordability) || other.affordability == affordability)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,const DeepCollectionEquality().hash(goal),affordability,addedAt);

@override
String toString() {
  return 'VaultItem(id: $id, product: $product, goal: $goal, affordability: $affordability, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class $VaultItemCopyWith<$Res>  {
  factory $VaultItemCopyWith(VaultItem value, $Res Function(VaultItem) _then) = _$VaultItemCopyWithImpl;
@useResult
$Res call({
 String id, Product product, Object? goal, VaultAffordability affordability,@JsonKey(name: 'added_at') String addedAt
});


$ProductCopyWith<$Res> get product;$VaultAffordabilityCopyWith<$Res> get affordability;

}
/// @nodoc
class _$VaultItemCopyWithImpl<$Res>
    implements $VaultItemCopyWith<$Res> {
  _$VaultItemCopyWithImpl(this._self, this._then);

  final VaultItem _self;
  final $Res Function(VaultItem) _then;

/// Create a copy of VaultItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? goal = freezed,Object? affordability = null,Object? addedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,goal: freezed == goal ? _self.goal : goal ,affordability: null == affordability ? _self.affordability : affordability // ignore: cast_nullable_to_non_nullable
as VaultAffordability,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of VaultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get product {
  
  return $ProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of VaultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VaultAffordabilityCopyWith<$Res> get affordability {
  
  return $VaultAffordabilityCopyWith<$Res>(_self.affordability, (value) {
    return _then(_self.copyWith(affordability: value));
  });
}
}


/// Adds pattern-matching-related methods to [VaultItem].
extension VaultItemPatterns on VaultItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VaultItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VaultItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VaultItem value)  $default,){
final _that = this;
switch (_that) {
case _VaultItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VaultItem value)?  $default,){
final _that = this;
switch (_that) {
case _VaultItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Product product,  Object? goal,  VaultAffordability affordability, @JsonKey(name: 'added_at')  String addedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VaultItem() when $default != null:
return $default(_that.id,_that.product,_that.goal,_that.affordability,_that.addedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Product product,  Object? goal,  VaultAffordability affordability, @JsonKey(name: 'added_at')  String addedAt)  $default,) {final _that = this;
switch (_that) {
case _VaultItem():
return $default(_that.id,_that.product,_that.goal,_that.affordability,_that.addedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Product product,  Object? goal,  VaultAffordability affordability, @JsonKey(name: 'added_at')  String addedAt)?  $default,) {final _that = this;
switch (_that) {
case _VaultItem() when $default != null:
return $default(_that.id,_that.product,_that.goal,_that.affordability,_that.addedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VaultItem implements VaultItem {
  const _VaultItem({required this.id, required this.product, this.goal, required this.affordability, @JsonKey(name: 'added_at') required this.addedAt});
  factory _VaultItem.fromJson(Map<String, dynamic> json) => _$VaultItemFromJson(json);

@override final  String id;
@override final  Product product;
@override final  Object? goal;
@override final  VaultAffordability affordability;
@override@JsonKey(name: 'added_at') final  String addedAt;

/// Create a copy of VaultItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultItemCopyWith<_VaultItem> get copyWith => __$VaultItemCopyWithImpl<_VaultItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VaultItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultItem&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other.goal, goal)&&(identical(other.affordability, affordability) || other.affordability == affordability)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,const DeepCollectionEquality().hash(goal),affordability,addedAt);

@override
String toString() {
  return 'VaultItem(id: $id, product: $product, goal: $goal, affordability: $affordability, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class _$VaultItemCopyWith<$Res> implements $VaultItemCopyWith<$Res> {
  factory _$VaultItemCopyWith(_VaultItem value, $Res Function(_VaultItem) _then) = __$VaultItemCopyWithImpl;
@override @useResult
$Res call({
 String id, Product product, Object? goal, VaultAffordability affordability,@JsonKey(name: 'added_at') String addedAt
});


@override $ProductCopyWith<$Res> get product;@override $VaultAffordabilityCopyWith<$Res> get affordability;

}
/// @nodoc
class __$VaultItemCopyWithImpl<$Res>
    implements _$VaultItemCopyWith<$Res> {
  __$VaultItemCopyWithImpl(this._self, this._then);

  final _VaultItem _self;
  final $Res Function(_VaultItem) _then;

/// Create a copy of VaultItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? goal = freezed,Object? affordability = null,Object? addedAt = null,}) {
  return _then(_VaultItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,goal: freezed == goal ? _self.goal : goal ,affordability: null == affordability ? _self.affordability : affordability // ignore: cast_nullable_to_non_nullable
as VaultAffordability,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of VaultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get product {
  
  return $ProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of VaultItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VaultAffordabilityCopyWith<$Res> get affordability {
  
  return $VaultAffordabilityCopyWith<$Res>(_self.affordability, (value) {
    return _then(_self.copyWith(affordability: value));
  });
}
}


/// @nodoc
mixin _$VaultListResponse {

 List<VaultItem> get items; int get count;
/// Create a copy of VaultListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultListResponseCopyWith<VaultListResponse> get copyWith => _$VaultListResponseCopyWithImpl<VaultListResponse>(this as VaultListResponse, _$identity);

  /// Serializes this VaultListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultListResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),count);

@override
String toString() {
  return 'VaultListResponse(items: $items, count: $count)';
}


}

/// @nodoc
abstract mixin class $VaultListResponseCopyWith<$Res>  {
  factory $VaultListResponseCopyWith(VaultListResponse value, $Res Function(VaultListResponse) _then) = _$VaultListResponseCopyWithImpl;
@useResult
$Res call({
 List<VaultItem> items, int count
});




}
/// @nodoc
class _$VaultListResponseCopyWithImpl<$Res>
    implements $VaultListResponseCopyWith<$Res> {
  _$VaultListResponseCopyWithImpl(this._self, this._then);

  final VaultListResponse _self;
  final $Res Function(VaultListResponse) _then;

/// Create a copy of VaultListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? count = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<VaultItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VaultListResponse].
extension VaultListResponsePatterns on VaultListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VaultListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VaultListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VaultListResponse value)  $default,){
final _that = this;
switch (_that) {
case _VaultListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VaultListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VaultListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VaultItem> items,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VaultListResponse() when $default != null:
return $default(_that.items,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VaultItem> items,  int count)  $default,) {final _that = this;
switch (_that) {
case _VaultListResponse():
return $default(_that.items,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VaultItem> items,  int count)?  $default,) {final _that = this;
switch (_that) {
case _VaultListResponse() when $default != null:
return $default(_that.items,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VaultListResponse implements VaultListResponse {
  const _VaultListResponse({required final  List<VaultItem> items, required this.count}): _items = items;
  factory _VaultListResponse.fromJson(Map<String, dynamic> json) => _$VaultListResponseFromJson(json);

 final  List<VaultItem> _items;
@override List<VaultItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int count;

/// Create a copy of VaultListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultListResponseCopyWith<_VaultListResponse> get copyWith => __$VaultListResponseCopyWithImpl<_VaultListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VaultListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultListResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),count);

@override
String toString() {
  return 'VaultListResponse(items: $items, count: $count)';
}


}

/// @nodoc
abstract mixin class _$VaultListResponseCopyWith<$Res> implements $VaultListResponseCopyWith<$Res> {
  factory _$VaultListResponseCopyWith(_VaultListResponse value, $Res Function(_VaultListResponse) _then) = __$VaultListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<VaultItem> items, int count
});




}
/// @nodoc
class __$VaultListResponseCopyWithImpl<$Res>
    implements _$VaultListResponseCopyWith<$Res> {
  __$VaultListResponseCopyWithImpl(this._self, this._then);

  final _VaultListResponse _self;
  final $Res Function(_VaultListResponse) _then;

/// Create a copy of VaultListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? count = null,}) {
  return _then(_VaultListResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<VaultItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AddVaultResponse {

@JsonKey(name: 'vault_item') VaultItem get vaultItem;@JsonKey(name: 'goal_suggestion') GoalSuggestion get goalSuggestion;
/// Create a copy of AddVaultResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddVaultResponseCopyWith<AddVaultResponse> get copyWith => _$AddVaultResponseCopyWithImpl<AddVaultResponse>(this as AddVaultResponse, _$identity);

  /// Serializes this AddVaultResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddVaultResponse&&(identical(other.vaultItem, vaultItem) || other.vaultItem == vaultItem)&&(identical(other.goalSuggestion, goalSuggestion) || other.goalSuggestion == goalSuggestion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vaultItem,goalSuggestion);

@override
String toString() {
  return 'AddVaultResponse(vaultItem: $vaultItem, goalSuggestion: $goalSuggestion)';
}


}

/// @nodoc
abstract mixin class $AddVaultResponseCopyWith<$Res>  {
  factory $AddVaultResponseCopyWith(AddVaultResponse value, $Res Function(AddVaultResponse) _then) = _$AddVaultResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'vault_item') VaultItem vaultItem,@JsonKey(name: 'goal_suggestion') GoalSuggestion goalSuggestion
});


$VaultItemCopyWith<$Res> get vaultItem;$GoalSuggestionCopyWith<$Res> get goalSuggestion;

}
/// @nodoc
class _$AddVaultResponseCopyWithImpl<$Res>
    implements $AddVaultResponseCopyWith<$Res> {
  _$AddVaultResponseCopyWithImpl(this._self, this._then);

  final AddVaultResponse _self;
  final $Res Function(AddVaultResponse) _then;

/// Create a copy of AddVaultResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vaultItem = null,Object? goalSuggestion = null,}) {
  return _then(_self.copyWith(
vaultItem: null == vaultItem ? _self.vaultItem : vaultItem // ignore: cast_nullable_to_non_nullable
as VaultItem,goalSuggestion: null == goalSuggestion ? _self.goalSuggestion : goalSuggestion // ignore: cast_nullable_to_non_nullable
as GoalSuggestion,
  ));
}
/// Create a copy of AddVaultResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VaultItemCopyWith<$Res> get vaultItem {
  
  return $VaultItemCopyWith<$Res>(_self.vaultItem, (value) {
    return _then(_self.copyWith(vaultItem: value));
  });
}/// Create a copy of AddVaultResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalSuggestionCopyWith<$Res> get goalSuggestion {
  
  return $GoalSuggestionCopyWith<$Res>(_self.goalSuggestion, (value) {
    return _then(_self.copyWith(goalSuggestion: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddVaultResponse].
extension AddVaultResponsePatterns on AddVaultResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddVaultResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddVaultResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddVaultResponse value)  $default,){
final _that = this;
switch (_that) {
case _AddVaultResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddVaultResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AddVaultResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'vault_item')  VaultItem vaultItem, @JsonKey(name: 'goal_suggestion')  GoalSuggestion goalSuggestion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddVaultResponse() when $default != null:
return $default(_that.vaultItem,_that.goalSuggestion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'vault_item')  VaultItem vaultItem, @JsonKey(name: 'goal_suggestion')  GoalSuggestion goalSuggestion)  $default,) {final _that = this;
switch (_that) {
case _AddVaultResponse():
return $default(_that.vaultItem,_that.goalSuggestion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'vault_item')  VaultItem vaultItem, @JsonKey(name: 'goal_suggestion')  GoalSuggestion goalSuggestion)?  $default,) {final _that = this;
switch (_that) {
case _AddVaultResponse() when $default != null:
return $default(_that.vaultItem,_that.goalSuggestion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddVaultResponse implements AddVaultResponse {
  const _AddVaultResponse({@JsonKey(name: 'vault_item') required this.vaultItem, @JsonKey(name: 'goal_suggestion') required this.goalSuggestion});
  factory _AddVaultResponse.fromJson(Map<String, dynamic> json) => _$AddVaultResponseFromJson(json);

@override@JsonKey(name: 'vault_item') final  VaultItem vaultItem;
@override@JsonKey(name: 'goal_suggestion') final  GoalSuggestion goalSuggestion;

/// Create a copy of AddVaultResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddVaultResponseCopyWith<_AddVaultResponse> get copyWith => __$AddVaultResponseCopyWithImpl<_AddVaultResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddVaultResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVaultResponse&&(identical(other.vaultItem, vaultItem) || other.vaultItem == vaultItem)&&(identical(other.goalSuggestion, goalSuggestion) || other.goalSuggestion == goalSuggestion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vaultItem,goalSuggestion);

@override
String toString() {
  return 'AddVaultResponse(vaultItem: $vaultItem, goalSuggestion: $goalSuggestion)';
}


}

/// @nodoc
abstract mixin class _$AddVaultResponseCopyWith<$Res> implements $AddVaultResponseCopyWith<$Res> {
  factory _$AddVaultResponseCopyWith(_AddVaultResponse value, $Res Function(_AddVaultResponse) _then) = __$AddVaultResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'vault_item') VaultItem vaultItem,@JsonKey(name: 'goal_suggestion') GoalSuggestion goalSuggestion
});


@override $VaultItemCopyWith<$Res> get vaultItem;@override $GoalSuggestionCopyWith<$Res> get goalSuggestion;

}
/// @nodoc
class __$AddVaultResponseCopyWithImpl<$Res>
    implements _$AddVaultResponseCopyWith<$Res> {
  __$AddVaultResponseCopyWithImpl(this._self, this._then);

  final _AddVaultResponse _self;
  final $Res Function(_AddVaultResponse) _then;

/// Create a copy of AddVaultResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vaultItem = null,Object? goalSuggestion = null,}) {
  return _then(_AddVaultResponse(
vaultItem: null == vaultItem ? _self.vaultItem : vaultItem // ignore: cast_nullable_to_non_nullable
as VaultItem,goalSuggestion: null == goalSuggestion ? _self.goalSuggestion : goalSuggestion // ignore: cast_nullable_to_non_nullable
as GoalSuggestion,
  ));
}

/// Create a copy of AddVaultResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VaultItemCopyWith<$Res> get vaultItem {
  
  return $VaultItemCopyWith<$Res>(_self.vaultItem, (value) {
    return _then(_self.copyWith(vaultItem: value));
  });
}/// Create a copy of AddVaultResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalSuggestionCopyWith<$Res> get goalSuggestion {
  
  return $GoalSuggestionCopyWith<$Res>(_self.goalSuggestion, (value) {
    return _then(_self.copyWith(goalSuggestion: value));
  });
}
}

// dart format on
