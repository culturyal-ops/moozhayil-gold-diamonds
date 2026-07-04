// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItem {

@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'product_image') String? get productImage; int get quantity;@JsonKey(name: 'unit_price_paise') int get unitPricePaise;@JsonKey(name: 'unit_price_display') String get unitPriceDisplay;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPricePaise, unitPricePaise) || other.unitPricePaise == unitPricePaise)&&(identical(other.unitPriceDisplay, unitPriceDisplay) || other.unitPriceDisplay == unitPriceDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,productImage,quantity,unitPricePaise,unitPriceDisplay);

@override
String toString() {
  return 'OrderItem(productId: $productId, productName: $productName, productImage: $productImage, quantity: $quantity, unitPricePaise: $unitPricePaise, unitPriceDisplay: $unitPriceDisplay)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_image') String? productImage, int quantity,@JsonKey(name: 'unit_price_paise') int unitPricePaise,@JsonKey(name: 'unit_price_display') String unitPriceDisplay
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? productName = null,Object? productImage = freezed,Object? quantity = null,Object? unitPricePaise = null,Object? unitPriceDisplay = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPricePaise: null == unitPricePaise ? _self.unitPricePaise : unitPricePaise // ignore: cast_nullable_to_non_nullable
as int,unitPriceDisplay: null == unitPriceDisplay ? _self.unitPriceDisplay : unitPriceDisplay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_image')  String? productImage,  int quantity, @JsonKey(name: 'unit_price_paise')  int unitPricePaise, @JsonKey(name: 'unit_price_display')  String unitPriceDisplay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.productId,_that.productName,_that.productImage,_that.quantity,_that.unitPricePaise,_that.unitPriceDisplay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_image')  String? productImage,  int quantity, @JsonKey(name: 'unit_price_paise')  int unitPricePaise, @JsonKey(name: 'unit_price_display')  String unitPriceDisplay)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.productId,_that.productName,_that.productImage,_that.quantity,_that.unitPricePaise,_that.unitPriceDisplay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_image')  String? productImage,  int quantity, @JsonKey(name: 'unit_price_paise')  int unitPricePaise, @JsonKey(name: 'unit_price_display')  String unitPriceDisplay)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.productId,_that.productName,_that.productImage,_that.quantity,_that.unitPricePaise,_that.unitPriceDisplay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({@JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'product_image') this.productImage, required this.quantity, @JsonKey(name: 'unit_price_paise') required this.unitPricePaise, @JsonKey(name: 'unit_price_display') required this.unitPriceDisplay});
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'product_image') final  String? productImage;
@override final  int quantity;
@override@JsonKey(name: 'unit_price_paise') final  int unitPricePaise;
@override@JsonKey(name: 'unit_price_display') final  String unitPriceDisplay;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPricePaise, unitPricePaise) || other.unitPricePaise == unitPricePaise)&&(identical(other.unitPriceDisplay, unitPriceDisplay) || other.unitPriceDisplay == unitPriceDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productName,productImage,quantity,unitPricePaise,unitPriceDisplay);

@override
String toString() {
  return 'OrderItem(productId: $productId, productName: $productName, productImage: $productImage, quantity: $quantity, unitPricePaise: $unitPricePaise, unitPriceDisplay: $unitPriceDisplay)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_image') String? productImage, int quantity,@JsonKey(name: 'unit_price_paise') int unitPricePaise,@JsonKey(name: 'unit_price_display') String unitPriceDisplay
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? productName = null,Object? productImage = freezed,Object? quantity = null,Object? unitPricePaise = null,Object? unitPriceDisplay = null,}) {
  return _then(_OrderItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPricePaise: null == unitPricePaise ? _self.unitPricePaise : unitPricePaise // ignore: cast_nullable_to_non_nullable
as int,unitPriceDisplay: null == unitPriceDisplay ? _self.unitPriceDisplay : unitPriceDisplay // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id;@JsonKey(name: 'order_number') String get orderNumber; String get status;@JsonKey(name: 'status_display') String get statusDisplay;@JsonKey(name: 'total_paise') int get totalPaise;@JsonKey(name: 'total_display') String get totalDisplay;@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'gold_balance_used_grams') String get goldBalanceUsedGrams;@JsonKey(name: 'making_charge_waiver_paise') int get makingChargeWaiverPaise;@JsonKey(name: 'making_charge_waiver_display') String? get makingChargeWaiverDisplay; List<OrderItem> get items;@JsonKey(name: 'ordered_at') String get orderedAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusDisplay, statusDisplay) || other.statusDisplay == statusDisplay)&&(identical(other.totalPaise, totalPaise) || other.totalPaise == totalPaise)&&(identical(other.totalDisplay, totalDisplay) || other.totalDisplay == totalDisplay)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.goldBalanceUsedGrams, goldBalanceUsedGrams) || other.goldBalanceUsedGrams == goldBalanceUsedGrams)&&(identical(other.makingChargeWaiverPaise, makingChargeWaiverPaise) || other.makingChargeWaiverPaise == makingChargeWaiverPaise)&&(identical(other.makingChargeWaiverDisplay, makingChargeWaiverDisplay) || other.makingChargeWaiverDisplay == makingChargeWaiverDisplay)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.orderedAt, orderedAt) || other.orderedAt == orderedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,status,statusDisplay,totalPaise,totalDisplay,paymentMethod,goldBalanceUsedGrams,makingChargeWaiverPaise,makingChargeWaiverDisplay,const DeepCollectionEquality().hash(items),orderedAt);

@override
String toString() {
  return 'Order(id: $id, orderNumber: $orderNumber, status: $status, statusDisplay: $statusDisplay, totalPaise: $totalPaise, totalDisplay: $totalDisplay, paymentMethod: $paymentMethod, goldBalanceUsedGrams: $goldBalanceUsedGrams, makingChargeWaiverPaise: $makingChargeWaiverPaise, makingChargeWaiverDisplay: $makingChargeWaiverDisplay, items: $items, orderedAt: $orderedAt)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'order_number') String orderNumber, String status,@JsonKey(name: 'status_display') String statusDisplay,@JsonKey(name: 'total_paise') int totalPaise,@JsonKey(name: 'total_display') String totalDisplay,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'gold_balance_used_grams') String goldBalanceUsedGrams,@JsonKey(name: 'making_charge_waiver_paise') int makingChargeWaiverPaise,@JsonKey(name: 'making_charge_waiver_display') String? makingChargeWaiverDisplay, List<OrderItem> items,@JsonKey(name: 'ordered_at') String orderedAt
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? status = null,Object? statusDisplay = null,Object? totalPaise = null,Object? totalDisplay = null,Object? paymentMethod = null,Object? goldBalanceUsedGrams = null,Object? makingChargeWaiverPaise = null,Object? makingChargeWaiverDisplay = freezed,Object? items = null,Object? orderedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusDisplay: null == statusDisplay ? _self.statusDisplay : statusDisplay // ignore: cast_nullable_to_non_nullable
as String,totalPaise: null == totalPaise ? _self.totalPaise : totalPaise // ignore: cast_nullable_to_non_nullable
as int,totalDisplay: null == totalDisplay ? _self.totalDisplay : totalDisplay // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,goldBalanceUsedGrams: null == goldBalanceUsedGrams ? _self.goldBalanceUsedGrams : goldBalanceUsedGrams // ignore: cast_nullable_to_non_nullable
as String,makingChargeWaiverPaise: null == makingChargeWaiverPaise ? _self.makingChargeWaiverPaise : makingChargeWaiverPaise // ignore: cast_nullable_to_non_nullable
as int,makingChargeWaiverDisplay: freezed == makingChargeWaiverDisplay ? _self.makingChargeWaiverDisplay : makingChargeWaiverDisplay // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,orderedAt: null == orderedAt ? _self.orderedAt : orderedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_number')  String orderNumber,  String status, @JsonKey(name: 'status_display')  String statusDisplay, @JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'total_display')  String totalDisplay, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'gold_balance_used_grams')  String goldBalanceUsedGrams, @JsonKey(name: 'making_charge_waiver_paise')  int makingChargeWaiverPaise, @JsonKey(name: 'making_charge_waiver_display')  String? makingChargeWaiverDisplay,  List<OrderItem> items, @JsonKey(name: 'ordered_at')  String orderedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.orderNumber,_that.status,_that.statusDisplay,_that.totalPaise,_that.totalDisplay,_that.paymentMethod,_that.goldBalanceUsedGrams,_that.makingChargeWaiverPaise,_that.makingChargeWaiverDisplay,_that.items,_that.orderedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_number')  String orderNumber,  String status, @JsonKey(name: 'status_display')  String statusDisplay, @JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'total_display')  String totalDisplay, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'gold_balance_used_grams')  String goldBalanceUsedGrams, @JsonKey(name: 'making_charge_waiver_paise')  int makingChargeWaiverPaise, @JsonKey(name: 'making_charge_waiver_display')  String? makingChargeWaiverDisplay,  List<OrderItem> items, @JsonKey(name: 'ordered_at')  String orderedAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.orderNumber,_that.status,_that.statusDisplay,_that.totalPaise,_that.totalDisplay,_that.paymentMethod,_that.goldBalanceUsedGrams,_that.makingChargeWaiverPaise,_that.makingChargeWaiverDisplay,_that.items,_that.orderedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'order_number')  String orderNumber,  String status, @JsonKey(name: 'status_display')  String statusDisplay, @JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'total_display')  String totalDisplay, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'gold_balance_used_grams')  String goldBalanceUsedGrams, @JsonKey(name: 'making_charge_waiver_paise')  int makingChargeWaiverPaise, @JsonKey(name: 'making_charge_waiver_display')  String? makingChargeWaiverDisplay,  List<OrderItem> items, @JsonKey(name: 'ordered_at')  String orderedAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.orderNumber,_that.status,_that.statusDisplay,_that.totalPaise,_that.totalDisplay,_that.paymentMethod,_that.goldBalanceUsedGrams,_that.makingChargeWaiverPaise,_that.makingChargeWaiverDisplay,_that.items,_that.orderedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({required this.id, @JsonKey(name: 'order_number') required this.orderNumber, required this.status, @JsonKey(name: 'status_display') required this.statusDisplay, @JsonKey(name: 'total_paise') required this.totalPaise, @JsonKey(name: 'total_display') required this.totalDisplay, @JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'gold_balance_used_grams') required this.goldBalanceUsedGrams, @JsonKey(name: 'making_charge_waiver_paise') this.makingChargeWaiverPaise = 0, @JsonKey(name: 'making_charge_waiver_display') this.makingChargeWaiverDisplay, required final  List<OrderItem> items, @JsonKey(name: 'ordered_at') required this.orderedAt}): _items = items;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
@override@JsonKey(name: 'order_number') final  String orderNumber;
@override final  String status;
@override@JsonKey(name: 'status_display') final  String statusDisplay;
@override@JsonKey(name: 'total_paise') final  int totalPaise;
@override@JsonKey(name: 'total_display') final  String totalDisplay;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'gold_balance_used_grams') final  String goldBalanceUsedGrams;
@override@JsonKey(name: 'making_charge_waiver_paise') final  int makingChargeWaiverPaise;
@override@JsonKey(name: 'making_charge_waiver_display') final  String? makingChargeWaiverDisplay;
 final  List<OrderItem> _items;
@override List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'ordered_at') final  String orderedAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusDisplay, statusDisplay) || other.statusDisplay == statusDisplay)&&(identical(other.totalPaise, totalPaise) || other.totalPaise == totalPaise)&&(identical(other.totalDisplay, totalDisplay) || other.totalDisplay == totalDisplay)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.goldBalanceUsedGrams, goldBalanceUsedGrams) || other.goldBalanceUsedGrams == goldBalanceUsedGrams)&&(identical(other.makingChargeWaiverPaise, makingChargeWaiverPaise) || other.makingChargeWaiverPaise == makingChargeWaiverPaise)&&(identical(other.makingChargeWaiverDisplay, makingChargeWaiverDisplay) || other.makingChargeWaiverDisplay == makingChargeWaiverDisplay)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.orderedAt, orderedAt) || other.orderedAt == orderedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,status,statusDisplay,totalPaise,totalDisplay,paymentMethod,goldBalanceUsedGrams,makingChargeWaiverPaise,makingChargeWaiverDisplay,const DeepCollectionEquality().hash(_items),orderedAt);

@override
String toString() {
  return 'Order(id: $id, orderNumber: $orderNumber, status: $status, statusDisplay: $statusDisplay, totalPaise: $totalPaise, totalDisplay: $totalDisplay, paymentMethod: $paymentMethod, goldBalanceUsedGrams: $goldBalanceUsedGrams, makingChargeWaiverPaise: $makingChargeWaiverPaise, makingChargeWaiverDisplay: $makingChargeWaiverDisplay, items: $items, orderedAt: $orderedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'order_number') String orderNumber, String status,@JsonKey(name: 'status_display') String statusDisplay,@JsonKey(name: 'total_paise') int totalPaise,@JsonKey(name: 'total_display') String totalDisplay,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'gold_balance_used_grams') String goldBalanceUsedGrams,@JsonKey(name: 'making_charge_waiver_paise') int makingChargeWaiverPaise,@JsonKey(name: 'making_charge_waiver_display') String? makingChargeWaiverDisplay, List<OrderItem> items,@JsonKey(name: 'ordered_at') String orderedAt
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? status = null,Object? statusDisplay = null,Object? totalPaise = null,Object? totalDisplay = null,Object? paymentMethod = null,Object? goldBalanceUsedGrams = null,Object? makingChargeWaiverPaise = null,Object? makingChargeWaiverDisplay = freezed,Object? items = null,Object? orderedAt = null,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusDisplay: null == statusDisplay ? _self.statusDisplay : statusDisplay // ignore: cast_nullable_to_non_nullable
as String,totalPaise: null == totalPaise ? _self.totalPaise : totalPaise // ignore: cast_nullable_to_non_nullable
as int,totalDisplay: null == totalDisplay ? _self.totalDisplay : totalDisplay // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,goldBalanceUsedGrams: null == goldBalanceUsedGrams ? _self.goldBalanceUsedGrams : goldBalanceUsedGrams // ignore: cast_nullable_to_non_nullable
as String,makingChargeWaiverPaise: null == makingChargeWaiverPaise ? _self.makingChargeWaiverPaise : makingChargeWaiverPaise // ignore: cast_nullable_to_non_nullable
as int,makingChargeWaiverDisplay: freezed == makingChargeWaiverDisplay ? _self.makingChargeWaiverDisplay : makingChargeWaiverDisplay // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,orderedAt: null == orderedAt ? _self.orderedAt : orderedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrdersListResponse {

 List<Order> get data;@JsonKey(name: 'next_cursor') String? get nextCursor;@JsonKey(name: 'has_more') bool get hasMore;
/// Create a copy of OrdersListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersListResponseCopyWith<OrdersListResponse> get copyWith => _$OrdersListResponseCopyWithImpl<OrdersListResponse>(this as OrdersListResponse, _$identity);

  /// Serializes this OrdersListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),nextCursor,hasMore);

@override
String toString() {
  return 'OrdersListResponse(data: $data, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $OrdersListResponseCopyWith<$Res>  {
  factory $OrdersListResponseCopyWith(OrdersListResponse value, $Res Function(OrdersListResponse) _then) = _$OrdersListResponseCopyWithImpl;
@useResult
$Res call({
 List<Order> data,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'has_more') bool hasMore
});




}
/// @nodoc
class _$OrdersListResponseCopyWithImpl<$Res>
    implements $OrdersListResponseCopyWith<$Res> {
  _$OrdersListResponseCopyWithImpl(this._self, this._then);

  final OrdersListResponse _self;
  final $Res Function(OrdersListResponse) _then;

/// Create a copy of OrdersListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Order>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersListResponse].
extension OrdersListResponsePatterns on OrdersListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersListResponse value)  $default,){
final _that = this;
switch (_that) {
case _OrdersListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Order> data, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersListResponse() when $default != null:
return $default(_that.data,_that.nextCursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Order> data, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _OrdersListResponse():
return $default(_that.data,_that.nextCursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Order> data, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _OrdersListResponse() when $default != null:
return $default(_that.data,_that.nextCursor,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdersListResponse implements OrdersListResponse {
  const _OrdersListResponse({required final  List<Order> data, @JsonKey(name: 'next_cursor') this.nextCursor, @JsonKey(name: 'has_more') required this.hasMore}): _data = data;
  factory _OrdersListResponse.fromJson(Map<String, dynamic> json) => _$OrdersListResponseFromJson(json);

 final  List<Order> _data;
@override List<Order> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'next_cursor') final  String? nextCursor;
@override@JsonKey(name: 'has_more') final  bool hasMore;

/// Create a copy of OrdersListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersListResponseCopyWith<_OrdersListResponse> get copyWith => __$OrdersListResponseCopyWithImpl<_OrdersListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdersListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),nextCursor,hasMore);

@override
String toString() {
  return 'OrdersListResponse(data: $data, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$OrdersListResponseCopyWith<$Res> implements $OrdersListResponseCopyWith<$Res> {
  factory _$OrdersListResponseCopyWith(_OrdersListResponse value, $Res Function(_OrdersListResponse) _then) = __$OrdersListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Order> data,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'has_more') bool hasMore
});




}
/// @nodoc
class __$OrdersListResponseCopyWithImpl<$Res>
    implements _$OrdersListResponseCopyWith<$Res> {
  __$OrdersListResponseCopyWithImpl(this._self, this._then);

  final _OrdersListResponse _self;
  final $Res Function(_OrdersListResponse) _then;

/// Create a copy of OrdersListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_OrdersListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Order>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PaymentBreakdown {

@JsonKey(name: 'total_paise') int get totalPaise;@JsonKey(name: 'gold_applied_paise') int get goldAppliedPaise;@JsonKey(name: 'cash_paid_paise') int get cashPaidPaise;@JsonKey(name: 'gold_rate_paise') int get goldRatePaise;
/// Create a copy of PaymentBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentBreakdownCopyWith<PaymentBreakdown> get copyWith => _$PaymentBreakdownCopyWithImpl<PaymentBreakdown>(this as PaymentBreakdown, _$identity);

  /// Serializes this PaymentBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentBreakdown&&(identical(other.totalPaise, totalPaise) || other.totalPaise == totalPaise)&&(identical(other.goldAppliedPaise, goldAppliedPaise) || other.goldAppliedPaise == goldAppliedPaise)&&(identical(other.cashPaidPaise, cashPaidPaise) || other.cashPaidPaise == cashPaidPaise)&&(identical(other.goldRatePaise, goldRatePaise) || other.goldRatePaise == goldRatePaise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPaise,goldAppliedPaise,cashPaidPaise,goldRatePaise);

@override
String toString() {
  return 'PaymentBreakdown(totalPaise: $totalPaise, goldAppliedPaise: $goldAppliedPaise, cashPaidPaise: $cashPaidPaise, goldRatePaise: $goldRatePaise)';
}


}

/// @nodoc
abstract mixin class $PaymentBreakdownCopyWith<$Res>  {
  factory $PaymentBreakdownCopyWith(PaymentBreakdown value, $Res Function(PaymentBreakdown) _then) = _$PaymentBreakdownCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_paise') int totalPaise,@JsonKey(name: 'gold_applied_paise') int goldAppliedPaise,@JsonKey(name: 'cash_paid_paise') int cashPaidPaise,@JsonKey(name: 'gold_rate_paise') int goldRatePaise
});




}
/// @nodoc
class _$PaymentBreakdownCopyWithImpl<$Res>
    implements $PaymentBreakdownCopyWith<$Res> {
  _$PaymentBreakdownCopyWithImpl(this._self, this._then);

  final PaymentBreakdown _self;
  final $Res Function(PaymentBreakdown) _then;

/// Create a copy of PaymentBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalPaise = null,Object? goldAppliedPaise = null,Object? cashPaidPaise = null,Object? goldRatePaise = null,}) {
  return _then(_self.copyWith(
totalPaise: null == totalPaise ? _self.totalPaise : totalPaise // ignore: cast_nullable_to_non_nullable
as int,goldAppliedPaise: null == goldAppliedPaise ? _self.goldAppliedPaise : goldAppliedPaise // ignore: cast_nullable_to_non_nullable
as int,cashPaidPaise: null == cashPaidPaise ? _self.cashPaidPaise : cashPaidPaise // ignore: cast_nullable_to_non_nullable
as int,goldRatePaise: null == goldRatePaise ? _self.goldRatePaise : goldRatePaise // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentBreakdown].
extension PaymentBreakdownPatterns on PaymentBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _PaymentBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'gold_applied_paise')  int goldAppliedPaise, @JsonKey(name: 'cash_paid_paise')  int cashPaidPaise, @JsonKey(name: 'gold_rate_paise')  int goldRatePaise)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentBreakdown() when $default != null:
return $default(_that.totalPaise,_that.goldAppliedPaise,_that.cashPaidPaise,_that.goldRatePaise);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'gold_applied_paise')  int goldAppliedPaise, @JsonKey(name: 'cash_paid_paise')  int cashPaidPaise, @JsonKey(name: 'gold_rate_paise')  int goldRatePaise)  $default,) {final _that = this;
switch (_that) {
case _PaymentBreakdown():
return $default(_that.totalPaise,_that.goldAppliedPaise,_that.cashPaidPaise,_that.goldRatePaise);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'gold_applied_paise')  int goldAppliedPaise, @JsonKey(name: 'cash_paid_paise')  int cashPaidPaise, @JsonKey(name: 'gold_rate_paise')  int goldRatePaise)?  $default,) {final _that = this;
switch (_that) {
case _PaymentBreakdown() when $default != null:
return $default(_that.totalPaise,_that.goldAppliedPaise,_that.cashPaidPaise,_that.goldRatePaise);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentBreakdown implements PaymentBreakdown {
  const _PaymentBreakdown({@JsonKey(name: 'total_paise') required this.totalPaise, @JsonKey(name: 'gold_applied_paise') required this.goldAppliedPaise, @JsonKey(name: 'cash_paid_paise') required this.cashPaidPaise, @JsonKey(name: 'gold_rate_paise') required this.goldRatePaise});
  factory _PaymentBreakdown.fromJson(Map<String, dynamic> json) => _$PaymentBreakdownFromJson(json);

@override@JsonKey(name: 'total_paise') final  int totalPaise;
@override@JsonKey(name: 'gold_applied_paise') final  int goldAppliedPaise;
@override@JsonKey(name: 'cash_paid_paise') final  int cashPaidPaise;
@override@JsonKey(name: 'gold_rate_paise') final  int goldRatePaise;

/// Create a copy of PaymentBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentBreakdownCopyWith<_PaymentBreakdown> get copyWith => __$PaymentBreakdownCopyWithImpl<_PaymentBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentBreakdown&&(identical(other.totalPaise, totalPaise) || other.totalPaise == totalPaise)&&(identical(other.goldAppliedPaise, goldAppliedPaise) || other.goldAppliedPaise == goldAppliedPaise)&&(identical(other.cashPaidPaise, cashPaidPaise) || other.cashPaidPaise == cashPaidPaise)&&(identical(other.goldRatePaise, goldRatePaise) || other.goldRatePaise == goldRatePaise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPaise,goldAppliedPaise,cashPaidPaise,goldRatePaise);

@override
String toString() {
  return 'PaymentBreakdown(totalPaise: $totalPaise, goldAppliedPaise: $goldAppliedPaise, cashPaidPaise: $cashPaidPaise, goldRatePaise: $goldRatePaise)';
}


}

/// @nodoc
abstract mixin class _$PaymentBreakdownCopyWith<$Res> implements $PaymentBreakdownCopyWith<$Res> {
  factory _$PaymentBreakdownCopyWith(_PaymentBreakdown value, $Res Function(_PaymentBreakdown) _then) = __$PaymentBreakdownCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_paise') int totalPaise,@JsonKey(name: 'gold_applied_paise') int goldAppliedPaise,@JsonKey(name: 'cash_paid_paise') int cashPaidPaise,@JsonKey(name: 'gold_rate_paise') int goldRatePaise
});




}
/// @nodoc
class __$PaymentBreakdownCopyWithImpl<$Res>
    implements _$PaymentBreakdownCopyWith<$Res> {
  __$PaymentBreakdownCopyWithImpl(this._self, this._then);

  final _PaymentBreakdown _self;
  final $Res Function(_PaymentBreakdown) _then;

/// Create a copy of PaymentBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalPaise = null,Object? goldAppliedPaise = null,Object? cashPaidPaise = null,Object? goldRatePaise = null,}) {
  return _then(_PaymentBreakdown(
totalPaise: null == totalPaise ? _self.totalPaise : totalPaise // ignore: cast_nullable_to_non_nullable
as int,goldAppliedPaise: null == goldAppliedPaise ? _self.goldAppliedPaise : goldAppliedPaise // ignore: cast_nullable_to_non_nullable
as int,cashPaidPaise: null == cashPaidPaise ? _self.cashPaidPaise : cashPaidPaise // ignore: cast_nullable_to_non_nullable
as int,goldRatePaise: null == goldRatePaise ? _self.goldRatePaise : goldRatePaise // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OrderDetailResponse {

 Order get order;@JsonKey(name: 'payment_breakdown') PaymentBreakdown get paymentBreakdown;
/// Create a copy of OrderDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailResponseCopyWith<OrderDetailResponse> get copyWith => _$OrderDetailResponseCopyWithImpl<OrderDetailResponse>(this as OrderDetailResponse, _$identity);

  /// Serializes this OrderDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailResponse&&(identical(other.order, order) || other.order == order)&&(identical(other.paymentBreakdown, paymentBreakdown) || other.paymentBreakdown == paymentBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,paymentBreakdown);

@override
String toString() {
  return 'OrderDetailResponse(order: $order, paymentBreakdown: $paymentBreakdown)';
}


}

/// @nodoc
abstract mixin class $OrderDetailResponseCopyWith<$Res>  {
  factory $OrderDetailResponseCopyWith(OrderDetailResponse value, $Res Function(OrderDetailResponse) _then) = _$OrderDetailResponseCopyWithImpl;
@useResult
$Res call({
 Order order,@JsonKey(name: 'payment_breakdown') PaymentBreakdown paymentBreakdown
});


$OrderCopyWith<$Res> get order;$PaymentBreakdownCopyWith<$Res> get paymentBreakdown;

}
/// @nodoc
class _$OrderDetailResponseCopyWithImpl<$Res>
    implements $OrderDetailResponseCopyWith<$Res> {
  _$OrderDetailResponseCopyWithImpl(this._self, this._then);

  final OrderDetailResponse _self;
  final $Res Function(OrderDetailResponse) _then;

/// Create a copy of OrderDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? paymentBreakdown = null,}) {
  return _then(_self.copyWith(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,paymentBreakdown: null == paymentBreakdown ? _self.paymentBreakdown : paymentBreakdown // ignore: cast_nullable_to_non_nullable
as PaymentBreakdown,
  ));
}
/// Create a copy of OrderDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of OrderDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentBreakdownCopyWith<$Res> get paymentBreakdown {
  
  return $PaymentBreakdownCopyWith<$Res>(_self.paymentBreakdown, (value) {
    return _then(_self.copyWith(paymentBreakdown: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDetailResponse].
extension OrderDetailResponsePatterns on OrderDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Order order, @JsonKey(name: 'payment_breakdown')  PaymentBreakdown paymentBreakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailResponse() when $default != null:
return $default(_that.order,_that.paymentBreakdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Order order, @JsonKey(name: 'payment_breakdown')  PaymentBreakdown paymentBreakdown)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailResponse():
return $default(_that.order,_that.paymentBreakdown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Order order, @JsonKey(name: 'payment_breakdown')  PaymentBreakdown paymentBreakdown)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailResponse() when $default != null:
return $default(_that.order,_that.paymentBreakdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailResponse implements OrderDetailResponse {
  const _OrderDetailResponse({required this.order, @JsonKey(name: 'payment_breakdown') required this.paymentBreakdown});
  factory _OrderDetailResponse.fromJson(Map<String, dynamic> json) => _$OrderDetailResponseFromJson(json);

@override final  Order order;
@override@JsonKey(name: 'payment_breakdown') final  PaymentBreakdown paymentBreakdown;

/// Create a copy of OrderDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailResponseCopyWith<_OrderDetailResponse> get copyWith => __$OrderDetailResponseCopyWithImpl<_OrderDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailResponse&&(identical(other.order, order) || other.order == order)&&(identical(other.paymentBreakdown, paymentBreakdown) || other.paymentBreakdown == paymentBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,paymentBreakdown);

@override
String toString() {
  return 'OrderDetailResponse(order: $order, paymentBreakdown: $paymentBreakdown)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailResponseCopyWith<$Res> implements $OrderDetailResponseCopyWith<$Res> {
  factory _$OrderDetailResponseCopyWith(_OrderDetailResponse value, $Res Function(_OrderDetailResponse) _then) = __$OrderDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 Order order,@JsonKey(name: 'payment_breakdown') PaymentBreakdown paymentBreakdown
});


@override $OrderCopyWith<$Res> get order;@override $PaymentBreakdownCopyWith<$Res> get paymentBreakdown;

}
/// @nodoc
class __$OrderDetailResponseCopyWithImpl<$Res>
    implements _$OrderDetailResponseCopyWith<$Res> {
  __$OrderDetailResponseCopyWithImpl(this._self, this._then);

  final _OrderDetailResponse _self;
  final $Res Function(_OrderDetailResponse) _then;

/// Create a copy of OrderDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? paymentBreakdown = null,}) {
  return _then(_OrderDetailResponse(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,paymentBreakdown: null == paymentBreakdown ? _self.paymentBreakdown : paymentBreakdown // ignore: cast_nullable_to_non_nullable
as PaymentBreakdown,
  ));
}

/// Create a copy of OrderDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of OrderDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentBreakdownCopyWith<$Res> get paymentBreakdown {
  
  return $PaymentBreakdownCopyWith<$Res>(_self.paymentBreakdown, (value) {
    return _then(_self.copyWith(paymentBreakdown: value));
  });
}
}


/// @nodoc
mixin _$CreateOrderResponse {

 Order get order;@JsonKey(name: 'payment_required') bool get paymentRequired;@JsonKey(name: 'payment_amount_paise') int get paymentAmountPaise;@JsonKey(name: 'payment_session_id') String? get paymentSessionId;@JsonKey(name: 'payment_url') String? get paymentUrl;@JsonKey(name: 'razorpay_order_id') String? get razorpayOrderId;@JsonKey(name: 'razorpay_key_id') String? get razorpayKeyId;@JsonKey(name: 'aura_mc_waiver_applied') bool get auraMcWaiverApplied;@JsonKey(name: 'making_charge_waiver_paise') int get makingChargeWaiverPaise;@JsonKey(name: 'making_charge_waiver_display') String? get makingChargeWaiverDisplay;
/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderResponseCopyWith<CreateOrderResponse> get copyWith => _$CreateOrderResponseCopyWithImpl<CreateOrderResponse>(this as CreateOrderResponse, _$identity);

  /// Serializes this CreateOrderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderResponse&&(identical(other.order, order) || other.order == order)&&(identical(other.paymentRequired, paymentRequired) || other.paymentRequired == paymentRequired)&&(identical(other.paymentAmountPaise, paymentAmountPaise) || other.paymentAmountPaise == paymentAmountPaise)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.razorpayOrderId, razorpayOrderId) || other.razorpayOrderId == razorpayOrderId)&&(identical(other.razorpayKeyId, razorpayKeyId) || other.razorpayKeyId == razorpayKeyId)&&(identical(other.auraMcWaiverApplied, auraMcWaiverApplied) || other.auraMcWaiverApplied == auraMcWaiverApplied)&&(identical(other.makingChargeWaiverPaise, makingChargeWaiverPaise) || other.makingChargeWaiverPaise == makingChargeWaiverPaise)&&(identical(other.makingChargeWaiverDisplay, makingChargeWaiverDisplay) || other.makingChargeWaiverDisplay == makingChargeWaiverDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,paymentRequired,paymentAmountPaise,paymentSessionId,paymentUrl,razorpayOrderId,razorpayKeyId,auraMcWaiverApplied,makingChargeWaiverPaise,makingChargeWaiverDisplay);

@override
String toString() {
  return 'CreateOrderResponse(order: $order, paymentRequired: $paymentRequired, paymentAmountPaise: $paymentAmountPaise, paymentSessionId: $paymentSessionId, paymentUrl: $paymentUrl, razorpayOrderId: $razorpayOrderId, razorpayKeyId: $razorpayKeyId, auraMcWaiverApplied: $auraMcWaiverApplied, makingChargeWaiverPaise: $makingChargeWaiverPaise, makingChargeWaiverDisplay: $makingChargeWaiverDisplay)';
}


}

/// @nodoc
abstract mixin class $CreateOrderResponseCopyWith<$Res>  {
  factory $CreateOrderResponseCopyWith(CreateOrderResponse value, $Res Function(CreateOrderResponse) _then) = _$CreateOrderResponseCopyWithImpl;
@useResult
$Res call({
 Order order,@JsonKey(name: 'payment_required') bool paymentRequired,@JsonKey(name: 'payment_amount_paise') int paymentAmountPaise,@JsonKey(name: 'payment_session_id') String? paymentSessionId,@JsonKey(name: 'payment_url') String? paymentUrl,@JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,@JsonKey(name: 'razorpay_key_id') String? razorpayKeyId,@JsonKey(name: 'aura_mc_waiver_applied') bool auraMcWaiverApplied,@JsonKey(name: 'making_charge_waiver_paise') int makingChargeWaiverPaise,@JsonKey(name: 'making_charge_waiver_display') String? makingChargeWaiverDisplay
});


$OrderCopyWith<$Res> get order;

}
/// @nodoc
class _$CreateOrderResponseCopyWithImpl<$Res>
    implements $CreateOrderResponseCopyWith<$Res> {
  _$CreateOrderResponseCopyWithImpl(this._self, this._then);

  final CreateOrderResponse _self;
  final $Res Function(CreateOrderResponse) _then;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? paymentRequired = null,Object? paymentAmountPaise = null,Object? paymentSessionId = freezed,Object? paymentUrl = freezed,Object? razorpayOrderId = freezed,Object? razorpayKeyId = freezed,Object? auraMcWaiverApplied = null,Object? makingChargeWaiverPaise = null,Object? makingChargeWaiverDisplay = freezed,}) {
  return _then(_self.copyWith(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,paymentRequired: null == paymentRequired ? _self.paymentRequired : paymentRequired // ignore: cast_nullable_to_non_nullable
as bool,paymentAmountPaise: null == paymentAmountPaise ? _self.paymentAmountPaise : paymentAmountPaise // ignore: cast_nullable_to_non_nullable
as int,paymentSessionId: freezed == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as String?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,razorpayOrderId: freezed == razorpayOrderId ? _self.razorpayOrderId : razorpayOrderId // ignore: cast_nullable_to_non_nullable
as String?,razorpayKeyId: freezed == razorpayKeyId ? _self.razorpayKeyId : razorpayKeyId // ignore: cast_nullable_to_non_nullable
as String?,auraMcWaiverApplied: null == auraMcWaiverApplied ? _self.auraMcWaiverApplied : auraMcWaiverApplied // ignore: cast_nullable_to_non_nullable
as bool,makingChargeWaiverPaise: null == makingChargeWaiverPaise ? _self.makingChargeWaiverPaise : makingChargeWaiverPaise // ignore: cast_nullable_to_non_nullable
as int,makingChargeWaiverDisplay: freezed == makingChargeWaiverDisplay ? _self.makingChargeWaiverDisplay : makingChargeWaiverDisplay // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateOrderResponse].
extension CreateOrderResponsePatterns on CreateOrderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Order order, @JsonKey(name: 'payment_required')  bool paymentRequired, @JsonKey(name: 'payment_amount_paise')  int paymentAmountPaise, @JsonKey(name: 'payment_session_id')  String? paymentSessionId, @JsonKey(name: 'payment_url')  String? paymentUrl, @JsonKey(name: 'razorpay_order_id')  String? razorpayOrderId, @JsonKey(name: 'razorpay_key_id')  String? razorpayKeyId, @JsonKey(name: 'aura_mc_waiver_applied')  bool auraMcWaiverApplied, @JsonKey(name: 'making_charge_waiver_paise')  int makingChargeWaiverPaise, @JsonKey(name: 'making_charge_waiver_display')  String? makingChargeWaiverDisplay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
return $default(_that.order,_that.paymentRequired,_that.paymentAmountPaise,_that.paymentSessionId,_that.paymentUrl,_that.razorpayOrderId,_that.razorpayKeyId,_that.auraMcWaiverApplied,_that.makingChargeWaiverPaise,_that.makingChargeWaiverDisplay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Order order, @JsonKey(name: 'payment_required')  bool paymentRequired, @JsonKey(name: 'payment_amount_paise')  int paymentAmountPaise, @JsonKey(name: 'payment_session_id')  String? paymentSessionId, @JsonKey(name: 'payment_url')  String? paymentUrl, @JsonKey(name: 'razorpay_order_id')  String? razorpayOrderId, @JsonKey(name: 'razorpay_key_id')  String? razorpayKeyId, @JsonKey(name: 'aura_mc_waiver_applied')  bool auraMcWaiverApplied, @JsonKey(name: 'making_charge_waiver_paise')  int makingChargeWaiverPaise, @JsonKey(name: 'making_charge_waiver_display')  String? makingChargeWaiverDisplay)  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResponse():
return $default(_that.order,_that.paymentRequired,_that.paymentAmountPaise,_that.paymentSessionId,_that.paymentUrl,_that.razorpayOrderId,_that.razorpayKeyId,_that.auraMcWaiverApplied,_that.makingChargeWaiverPaise,_that.makingChargeWaiverDisplay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Order order, @JsonKey(name: 'payment_required')  bool paymentRequired, @JsonKey(name: 'payment_amount_paise')  int paymentAmountPaise, @JsonKey(name: 'payment_session_id')  String? paymentSessionId, @JsonKey(name: 'payment_url')  String? paymentUrl, @JsonKey(name: 'razorpay_order_id')  String? razorpayOrderId, @JsonKey(name: 'razorpay_key_id')  String? razorpayKeyId, @JsonKey(name: 'aura_mc_waiver_applied')  bool auraMcWaiverApplied, @JsonKey(name: 'making_charge_waiver_paise')  int makingChargeWaiverPaise, @JsonKey(name: 'making_charge_waiver_display')  String? makingChargeWaiverDisplay)?  $default,) {final _that = this;
switch (_that) {
case _CreateOrderResponse() when $default != null:
return $default(_that.order,_that.paymentRequired,_that.paymentAmountPaise,_that.paymentSessionId,_that.paymentUrl,_that.razorpayOrderId,_that.razorpayKeyId,_that.auraMcWaiverApplied,_that.makingChargeWaiverPaise,_that.makingChargeWaiverDisplay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOrderResponse implements CreateOrderResponse {
  const _CreateOrderResponse({required this.order, @JsonKey(name: 'payment_required') required this.paymentRequired, @JsonKey(name: 'payment_amount_paise') required this.paymentAmountPaise, @JsonKey(name: 'payment_session_id') this.paymentSessionId, @JsonKey(name: 'payment_url') this.paymentUrl, @JsonKey(name: 'razorpay_order_id') this.razorpayOrderId, @JsonKey(name: 'razorpay_key_id') this.razorpayKeyId, @JsonKey(name: 'aura_mc_waiver_applied') this.auraMcWaiverApplied = false, @JsonKey(name: 'making_charge_waiver_paise') this.makingChargeWaiverPaise = 0, @JsonKey(name: 'making_charge_waiver_display') this.makingChargeWaiverDisplay});
  factory _CreateOrderResponse.fromJson(Map<String, dynamic> json) => _$CreateOrderResponseFromJson(json);

@override final  Order order;
@override@JsonKey(name: 'payment_required') final  bool paymentRequired;
@override@JsonKey(name: 'payment_amount_paise') final  int paymentAmountPaise;
@override@JsonKey(name: 'payment_session_id') final  String? paymentSessionId;
@override@JsonKey(name: 'payment_url') final  String? paymentUrl;
@override@JsonKey(name: 'razorpay_order_id') final  String? razorpayOrderId;
@override@JsonKey(name: 'razorpay_key_id') final  String? razorpayKeyId;
@override@JsonKey(name: 'aura_mc_waiver_applied') final  bool auraMcWaiverApplied;
@override@JsonKey(name: 'making_charge_waiver_paise') final  int makingChargeWaiverPaise;
@override@JsonKey(name: 'making_charge_waiver_display') final  String? makingChargeWaiverDisplay;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOrderResponseCopyWith<_CreateOrderResponse> get copyWith => __$CreateOrderResponseCopyWithImpl<_CreateOrderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOrderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOrderResponse&&(identical(other.order, order) || other.order == order)&&(identical(other.paymentRequired, paymentRequired) || other.paymentRequired == paymentRequired)&&(identical(other.paymentAmountPaise, paymentAmountPaise) || other.paymentAmountPaise == paymentAmountPaise)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.razorpayOrderId, razorpayOrderId) || other.razorpayOrderId == razorpayOrderId)&&(identical(other.razorpayKeyId, razorpayKeyId) || other.razorpayKeyId == razorpayKeyId)&&(identical(other.auraMcWaiverApplied, auraMcWaiverApplied) || other.auraMcWaiverApplied == auraMcWaiverApplied)&&(identical(other.makingChargeWaiverPaise, makingChargeWaiverPaise) || other.makingChargeWaiverPaise == makingChargeWaiverPaise)&&(identical(other.makingChargeWaiverDisplay, makingChargeWaiverDisplay) || other.makingChargeWaiverDisplay == makingChargeWaiverDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,paymentRequired,paymentAmountPaise,paymentSessionId,paymentUrl,razorpayOrderId,razorpayKeyId,auraMcWaiverApplied,makingChargeWaiverPaise,makingChargeWaiverDisplay);

@override
String toString() {
  return 'CreateOrderResponse(order: $order, paymentRequired: $paymentRequired, paymentAmountPaise: $paymentAmountPaise, paymentSessionId: $paymentSessionId, paymentUrl: $paymentUrl, razorpayOrderId: $razorpayOrderId, razorpayKeyId: $razorpayKeyId, auraMcWaiverApplied: $auraMcWaiverApplied, makingChargeWaiverPaise: $makingChargeWaiverPaise, makingChargeWaiverDisplay: $makingChargeWaiverDisplay)';
}


}

/// @nodoc
abstract mixin class _$CreateOrderResponseCopyWith<$Res> implements $CreateOrderResponseCopyWith<$Res> {
  factory _$CreateOrderResponseCopyWith(_CreateOrderResponse value, $Res Function(_CreateOrderResponse) _then) = __$CreateOrderResponseCopyWithImpl;
@override @useResult
$Res call({
 Order order,@JsonKey(name: 'payment_required') bool paymentRequired,@JsonKey(name: 'payment_amount_paise') int paymentAmountPaise,@JsonKey(name: 'payment_session_id') String? paymentSessionId,@JsonKey(name: 'payment_url') String? paymentUrl,@JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,@JsonKey(name: 'razorpay_key_id') String? razorpayKeyId,@JsonKey(name: 'aura_mc_waiver_applied') bool auraMcWaiverApplied,@JsonKey(name: 'making_charge_waiver_paise') int makingChargeWaiverPaise,@JsonKey(name: 'making_charge_waiver_display') String? makingChargeWaiverDisplay
});


@override $OrderCopyWith<$Res> get order;

}
/// @nodoc
class __$CreateOrderResponseCopyWithImpl<$Res>
    implements _$CreateOrderResponseCopyWith<$Res> {
  __$CreateOrderResponseCopyWithImpl(this._self, this._then);

  final _CreateOrderResponse _self;
  final $Res Function(_CreateOrderResponse) _then;

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? paymentRequired = null,Object? paymentAmountPaise = null,Object? paymentSessionId = freezed,Object? paymentUrl = freezed,Object? razorpayOrderId = freezed,Object? razorpayKeyId = freezed,Object? auraMcWaiverApplied = null,Object? makingChargeWaiverPaise = null,Object? makingChargeWaiverDisplay = freezed,}) {
  return _then(_CreateOrderResponse(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,paymentRequired: null == paymentRequired ? _self.paymentRequired : paymentRequired // ignore: cast_nullable_to_non_nullable
as bool,paymentAmountPaise: null == paymentAmountPaise ? _self.paymentAmountPaise : paymentAmountPaise // ignore: cast_nullable_to_non_nullable
as int,paymentSessionId: freezed == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as String?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,razorpayOrderId: freezed == razorpayOrderId ? _self.razorpayOrderId : razorpayOrderId // ignore: cast_nullable_to_non_nullable
as String?,razorpayKeyId: freezed == razorpayKeyId ? _self.razorpayKeyId : razorpayKeyId // ignore: cast_nullable_to_non_nullable
as String?,auraMcWaiverApplied: null == auraMcWaiverApplied ? _self.auraMcWaiverApplied : auraMcWaiverApplied // ignore: cast_nullable_to_non_nullable
as bool,makingChargeWaiverPaise: null == makingChargeWaiverPaise ? _self.makingChargeWaiverPaise : makingChargeWaiverPaise // ignore: cast_nullable_to_non_nullable
as int,makingChargeWaiverDisplay: freezed == makingChargeWaiverDisplay ? _self.makingChargeWaiverDisplay : makingChargeWaiverDisplay // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CreateOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// @nodoc
mixin _$CancelOrderResponse {

 Order get order;@JsonKey(name: 'refund_initiated') bool get refundInitiated;
/// Create a copy of CancelOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancelOrderResponseCopyWith<CancelOrderResponse> get copyWith => _$CancelOrderResponseCopyWithImpl<CancelOrderResponse>(this as CancelOrderResponse, _$identity);

  /// Serializes this CancelOrderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelOrderResponse&&(identical(other.order, order) || other.order == order)&&(identical(other.refundInitiated, refundInitiated) || other.refundInitiated == refundInitiated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,refundInitiated);

@override
String toString() {
  return 'CancelOrderResponse(order: $order, refundInitiated: $refundInitiated)';
}


}

/// @nodoc
abstract mixin class $CancelOrderResponseCopyWith<$Res>  {
  factory $CancelOrderResponseCopyWith(CancelOrderResponse value, $Res Function(CancelOrderResponse) _then) = _$CancelOrderResponseCopyWithImpl;
@useResult
$Res call({
 Order order,@JsonKey(name: 'refund_initiated') bool refundInitiated
});


$OrderCopyWith<$Res> get order;

}
/// @nodoc
class _$CancelOrderResponseCopyWithImpl<$Res>
    implements $CancelOrderResponseCopyWith<$Res> {
  _$CancelOrderResponseCopyWithImpl(this._self, this._then);

  final CancelOrderResponse _self;
  final $Res Function(CancelOrderResponse) _then;

/// Create a copy of CancelOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? refundInitiated = null,}) {
  return _then(_self.copyWith(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,refundInitiated: null == refundInitiated ? _self.refundInitiated : refundInitiated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CancelOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// Adds pattern-matching-related methods to [CancelOrderResponse].
extension CancelOrderResponsePatterns on CancelOrderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CancelOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CancelOrderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CancelOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _CancelOrderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CancelOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CancelOrderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Order order, @JsonKey(name: 'refund_initiated')  bool refundInitiated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CancelOrderResponse() when $default != null:
return $default(_that.order,_that.refundInitiated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Order order, @JsonKey(name: 'refund_initiated')  bool refundInitiated)  $default,) {final _that = this;
switch (_that) {
case _CancelOrderResponse():
return $default(_that.order,_that.refundInitiated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Order order, @JsonKey(name: 'refund_initiated')  bool refundInitiated)?  $default,) {final _that = this;
switch (_that) {
case _CancelOrderResponse() when $default != null:
return $default(_that.order,_that.refundInitiated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CancelOrderResponse implements CancelOrderResponse {
  const _CancelOrderResponse({required this.order, @JsonKey(name: 'refund_initiated') required this.refundInitiated});
  factory _CancelOrderResponse.fromJson(Map<String, dynamic> json) => _$CancelOrderResponseFromJson(json);

@override final  Order order;
@override@JsonKey(name: 'refund_initiated') final  bool refundInitiated;

/// Create a copy of CancelOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelOrderResponseCopyWith<_CancelOrderResponse> get copyWith => __$CancelOrderResponseCopyWithImpl<_CancelOrderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CancelOrderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelOrderResponse&&(identical(other.order, order) || other.order == order)&&(identical(other.refundInitiated, refundInitiated) || other.refundInitiated == refundInitiated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,refundInitiated);

@override
String toString() {
  return 'CancelOrderResponse(order: $order, refundInitiated: $refundInitiated)';
}


}

/// @nodoc
abstract mixin class _$CancelOrderResponseCopyWith<$Res> implements $CancelOrderResponseCopyWith<$Res> {
  factory _$CancelOrderResponseCopyWith(_CancelOrderResponse value, $Res Function(_CancelOrderResponse) _then) = __$CancelOrderResponseCopyWithImpl;
@override @useResult
$Res call({
 Order order,@JsonKey(name: 'refund_initiated') bool refundInitiated
});


@override $OrderCopyWith<$Res> get order;

}
/// @nodoc
class __$CancelOrderResponseCopyWithImpl<$Res>
    implements _$CancelOrderResponseCopyWith<$Res> {
  __$CancelOrderResponseCopyWithImpl(this._self, this._then);

  final _CancelOrderResponse _self;
  final $Res Function(_CancelOrderResponse) _then;

/// Create a copy of CancelOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? refundInitiated = null,}) {
  return _then(_CancelOrderResponse(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,refundInitiated: null == refundInitiated ? _self.refundInitiated : refundInitiated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CancelOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

// dart format on
