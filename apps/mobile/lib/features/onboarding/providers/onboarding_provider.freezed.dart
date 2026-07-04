// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

 List<String> get intents; String get name; bool get intentSaved; bool get nameSaved;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&const DeepCollectionEquality().equals(other.intents, intents)&&(identical(other.name, name) || other.name == name)&&(identical(other.intentSaved, intentSaved) || other.intentSaved == intentSaved)&&(identical(other.nameSaved, nameSaved) || other.nameSaved == nameSaved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(intents),name,intentSaved,nameSaved);

@override
String toString() {
  return 'OnboardingState(intents: $intents, name: $name, intentSaved: $intentSaved, nameSaved: $nameSaved)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 List<String> intents, String name, bool intentSaved, bool nameSaved
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intents = null,Object? name = null,Object? intentSaved = null,Object? nameSaved = null,}) {
  return _then(_self.copyWith(
intents: null == intents ? _self.intents : intents // ignore: cast_nullable_to_non_nullable
as List<String>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,intentSaved: null == intentSaved ? _self.intentSaved : intentSaved // ignore: cast_nullable_to_non_nullable
as bool,nameSaved: null == nameSaved ? _self.nameSaved : nameSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> intents,  String name,  bool intentSaved,  bool nameSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.intents,_that.name,_that.intentSaved,_that.nameSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> intents,  String name,  bool intentSaved,  bool nameSaved)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.intents,_that.name,_that.intentSaved,_that.nameSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> intents,  String name,  bool intentSaved,  bool nameSaved)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.intents,_that.name,_that.intentSaved,_that.nameSaved);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({final  List<String> intents = const <String>[], this.name = '', this.intentSaved = false, this.nameSaved = false}): _intents = intents;
  

 final  List<String> _intents;
@override@JsonKey() List<String> get intents {
  if (_intents is EqualUnmodifiableListView) return _intents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_intents);
}

@override@JsonKey() final  String name;
@override@JsonKey() final  bool intentSaved;
@override@JsonKey() final  bool nameSaved;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&const DeepCollectionEquality().equals(other._intents, _intents)&&(identical(other.name, name) || other.name == name)&&(identical(other.intentSaved, intentSaved) || other.intentSaved == intentSaved)&&(identical(other.nameSaved, nameSaved) || other.nameSaved == nameSaved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_intents),name,intentSaved,nameSaved);

@override
String toString() {
  return 'OnboardingState(intents: $intents, name: $name, intentSaved: $intentSaved, nameSaved: $nameSaved)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> intents, String name, bool intentSaved, bool nameSaved
});




}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intents = null,Object? name = null,Object? intentSaved = null,Object? nameSaved = null,}) {
  return _then(_OnboardingState(
intents: null == intents ? _self._intents : intents // ignore: cast_nullable_to_non_nullable
as List<String>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,intentSaved: null == intentSaved ? _self.intentSaved : intentSaved // ignore: cast_nullable_to_non_nullable
as bool,nameSaved: null == nameSaved ? _self.nameSaved : nameSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
