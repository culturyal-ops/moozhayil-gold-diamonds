// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartLineItem {

 String get id; Product get product; int get quantity;@JsonKey(name: 'is_available') bool get isAvailable;@JsonKey(name: 'unavailable_reason') String? get unavailableReason;
/// Create a copy of CartLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLineItemCopyWith<CartLineItem> get copyWith => _$CartLineItemCopyWithImpl<CartLineItem>(this as CartLineItem, _$identity);

  /// Serializes this CartLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLineItem&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.unavailableReason, unavailableReason) || other.unavailableReason == unavailableReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,quantity,isAvailable,unavailableReason);

@override
String toString() {
  return 'CartLineItem(id: $id, product: $product, quantity: $quantity, isAvailable: $isAvailable, unavailableReason: $unavailableReason)';
}


}

/// @nodoc
abstract mixin class $CartLineItemCopyWith<$Res>  {
  factory $CartLineItemCopyWith(CartLineItem value, $Res Function(CartLineItem) _then) = _$CartLineItemCopyWithImpl;
@useResult
$Res call({
 String id, Product product, int quantity,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'unavailable_reason') String? unavailableReason
});


$ProductCopyWith<$Res> get product;

}
/// @nodoc
class _$CartLineItemCopyWithImpl<$Res>
    implements $CartLineItemCopyWith<$Res> {
  _$CartLineItemCopyWithImpl(this._self, this._then);

  final CartLineItem _self;
  final $Res Function(CartLineItem) _then;

/// Create a copy of CartLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? quantity = null,Object? isAvailable = null,Object? unavailableReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,unavailableReason: freezed == unavailableReason ? _self.unavailableReason : unavailableReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CartLineItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get product {
  
  return $ProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartLineItem].
extension CartLineItemPatterns on CartLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartLineItem value)  $default,){
final _that = this;
switch (_that) {
case _CartLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartLineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Product product,  int quantity, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'unavailable_reason')  String? unavailableReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartLineItem() when $default != null:
return $default(_that.id,_that.product,_that.quantity,_that.isAvailable,_that.unavailableReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Product product,  int quantity, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'unavailable_reason')  String? unavailableReason)  $default,) {final _that = this;
switch (_that) {
case _CartLineItem():
return $default(_that.id,_that.product,_that.quantity,_that.isAvailable,_that.unavailableReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Product product,  int quantity, @JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'unavailable_reason')  String? unavailableReason)?  $default,) {final _that = this;
switch (_that) {
case _CartLineItem() when $default != null:
return $default(_that.id,_that.product,_that.quantity,_that.isAvailable,_that.unavailableReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartLineItem implements CartLineItem {
  const _CartLineItem({required this.id, required this.product, required this.quantity, @JsonKey(name: 'is_available') required this.isAvailable, @JsonKey(name: 'unavailable_reason') this.unavailableReason});
  factory _CartLineItem.fromJson(Map<String, dynamic> json) => _$CartLineItemFromJson(json);

@override final  String id;
@override final  Product product;
@override final  int quantity;
@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey(name: 'unavailable_reason') final  String? unavailableReason;

/// Create a copy of CartLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartLineItemCopyWith<_CartLineItem> get copyWith => __$CartLineItemCopyWithImpl<_CartLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartLineItem&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.unavailableReason, unavailableReason) || other.unavailableReason == unavailableReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,quantity,isAvailable,unavailableReason);

@override
String toString() {
  return 'CartLineItem(id: $id, product: $product, quantity: $quantity, isAvailable: $isAvailable, unavailableReason: $unavailableReason)';
}


}

/// @nodoc
abstract mixin class _$CartLineItemCopyWith<$Res> implements $CartLineItemCopyWith<$Res> {
  factory _$CartLineItemCopyWith(_CartLineItem value, $Res Function(_CartLineItem) _then) = __$CartLineItemCopyWithImpl;
@override @useResult
$Res call({
 String id, Product product, int quantity,@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'unavailable_reason') String? unavailableReason
});


@override $ProductCopyWith<$Res> get product;

}
/// @nodoc
class __$CartLineItemCopyWithImpl<$Res>
    implements _$CartLineItemCopyWith<$Res> {
  __$CartLineItemCopyWithImpl(this._self, this._then);

  final _CartLineItem _self;
  final $Res Function(_CartLineItem) _then;

/// Create a copy of CartLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? quantity = null,Object? isAvailable = null,Object? unavailableReason = freezed,}) {
  return _then(_CartLineItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,unavailableReason: freezed == unavailableReason ? _self.unavailableReason : unavailableReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CartLineItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get product {
  
  return $ProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$CartSummary {

 List<CartLineItem> get items;@JsonKey(name: 'subtotal_paise') int get subtotalPaise;@JsonKey(name: 'subtotal_display') String get subtotalDisplay;@JsonKey(name: 'item_count') int get itemCount;@JsonKey(name: 'price_valid_until') String? get priceValidUntil;
/// Create a copy of CartSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartSummaryCopyWith<CartSummary> get copyWith => _$CartSummaryCopyWithImpl<CartSummary>(this as CartSummary, _$identity);

  /// Serializes this CartSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartSummary&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotalPaise, subtotalPaise) || other.subtotalPaise == subtotalPaise)&&(identical(other.subtotalDisplay, subtotalDisplay) || other.subtotalDisplay == subtotalDisplay)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.priceValidUntil, priceValidUntil) || other.priceValidUntil == priceValidUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),subtotalPaise,subtotalDisplay,itemCount,priceValidUntil);

@override
String toString() {
  return 'CartSummary(items: $items, subtotalPaise: $subtotalPaise, subtotalDisplay: $subtotalDisplay, itemCount: $itemCount, priceValidUntil: $priceValidUntil)';
}


}

/// @nodoc
abstract mixin class $CartSummaryCopyWith<$Res>  {
  factory $CartSummaryCopyWith(CartSummary value, $Res Function(CartSummary) _then) = _$CartSummaryCopyWithImpl;
@useResult
$Res call({
 List<CartLineItem> items,@JsonKey(name: 'subtotal_paise') int subtotalPaise,@JsonKey(name: 'subtotal_display') String subtotalDisplay,@JsonKey(name: 'item_count') int itemCount,@JsonKey(name: 'price_valid_until') String? priceValidUntil
});




}
/// @nodoc
class _$CartSummaryCopyWithImpl<$Res>
    implements $CartSummaryCopyWith<$Res> {
  _$CartSummaryCopyWithImpl(this._self, this._then);

  final CartSummary _self;
  final $Res Function(CartSummary) _then;

/// Create a copy of CartSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? subtotalPaise = null,Object? subtotalDisplay = null,Object? itemCount = null,Object? priceValidUntil = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartLineItem>,subtotalPaise: null == subtotalPaise ? _self.subtotalPaise : subtotalPaise // ignore: cast_nullable_to_non_nullable
as int,subtotalDisplay: null == subtotalDisplay ? _self.subtotalDisplay : subtotalDisplay // ignore: cast_nullable_to_non_nullable
as String,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,priceValidUntil: freezed == priceValidUntil ? _self.priceValidUntil : priceValidUntil // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartSummary].
extension CartSummaryPatterns on CartSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartSummary value)  $default,){
final _that = this;
switch (_that) {
case _CartSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CartSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartLineItem> items, @JsonKey(name: 'subtotal_paise')  int subtotalPaise, @JsonKey(name: 'subtotal_display')  String subtotalDisplay, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'price_valid_until')  String? priceValidUntil)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartSummary() when $default != null:
return $default(_that.items,_that.subtotalPaise,_that.subtotalDisplay,_that.itemCount,_that.priceValidUntil);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartLineItem> items, @JsonKey(name: 'subtotal_paise')  int subtotalPaise, @JsonKey(name: 'subtotal_display')  String subtotalDisplay, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'price_valid_until')  String? priceValidUntil)  $default,) {final _that = this;
switch (_that) {
case _CartSummary():
return $default(_that.items,_that.subtotalPaise,_that.subtotalDisplay,_that.itemCount,_that.priceValidUntil);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartLineItem> items, @JsonKey(name: 'subtotal_paise')  int subtotalPaise, @JsonKey(name: 'subtotal_display')  String subtotalDisplay, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'price_valid_until')  String? priceValidUntil)?  $default,) {final _that = this;
switch (_that) {
case _CartSummary() when $default != null:
return $default(_that.items,_that.subtotalPaise,_that.subtotalDisplay,_that.itemCount,_that.priceValidUntil);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartSummary implements CartSummary {
  const _CartSummary({required final  List<CartLineItem> items, @JsonKey(name: 'subtotal_paise') required this.subtotalPaise, @JsonKey(name: 'subtotal_display') required this.subtotalDisplay, @JsonKey(name: 'item_count') required this.itemCount, @JsonKey(name: 'price_valid_until') this.priceValidUntil}): _items = items;
  factory _CartSummary.fromJson(Map<String, dynamic> json) => _$CartSummaryFromJson(json);

 final  List<CartLineItem> _items;
@override List<CartLineItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'subtotal_paise') final  int subtotalPaise;
@override@JsonKey(name: 'subtotal_display') final  String subtotalDisplay;
@override@JsonKey(name: 'item_count') final  int itemCount;
@override@JsonKey(name: 'price_valid_until') final  String? priceValidUntil;

/// Create a copy of CartSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartSummaryCopyWith<_CartSummary> get copyWith => __$CartSummaryCopyWithImpl<_CartSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartSummary&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotalPaise, subtotalPaise) || other.subtotalPaise == subtotalPaise)&&(identical(other.subtotalDisplay, subtotalDisplay) || other.subtotalDisplay == subtotalDisplay)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.priceValidUntil, priceValidUntil) || other.priceValidUntil == priceValidUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),subtotalPaise,subtotalDisplay,itemCount,priceValidUntil);

@override
String toString() {
  return 'CartSummary(items: $items, subtotalPaise: $subtotalPaise, subtotalDisplay: $subtotalDisplay, itemCount: $itemCount, priceValidUntil: $priceValidUntil)';
}


}

/// @nodoc
abstract mixin class _$CartSummaryCopyWith<$Res> implements $CartSummaryCopyWith<$Res> {
  factory _$CartSummaryCopyWith(_CartSummary value, $Res Function(_CartSummary) _then) = __$CartSummaryCopyWithImpl;
@override @useResult
$Res call({
 List<CartLineItem> items,@JsonKey(name: 'subtotal_paise') int subtotalPaise,@JsonKey(name: 'subtotal_display') String subtotalDisplay,@JsonKey(name: 'item_count') int itemCount,@JsonKey(name: 'price_valid_until') String? priceValidUntil
});




}
/// @nodoc
class __$CartSummaryCopyWithImpl<$Res>
    implements _$CartSummaryCopyWith<$Res> {
  __$CartSummaryCopyWithImpl(this._self, this._then);

  final _CartSummary _self;
  final $Res Function(_CartSummary) _then;

/// Create a copy of CartSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? subtotalPaise = null,Object? subtotalDisplay = null,Object? itemCount = null,Object? priceValidUntil = freezed,}) {
  return _then(_CartSummary(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartLineItem>,subtotalPaise: null == subtotalPaise ? _self.subtotalPaise : subtotalPaise // ignore: cast_nullable_to_non_nullable
as int,subtotalDisplay: null == subtotalDisplay ? _self.subtotalDisplay : subtotalDisplay // ignore: cast_nullable_to_non_nullable
as String,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,priceValidUntil: freezed == priceValidUntil ? _self.priceValidUntil : priceValidUntil // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
