// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogRef {

 String get id; String get name; String? get slug;@JsonKey(name: 'cover_image') String? get coverImage;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'bg_image_url') String? get bgImageUrl;@JsonKey(name: 'is_featured') bool get isFeatured;
/// Create a copy of CatalogRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<CatalogRef> get copyWith => _$CatalogRefCopyWithImpl<CatalogRef>(this as CatalogRef, _$identity);

  /// Serializes this CatalogRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bgImageUrl, bgImageUrl) || other.bgImageUrl == bgImageUrl)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,coverImage,imageUrl,bgImageUrl,isFeatured);

@override
String toString() {
  return 'CatalogRef(id: $id, name: $name, slug: $slug, coverImage: $coverImage, imageUrl: $imageUrl, bgImageUrl: $bgImageUrl, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class $CatalogRefCopyWith<$Res>  {
  factory $CatalogRefCopyWith(CatalogRef value, $Res Function(CatalogRef) _then) = _$CatalogRefCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? slug,@JsonKey(name: 'cover_image') String? coverImage,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'bg_image_url') String? bgImageUrl,@JsonKey(name: 'is_featured') bool isFeatured
});




}
/// @nodoc
class _$CatalogRefCopyWithImpl<$Res>
    implements $CatalogRefCopyWith<$Res> {
  _$CatalogRefCopyWithImpl(this._self, this._then);

  final CatalogRef _self;
  final $Res Function(CatalogRef) _then;

/// Create a copy of CatalogRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = freezed,Object? coverImage = freezed,Object? imageUrl = freezed,Object? bgImageUrl = freezed,Object? isFeatured = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,bgImageUrl: freezed == bgImageUrl ? _self.bgImageUrl : bgImageUrl // ignore: cast_nullable_to_non_nullable
as String?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogRef].
extension CatalogRefPatterns on CatalogRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogRef value)  $default,){
final _that = this;
switch (_that) {
case _CatalogRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogRef value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? slug, @JsonKey(name: 'cover_image')  String? coverImage, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'bg_image_url')  String? bgImageUrl, @JsonKey(name: 'is_featured')  bool isFeatured)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogRef() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.coverImage,_that.imageUrl,_that.bgImageUrl,_that.isFeatured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? slug, @JsonKey(name: 'cover_image')  String? coverImage, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'bg_image_url')  String? bgImageUrl, @JsonKey(name: 'is_featured')  bool isFeatured)  $default,) {final _that = this;
switch (_that) {
case _CatalogRef():
return $default(_that.id,_that.name,_that.slug,_that.coverImage,_that.imageUrl,_that.bgImageUrl,_that.isFeatured);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? slug, @JsonKey(name: 'cover_image')  String? coverImage, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'bg_image_url')  String? bgImageUrl, @JsonKey(name: 'is_featured')  bool isFeatured)?  $default,) {final _that = this;
switch (_that) {
case _CatalogRef() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.coverImage,_that.imageUrl,_that.bgImageUrl,_that.isFeatured);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogRef implements CatalogRef {
  const _CatalogRef({required this.id, required this.name, this.slug, @JsonKey(name: 'cover_image') this.coverImage, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'bg_image_url') this.bgImageUrl, @JsonKey(name: 'is_featured') this.isFeatured = false});
  factory _CatalogRef.fromJson(Map<String, dynamic> json) => _$CatalogRefFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? slug;
@override@JsonKey(name: 'cover_image') final  String? coverImage;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'bg_image_url') final  String? bgImageUrl;
@override@JsonKey(name: 'is_featured') final  bool isFeatured;

/// Create a copy of CatalogRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogRefCopyWith<_CatalogRef> get copyWith => __$CatalogRefCopyWithImpl<_CatalogRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bgImageUrl, bgImageUrl) || other.bgImageUrl == bgImageUrl)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,coverImage,imageUrl,bgImageUrl,isFeatured);

@override
String toString() {
  return 'CatalogRef(id: $id, name: $name, slug: $slug, coverImage: $coverImage, imageUrl: $imageUrl, bgImageUrl: $bgImageUrl, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class _$CatalogRefCopyWith<$Res> implements $CatalogRefCopyWith<$Res> {
  factory _$CatalogRefCopyWith(_CatalogRef value, $Res Function(_CatalogRef) _then) = __$CatalogRefCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? slug,@JsonKey(name: 'cover_image') String? coverImage,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'bg_image_url') String? bgImageUrl,@JsonKey(name: 'is_featured') bool isFeatured
});




}
/// @nodoc
class __$CatalogRefCopyWithImpl<$Res>
    implements _$CatalogRefCopyWith<$Res> {
  __$CatalogRefCopyWithImpl(this._self, this._then);

  final _CatalogRef _self;
  final $Res Function(_CatalogRef) _then;

/// Create a copy of CatalogRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = freezed,Object? coverImage = freezed,Object? imageUrl = freezed,Object? bgImageUrl = freezed,Object? isFeatured = null,}) {
  return _then(_CatalogRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,bgImageUrl: freezed == bgImageUrl ? _self.bgImageUrl : bgImageUrl // ignore: cast_nullable_to_non_nullable
as String?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ProductPrice {

@JsonKey(name: 'total_paise') int get totalPaise;@JsonKey(name: 'total_display') String get totalDisplay;@JsonKey(name: 'gold_value_paise') int get goldValuePaise;@JsonKey(name: 'gold_value_display') String get goldValueDisplay;@JsonKey(name: 'making_charge_paise') int get makingChargePaise;@JsonKey(name: 'making_charge_display') String get makingChargeDisplay;@JsonKey(name: 'wastage_paise') int get wastagePaise;@JsonKey(name: 'gst_paise') int get gstPaise;@JsonKey(name: 'gst_display') String get gstDisplay;@JsonKey(name: 'rate_used_paise') int get rateUsedPaise;@JsonKey(name: 'rate_display') String get rateDisplay;@JsonKey(name: 'rate_updated_at') String get rateUpdatedAt;@JsonKey(name: 'price_valid_until') String get priceValidUntil;
/// Create a copy of ProductPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductPriceCopyWith<ProductPrice> get copyWith => _$ProductPriceCopyWithImpl<ProductPrice>(this as ProductPrice, _$identity);

  /// Serializes this ProductPrice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductPrice&&(identical(other.totalPaise, totalPaise) || other.totalPaise == totalPaise)&&(identical(other.totalDisplay, totalDisplay) || other.totalDisplay == totalDisplay)&&(identical(other.goldValuePaise, goldValuePaise) || other.goldValuePaise == goldValuePaise)&&(identical(other.goldValueDisplay, goldValueDisplay) || other.goldValueDisplay == goldValueDisplay)&&(identical(other.makingChargePaise, makingChargePaise) || other.makingChargePaise == makingChargePaise)&&(identical(other.makingChargeDisplay, makingChargeDisplay) || other.makingChargeDisplay == makingChargeDisplay)&&(identical(other.wastagePaise, wastagePaise) || other.wastagePaise == wastagePaise)&&(identical(other.gstPaise, gstPaise) || other.gstPaise == gstPaise)&&(identical(other.gstDisplay, gstDisplay) || other.gstDisplay == gstDisplay)&&(identical(other.rateUsedPaise, rateUsedPaise) || other.rateUsedPaise == rateUsedPaise)&&(identical(other.rateDisplay, rateDisplay) || other.rateDisplay == rateDisplay)&&(identical(other.rateUpdatedAt, rateUpdatedAt) || other.rateUpdatedAt == rateUpdatedAt)&&(identical(other.priceValidUntil, priceValidUntil) || other.priceValidUntil == priceValidUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPaise,totalDisplay,goldValuePaise,goldValueDisplay,makingChargePaise,makingChargeDisplay,wastagePaise,gstPaise,gstDisplay,rateUsedPaise,rateDisplay,rateUpdatedAt,priceValidUntil);

@override
String toString() {
  return 'ProductPrice(totalPaise: $totalPaise, totalDisplay: $totalDisplay, goldValuePaise: $goldValuePaise, goldValueDisplay: $goldValueDisplay, makingChargePaise: $makingChargePaise, makingChargeDisplay: $makingChargeDisplay, wastagePaise: $wastagePaise, gstPaise: $gstPaise, gstDisplay: $gstDisplay, rateUsedPaise: $rateUsedPaise, rateDisplay: $rateDisplay, rateUpdatedAt: $rateUpdatedAt, priceValidUntil: $priceValidUntil)';
}


}

/// @nodoc
abstract mixin class $ProductPriceCopyWith<$Res>  {
  factory $ProductPriceCopyWith(ProductPrice value, $Res Function(ProductPrice) _then) = _$ProductPriceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_paise') int totalPaise,@JsonKey(name: 'total_display') String totalDisplay,@JsonKey(name: 'gold_value_paise') int goldValuePaise,@JsonKey(name: 'gold_value_display') String goldValueDisplay,@JsonKey(name: 'making_charge_paise') int makingChargePaise,@JsonKey(name: 'making_charge_display') String makingChargeDisplay,@JsonKey(name: 'wastage_paise') int wastagePaise,@JsonKey(name: 'gst_paise') int gstPaise,@JsonKey(name: 'gst_display') String gstDisplay,@JsonKey(name: 'rate_used_paise') int rateUsedPaise,@JsonKey(name: 'rate_display') String rateDisplay,@JsonKey(name: 'rate_updated_at') String rateUpdatedAt,@JsonKey(name: 'price_valid_until') String priceValidUntil
});




}
/// @nodoc
class _$ProductPriceCopyWithImpl<$Res>
    implements $ProductPriceCopyWith<$Res> {
  _$ProductPriceCopyWithImpl(this._self, this._then);

  final ProductPrice _self;
  final $Res Function(ProductPrice) _then;

/// Create a copy of ProductPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalPaise = null,Object? totalDisplay = null,Object? goldValuePaise = null,Object? goldValueDisplay = null,Object? makingChargePaise = null,Object? makingChargeDisplay = null,Object? wastagePaise = null,Object? gstPaise = null,Object? gstDisplay = null,Object? rateUsedPaise = null,Object? rateDisplay = null,Object? rateUpdatedAt = null,Object? priceValidUntil = null,}) {
  return _then(_self.copyWith(
totalPaise: null == totalPaise ? _self.totalPaise : totalPaise // ignore: cast_nullable_to_non_nullable
as int,totalDisplay: null == totalDisplay ? _self.totalDisplay : totalDisplay // ignore: cast_nullable_to_non_nullable
as String,goldValuePaise: null == goldValuePaise ? _self.goldValuePaise : goldValuePaise // ignore: cast_nullable_to_non_nullable
as int,goldValueDisplay: null == goldValueDisplay ? _self.goldValueDisplay : goldValueDisplay // ignore: cast_nullable_to_non_nullable
as String,makingChargePaise: null == makingChargePaise ? _self.makingChargePaise : makingChargePaise // ignore: cast_nullable_to_non_nullable
as int,makingChargeDisplay: null == makingChargeDisplay ? _self.makingChargeDisplay : makingChargeDisplay // ignore: cast_nullable_to_non_nullable
as String,wastagePaise: null == wastagePaise ? _self.wastagePaise : wastagePaise // ignore: cast_nullable_to_non_nullable
as int,gstPaise: null == gstPaise ? _self.gstPaise : gstPaise // ignore: cast_nullable_to_non_nullable
as int,gstDisplay: null == gstDisplay ? _self.gstDisplay : gstDisplay // ignore: cast_nullable_to_non_nullable
as String,rateUsedPaise: null == rateUsedPaise ? _self.rateUsedPaise : rateUsedPaise // ignore: cast_nullable_to_non_nullable
as int,rateDisplay: null == rateDisplay ? _self.rateDisplay : rateDisplay // ignore: cast_nullable_to_non_nullable
as String,rateUpdatedAt: null == rateUpdatedAt ? _self.rateUpdatedAt : rateUpdatedAt // ignore: cast_nullable_to_non_nullable
as String,priceValidUntil: null == priceValidUntil ? _self.priceValidUntil : priceValidUntil // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductPrice].
extension ProductPricePatterns on ProductPrice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductPrice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductPrice value)  $default,){
final _that = this;
switch (_that) {
case _ProductPrice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductPrice value)?  $default,){
final _that = this;
switch (_that) {
case _ProductPrice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'total_display')  String totalDisplay, @JsonKey(name: 'gold_value_paise')  int goldValuePaise, @JsonKey(name: 'gold_value_display')  String goldValueDisplay, @JsonKey(name: 'making_charge_paise')  int makingChargePaise, @JsonKey(name: 'making_charge_display')  String makingChargeDisplay, @JsonKey(name: 'wastage_paise')  int wastagePaise, @JsonKey(name: 'gst_paise')  int gstPaise, @JsonKey(name: 'gst_display')  String gstDisplay, @JsonKey(name: 'rate_used_paise')  int rateUsedPaise, @JsonKey(name: 'rate_display')  String rateDisplay, @JsonKey(name: 'rate_updated_at')  String rateUpdatedAt, @JsonKey(name: 'price_valid_until')  String priceValidUntil)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductPrice() when $default != null:
return $default(_that.totalPaise,_that.totalDisplay,_that.goldValuePaise,_that.goldValueDisplay,_that.makingChargePaise,_that.makingChargeDisplay,_that.wastagePaise,_that.gstPaise,_that.gstDisplay,_that.rateUsedPaise,_that.rateDisplay,_that.rateUpdatedAt,_that.priceValidUntil);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'total_display')  String totalDisplay, @JsonKey(name: 'gold_value_paise')  int goldValuePaise, @JsonKey(name: 'gold_value_display')  String goldValueDisplay, @JsonKey(name: 'making_charge_paise')  int makingChargePaise, @JsonKey(name: 'making_charge_display')  String makingChargeDisplay, @JsonKey(name: 'wastage_paise')  int wastagePaise, @JsonKey(name: 'gst_paise')  int gstPaise, @JsonKey(name: 'gst_display')  String gstDisplay, @JsonKey(name: 'rate_used_paise')  int rateUsedPaise, @JsonKey(name: 'rate_display')  String rateDisplay, @JsonKey(name: 'rate_updated_at')  String rateUpdatedAt, @JsonKey(name: 'price_valid_until')  String priceValidUntil)  $default,) {final _that = this;
switch (_that) {
case _ProductPrice():
return $default(_that.totalPaise,_that.totalDisplay,_that.goldValuePaise,_that.goldValueDisplay,_that.makingChargePaise,_that.makingChargeDisplay,_that.wastagePaise,_that.gstPaise,_that.gstDisplay,_that.rateUsedPaise,_that.rateDisplay,_that.rateUpdatedAt,_that.priceValidUntil);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_paise')  int totalPaise, @JsonKey(name: 'total_display')  String totalDisplay, @JsonKey(name: 'gold_value_paise')  int goldValuePaise, @JsonKey(name: 'gold_value_display')  String goldValueDisplay, @JsonKey(name: 'making_charge_paise')  int makingChargePaise, @JsonKey(name: 'making_charge_display')  String makingChargeDisplay, @JsonKey(name: 'wastage_paise')  int wastagePaise, @JsonKey(name: 'gst_paise')  int gstPaise, @JsonKey(name: 'gst_display')  String gstDisplay, @JsonKey(name: 'rate_used_paise')  int rateUsedPaise, @JsonKey(name: 'rate_display')  String rateDisplay, @JsonKey(name: 'rate_updated_at')  String rateUpdatedAt, @JsonKey(name: 'price_valid_until')  String priceValidUntil)?  $default,) {final _that = this;
switch (_that) {
case _ProductPrice() when $default != null:
return $default(_that.totalPaise,_that.totalDisplay,_that.goldValuePaise,_that.goldValueDisplay,_that.makingChargePaise,_that.makingChargeDisplay,_that.wastagePaise,_that.gstPaise,_that.gstDisplay,_that.rateUsedPaise,_that.rateDisplay,_that.rateUpdatedAt,_that.priceValidUntil);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductPrice implements ProductPrice {
  const _ProductPrice({@JsonKey(name: 'total_paise') required this.totalPaise, @JsonKey(name: 'total_display') required this.totalDisplay, @JsonKey(name: 'gold_value_paise') required this.goldValuePaise, @JsonKey(name: 'gold_value_display') required this.goldValueDisplay, @JsonKey(name: 'making_charge_paise') required this.makingChargePaise, @JsonKey(name: 'making_charge_display') required this.makingChargeDisplay, @JsonKey(name: 'wastage_paise') this.wastagePaise = 0, @JsonKey(name: 'gst_paise') required this.gstPaise, @JsonKey(name: 'gst_display') required this.gstDisplay, @JsonKey(name: 'rate_used_paise') required this.rateUsedPaise, @JsonKey(name: 'rate_display') required this.rateDisplay, @JsonKey(name: 'rate_updated_at') required this.rateUpdatedAt, @JsonKey(name: 'price_valid_until') required this.priceValidUntil});
  factory _ProductPrice.fromJson(Map<String, dynamic> json) => _$ProductPriceFromJson(json);

@override@JsonKey(name: 'total_paise') final  int totalPaise;
@override@JsonKey(name: 'total_display') final  String totalDisplay;
@override@JsonKey(name: 'gold_value_paise') final  int goldValuePaise;
@override@JsonKey(name: 'gold_value_display') final  String goldValueDisplay;
@override@JsonKey(name: 'making_charge_paise') final  int makingChargePaise;
@override@JsonKey(name: 'making_charge_display') final  String makingChargeDisplay;
@override@JsonKey(name: 'wastage_paise') final  int wastagePaise;
@override@JsonKey(name: 'gst_paise') final  int gstPaise;
@override@JsonKey(name: 'gst_display') final  String gstDisplay;
@override@JsonKey(name: 'rate_used_paise') final  int rateUsedPaise;
@override@JsonKey(name: 'rate_display') final  String rateDisplay;
@override@JsonKey(name: 'rate_updated_at') final  String rateUpdatedAt;
@override@JsonKey(name: 'price_valid_until') final  String priceValidUntil;

/// Create a copy of ProductPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductPriceCopyWith<_ProductPrice> get copyWith => __$ProductPriceCopyWithImpl<_ProductPrice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductPriceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductPrice&&(identical(other.totalPaise, totalPaise) || other.totalPaise == totalPaise)&&(identical(other.totalDisplay, totalDisplay) || other.totalDisplay == totalDisplay)&&(identical(other.goldValuePaise, goldValuePaise) || other.goldValuePaise == goldValuePaise)&&(identical(other.goldValueDisplay, goldValueDisplay) || other.goldValueDisplay == goldValueDisplay)&&(identical(other.makingChargePaise, makingChargePaise) || other.makingChargePaise == makingChargePaise)&&(identical(other.makingChargeDisplay, makingChargeDisplay) || other.makingChargeDisplay == makingChargeDisplay)&&(identical(other.wastagePaise, wastagePaise) || other.wastagePaise == wastagePaise)&&(identical(other.gstPaise, gstPaise) || other.gstPaise == gstPaise)&&(identical(other.gstDisplay, gstDisplay) || other.gstDisplay == gstDisplay)&&(identical(other.rateUsedPaise, rateUsedPaise) || other.rateUsedPaise == rateUsedPaise)&&(identical(other.rateDisplay, rateDisplay) || other.rateDisplay == rateDisplay)&&(identical(other.rateUpdatedAt, rateUpdatedAt) || other.rateUpdatedAt == rateUpdatedAt)&&(identical(other.priceValidUntil, priceValidUntil) || other.priceValidUntil == priceValidUntil));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalPaise,totalDisplay,goldValuePaise,goldValueDisplay,makingChargePaise,makingChargeDisplay,wastagePaise,gstPaise,gstDisplay,rateUsedPaise,rateDisplay,rateUpdatedAt,priceValidUntil);

@override
String toString() {
  return 'ProductPrice(totalPaise: $totalPaise, totalDisplay: $totalDisplay, goldValuePaise: $goldValuePaise, goldValueDisplay: $goldValueDisplay, makingChargePaise: $makingChargePaise, makingChargeDisplay: $makingChargeDisplay, wastagePaise: $wastagePaise, gstPaise: $gstPaise, gstDisplay: $gstDisplay, rateUsedPaise: $rateUsedPaise, rateDisplay: $rateDisplay, rateUpdatedAt: $rateUpdatedAt, priceValidUntil: $priceValidUntil)';
}


}

/// @nodoc
abstract mixin class _$ProductPriceCopyWith<$Res> implements $ProductPriceCopyWith<$Res> {
  factory _$ProductPriceCopyWith(_ProductPrice value, $Res Function(_ProductPrice) _then) = __$ProductPriceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_paise') int totalPaise,@JsonKey(name: 'total_display') String totalDisplay,@JsonKey(name: 'gold_value_paise') int goldValuePaise,@JsonKey(name: 'gold_value_display') String goldValueDisplay,@JsonKey(name: 'making_charge_paise') int makingChargePaise,@JsonKey(name: 'making_charge_display') String makingChargeDisplay,@JsonKey(name: 'wastage_paise') int wastagePaise,@JsonKey(name: 'gst_paise') int gstPaise,@JsonKey(name: 'gst_display') String gstDisplay,@JsonKey(name: 'rate_used_paise') int rateUsedPaise,@JsonKey(name: 'rate_display') String rateDisplay,@JsonKey(name: 'rate_updated_at') String rateUpdatedAt,@JsonKey(name: 'price_valid_until') String priceValidUntil
});




}
/// @nodoc
class __$ProductPriceCopyWithImpl<$Res>
    implements _$ProductPriceCopyWith<$Res> {
  __$ProductPriceCopyWithImpl(this._self, this._then);

  final _ProductPrice _self;
  final $Res Function(_ProductPrice) _then;

/// Create a copy of ProductPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalPaise = null,Object? totalDisplay = null,Object? goldValuePaise = null,Object? goldValueDisplay = null,Object? makingChargePaise = null,Object? makingChargeDisplay = null,Object? wastagePaise = null,Object? gstPaise = null,Object? gstDisplay = null,Object? rateUsedPaise = null,Object? rateDisplay = null,Object? rateUpdatedAt = null,Object? priceValidUntil = null,}) {
  return _then(_ProductPrice(
totalPaise: null == totalPaise ? _self.totalPaise : totalPaise // ignore: cast_nullable_to_non_nullable
as int,totalDisplay: null == totalDisplay ? _self.totalDisplay : totalDisplay // ignore: cast_nullable_to_non_nullable
as String,goldValuePaise: null == goldValuePaise ? _self.goldValuePaise : goldValuePaise // ignore: cast_nullable_to_non_nullable
as int,goldValueDisplay: null == goldValueDisplay ? _self.goldValueDisplay : goldValueDisplay // ignore: cast_nullable_to_non_nullable
as String,makingChargePaise: null == makingChargePaise ? _self.makingChargePaise : makingChargePaise // ignore: cast_nullable_to_non_nullable
as int,makingChargeDisplay: null == makingChargeDisplay ? _self.makingChargeDisplay : makingChargeDisplay // ignore: cast_nullable_to_non_nullable
as String,wastagePaise: null == wastagePaise ? _self.wastagePaise : wastagePaise // ignore: cast_nullable_to_non_nullable
as int,gstPaise: null == gstPaise ? _self.gstPaise : gstPaise // ignore: cast_nullable_to_non_nullable
as int,gstDisplay: null == gstDisplay ? _self.gstDisplay : gstDisplay // ignore: cast_nullable_to_non_nullable
as String,rateUsedPaise: null == rateUsedPaise ? _self.rateUsedPaise : rateUsedPaise // ignore: cast_nullable_to_non_nullable
as int,rateDisplay: null == rateDisplay ? _self.rateDisplay : rateDisplay // ignore: cast_nullable_to_non_nullable
as String,rateUpdatedAt: null == rateUpdatedAt ? _self.rateUpdatedAt : rateUpdatedAt // ignore: cast_nullable_to_non_nullable
as String,priceValidUntil: null == priceValidUntil ? _self.priceValidUntil : priceValidUntil // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SchemeMonthly {

@JsonKey(name: 'amount_paise') int get amountPaise;@JsonKey(name: 'amount_display') String get amountDisplay; int get months;
/// Create a copy of SchemeMonthly
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchemeMonthlyCopyWith<SchemeMonthly> get copyWith => _$SchemeMonthlyCopyWithImpl<SchemeMonthly>(this as SchemeMonthly, _$identity);

  /// Serializes this SchemeMonthly to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchemeMonthly&&(identical(other.amountPaise, amountPaise) || other.amountPaise == amountPaise)&&(identical(other.amountDisplay, amountDisplay) || other.amountDisplay == amountDisplay)&&(identical(other.months, months) || other.months == months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amountPaise,amountDisplay,months);

@override
String toString() {
  return 'SchemeMonthly(amountPaise: $amountPaise, amountDisplay: $amountDisplay, months: $months)';
}


}

/// @nodoc
abstract mixin class $SchemeMonthlyCopyWith<$Res>  {
  factory $SchemeMonthlyCopyWith(SchemeMonthly value, $Res Function(SchemeMonthly) _then) = _$SchemeMonthlyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'amount_paise') int amountPaise,@JsonKey(name: 'amount_display') String amountDisplay, int months
});




}
/// @nodoc
class _$SchemeMonthlyCopyWithImpl<$Res>
    implements $SchemeMonthlyCopyWith<$Res> {
  _$SchemeMonthlyCopyWithImpl(this._self, this._then);

  final SchemeMonthly _self;
  final $Res Function(SchemeMonthly) _then;

/// Create a copy of SchemeMonthly
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amountPaise = null,Object? amountDisplay = null,Object? months = null,}) {
  return _then(_self.copyWith(
amountPaise: null == amountPaise ? _self.amountPaise : amountPaise // ignore: cast_nullable_to_non_nullable
as int,amountDisplay: null == amountDisplay ? _self.amountDisplay : amountDisplay // ignore: cast_nullable_to_non_nullable
as String,months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SchemeMonthly].
extension SchemeMonthlyPatterns on SchemeMonthly {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchemeMonthly value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchemeMonthly() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchemeMonthly value)  $default,){
final _that = this;
switch (_that) {
case _SchemeMonthly():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchemeMonthly value)?  $default,){
final _that = this;
switch (_that) {
case _SchemeMonthly() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'amount_display')  String amountDisplay,  int months)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchemeMonthly() when $default != null:
return $default(_that.amountPaise,_that.amountDisplay,_that.months);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'amount_display')  String amountDisplay,  int months)  $default,) {final _that = this;
switch (_that) {
case _SchemeMonthly():
return $default(_that.amountPaise,_that.amountDisplay,_that.months);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'amount_paise')  int amountPaise, @JsonKey(name: 'amount_display')  String amountDisplay,  int months)?  $default,) {final _that = this;
switch (_that) {
case _SchemeMonthly() when $default != null:
return $default(_that.amountPaise,_that.amountDisplay,_that.months);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SchemeMonthly implements SchemeMonthly {
  const _SchemeMonthly({@JsonKey(name: 'amount_paise') required this.amountPaise, @JsonKey(name: 'amount_display') required this.amountDisplay, required this.months});
  factory _SchemeMonthly.fromJson(Map<String, dynamic> json) => _$SchemeMonthlyFromJson(json);

@override@JsonKey(name: 'amount_paise') final  int amountPaise;
@override@JsonKey(name: 'amount_display') final  String amountDisplay;
@override final  int months;

/// Create a copy of SchemeMonthly
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchemeMonthlyCopyWith<_SchemeMonthly> get copyWith => __$SchemeMonthlyCopyWithImpl<_SchemeMonthly>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SchemeMonthlyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchemeMonthly&&(identical(other.amountPaise, amountPaise) || other.amountPaise == amountPaise)&&(identical(other.amountDisplay, amountDisplay) || other.amountDisplay == amountDisplay)&&(identical(other.months, months) || other.months == months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amountPaise,amountDisplay,months);

@override
String toString() {
  return 'SchemeMonthly(amountPaise: $amountPaise, amountDisplay: $amountDisplay, months: $months)';
}


}

/// @nodoc
abstract mixin class _$SchemeMonthlyCopyWith<$Res> implements $SchemeMonthlyCopyWith<$Res> {
  factory _$SchemeMonthlyCopyWith(_SchemeMonthly value, $Res Function(_SchemeMonthly) _then) = __$SchemeMonthlyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'amount_paise') int amountPaise,@JsonKey(name: 'amount_display') String amountDisplay, int months
});




}
/// @nodoc
class __$SchemeMonthlyCopyWithImpl<$Res>
    implements _$SchemeMonthlyCopyWith<$Res> {
  __$SchemeMonthlyCopyWithImpl(this._self, this._then);

  final _SchemeMonthly _self;
  final $Res Function(_SchemeMonthly) _then;

/// Create a copy of SchemeMonthly
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amountPaise = null,Object? amountDisplay = null,Object? months = null,}) {
  return _then(_SchemeMonthly(
amountPaise: null == amountPaise ? _self.amountPaise : amountPaise // ignore: cast_nullable_to_non_nullable
as int,amountDisplay: null == amountDisplay ? _self.amountDisplay : amountDisplay // ignore: cast_nullable_to_non_nullable
as String,months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProductImage {

 String get id; String get url; String get type;@JsonKey(name: 'is_primary') bool get isPrimary;
/// Create a copy of ProductImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductImageCopyWith<ProductImage> get copyWith => _$ProductImageCopyWithImpl<ProductImage>(this as ProductImage, _$identity);

  /// Serializes this ProductImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,type,isPrimary);

@override
String toString() {
  return 'ProductImage(id: $id, url: $url, type: $type, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class $ProductImageCopyWith<$Res>  {
  factory $ProductImageCopyWith(ProductImage value, $Res Function(ProductImage) _then) = _$ProductImageCopyWithImpl;
@useResult
$Res call({
 String id, String url, String type,@JsonKey(name: 'is_primary') bool isPrimary
});




}
/// @nodoc
class _$ProductImageCopyWithImpl<$Res>
    implements $ProductImageCopyWith<$Res> {
  _$ProductImageCopyWithImpl(this._self, this._then);

  final ProductImage _self;
  final $Res Function(ProductImage) _then;

/// Create a copy of ProductImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? type = null,Object? isPrimary = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductImage].
extension ProductImagePatterns on ProductImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductImage value)  $default,){
final _that = this;
switch (_that) {
case _ProductImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductImage value)?  $default,){
final _that = this;
switch (_that) {
case _ProductImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  String type, @JsonKey(name: 'is_primary')  bool isPrimary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductImage() when $default != null:
return $default(_that.id,_that.url,_that.type,_that.isPrimary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  String type, @JsonKey(name: 'is_primary')  bool isPrimary)  $default,) {final _that = this;
switch (_that) {
case _ProductImage():
return $default(_that.id,_that.url,_that.type,_that.isPrimary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  String type, @JsonKey(name: 'is_primary')  bool isPrimary)?  $default,) {final _that = this;
switch (_that) {
case _ProductImage() when $default != null:
return $default(_that.id,_that.url,_that.type,_that.isPrimary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductImage implements ProductImage {
  const _ProductImage({required this.id, required this.url, required this.type, @JsonKey(name: 'is_primary') this.isPrimary = false});
  factory _ProductImage.fromJson(Map<String, dynamic> json) => _$ProductImageFromJson(json);

@override final  String id;
@override final  String url;
@override final  String type;
@override@JsonKey(name: 'is_primary') final  bool isPrimary;

/// Create a copy of ProductImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductImageCopyWith<_ProductImage> get copyWith => __$ProductImageCopyWithImpl<_ProductImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,type,isPrimary);

@override
String toString() {
  return 'ProductImage(id: $id, url: $url, type: $type, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class _$ProductImageCopyWith<$Res> implements $ProductImageCopyWith<$Res> {
  factory _$ProductImageCopyWith(_ProductImage value, $Res Function(_ProductImage) _then) = __$ProductImageCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, String type,@JsonKey(name: 'is_primary') bool isPrimary
});




}
/// @nodoc
class __$ProductImageCopyWithImpl<$Res>
    implements _$ProductImageCopyWith<$Res> {
  __$ProductImageCopyWithImpl(this._self, this._then);

  final _ProductImage _self;
  final $Res Function(_ProductImage) _then;

/// Create a copy of ProductImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? type = null,Object? isPrimary = null,}) {
  return _then(_ProductImage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Product {

 String get id; String get sku; String get name; CatalogRef? get category; CatalogRef? get collection; String get purity;@JsonKey(name: 'purity_display') String get purityDisplay;@JsonKey(name: 'weight_grams') String get weightGrams;@JsonKey(name: 'weight_display') String get weightDisplay; ProductPrice get price;@JsonKey(name: 'scheme_monthly') SchemeMonthly? get schemeMonthly;@JsonKey(name: 'primary_image') String? get primaryImage;@JsonKey(name: 'is_in_vault') bool get isInVault;@JsonKey(name: 'stock_available') bool get stockAvailable;@JsonKey(name: 'stock_label') String? get stockLabel;@JsonKey(name: 'has_ar') bool get hasAr; List<String> get badges; List<ProductImage> get images; String? get description;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.collection, collection) || other.collection == collection)&&(identical(other.purity, purity) || other.purity == purity)&&(identical(other.purityDisplay, purityDisplay) || other.purityDisplay == purityDisplay)&&(identical(other.weightGrams, weightGrams) || other.weightGrams == weightGrams)&&(identical(other.weightDisplay, weightDisplay) || other.weightDisplay == weightDisplay)&&(identical(other.price, price) || other.price == price)&&(identical(other.schemeMonthly, schemeMonthly) || other.schemeMonthly == schemeMonthly)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage)&&(identical(other.isInVault, isInVault) || other.isInVault == isInVault)&&(identical(other.stockAvailable, stockAvailable) || other.stockAvailable == stockAvailable)&&(identical(other.stockLabel, stockLabel) || other.stockLabel == stockLabel)&&(identical(other.hasAr, hasAr) || other.hasAr == hasAr)&&const DeepCollectionEquality().equals(other.badges, badges)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sku,name,category,collection,purity,purityDisplay,weightGrams,weightDisplay,price,schemeMonthly,primaryImage,isInVault,stockAvailable,stockLabel,hasAr,const DeepCollectionEquality().hash(badges),const DeepCollectionEquality().hash(images),description]);

@override
String toString() {
  return 'Product(id: $id, sku: $sku, name: $name, category: $category, collection: $collection, purity: $purity, purityDisplay: $purityDisplay, weightGrams: $weightGrams, weightDisplay: $weightDisplay, price: $price, schemeMonthly: $schemeMonthly, primaryImage: $primaryImage, isInVault: $isInVault, stockAvailable: $stockAvailable, stockLabel: $stockLabel, hasAr: $hasAr, badges: $badges, images: $images, description: $description)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String id, String sku, String name, CatalogRef? category, CatalogRef? collection, String purity,@JsonKey(name: 'purity_display') String purityDisplay,@JsonKey(name: 'weight_grams') String weightGrams,@JsonKey(name: 'weight_display') String weightDisplay, ProductPrice price,@JsonKey(name: 'scheme_monthly') SchemeMonthly? schemeMonthly,@JsonKey(name: 'primary_image') String? primaryImage,@JsonKey(name: 'is_in_vault') bool isInVault,@JsonKey(name: 'stock_available') bool stockAvailable,@JsonKey(name: 'stock_label') String? stockLabel,@JsonKey(name: 'has_ar') bool hasAr, List<String> badges, List<ProductImage> images, String? description
});


$CatalogRefCopyWith<$Res>? get category;$CatalogRefCopyWith<$Res>? get collection;$ProductPriceCopyWith<$Res> get price;$SchemeMonthlyCopyWith<$Res>? get schemeMonthly;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? category = freezed,Object? collection = freezed,Object? purity = null,Object? purityDisplay = null,Object? weightGrams = null,Object? weightDisplay = null,Object? price = null,Object? schemeMonthly = freezed,Object? primaryImage = freezed,Object? isInVault = null,Object? stockAvailable = null,Object? stockLabel = freezed,Object? hasAr = null,Object? badges = null,Object? images = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CatalogRef?,collection: freezed == collection ? _self.collection : collection // ignore: cast_nullable_to_non_nullable
as CatalogRef?,purity: null == purity ? _self.purity : purity // ignore: cast_nullable_to_non_nullable
as String,purityDisplay: null == purityDisplay ? _self.purityDisplay : purityDisplay // ignore: cast_nullable_to_non_nullable
as String,weightGrams: null == weightGrams ? _self.weightGrams : weightGrams // ignore: cast_nullable_to_non_nullable
as String,weightDisplay: null == weightDisplay ? _self.weightDisplay : weightDisplay // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as ProductPrice,schemeMonthly: freezed == schemeMonthly ? _self.schemeMonthly : schemeMonthly // ignore: cast_nullable_to_non_nullable
as SchemeMonthly?,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as String?,isInVault: null == isInVault ? _self.isInVault : isInVault // ignore: cast_nullable_to_non_nullable
as bool,stockAvailable: null == stockAvailable ? _self.stockAvailable : stockAvailable // ignore: cast_nullable_to_non_nullable
as bool,stockLabel: freezed == stockLabel ? _self.stockLabel : stockLabel // ignore: cast_nullable_to_non_nullable
as String?,hasAr: null == hasAr ? _self.hasAr : hasAr // ignore: cast_nullable_to_non_nullable
as bool,badges: null == badges ? _self.badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ProductImage>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CatalogRefCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<$Res>? get collection {
    if (_self.collection == null) {
    return null;
  }

  return $CatalogRefCopyWith<$Res>(_self.collection!, (value) {
    return _then(_self.copyWith(collection: value));
  });
}/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductPriceCopyWith<$Res> get price {
  
  return $ProductPriceCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SchemeMonthlyCopyWith<$Res>? get schemeMonthly {
    if (_self.schemeMonthly == null) {
    return null;
  }

  return $SchemeMonthlyCopyWith<$Res>(_self.schemeMonthly!, (value) {
    return _then(_self.copyWith(schemeMonthly: value));
  });
}
}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sku,  String name,  CatalogRef? category,  CatalogRef? collection,  String purity, @JsonKey(name: 'purity_display')  String purityDisplay, @JsonKey(name: 'weight_grams')  String weightGrams, @JsonKey(name: 'weight_display')  String weightDisplay,  ProductPrice price, @JsonKey(name: 'scheme_monthly')  SchemeMonthly? schemeMonthly, @JsonKey(name: 'primary_image')  String? primaryImage, @JsonKey(name: 'is_in_vault')  bool isInVault, @JsonKey(name: 'stock_available')  bool stockAvailable, @JsonKey(name: 'stock_label')  String? stockLabel, @JsonKey(name: 'has_ar')  bool hasAr,  List<String> badges,  List<ProductImage> images,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.category,_that.collection,_that.purity,_that.purityDisplay,_that.weightGrams,_that.weightDisplay,_that.price,_that.schemeMonthly,_that.primaryImage,_that.isInVault,_that.stockAvailable,_that.stockLabel,_that.hasAr,_that.badges,_that.images,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sku,  String name,  CatalogRef? category,  CatalogRef? collection,  String purity, @JsonKey(name: 'purity_display')  String purityDisplay, @JsonKey(name: 'weight_grams')  String weightGrams, @JsonKey(name: 'weight_display')  String weightDisplay,  ProductPrice price, @JsonKey(name: 'scheme_monthly')  SchemeMonthly? schemeMonthly, @JsonKey(name: 'primary_image')  String? primaryImage, @JsonKey(name: 'is_in_vault')  bool isInVault, @JsonKey(name: 'stock_available')  bool stockAvailable, @JsonKey(name: 'stock_label')  String? stockLabel, @JsonKey(name: 'has_ar')  bool hasAr,  List<String> badges,  List<ProductImage> images,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.sku,_that.name,_that.category,_that.collection,_that.purity,_that.purityDisplay,_that.weightGrams,_that.weightDisplay,_that.price,_that.schemeMonthly,_that.primaryImage,_that.isInVault,_that.stockAvailable,_that.stockLabel,_that.hasAr,_that.badges,_that.images,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sku,  String name,  CatalogRef? category,  CatalogRef? collection,  String purity, @JsonKey(name: 'purity_display')  String purityDisplay, @JsonKey(name: 'weight_grams')  String weightGrams, @JsonKey(name: 'weight_display')  String weightDisplay,  ProductPrice price, @JsonKey(name: 'scheme_monthly')  SchemeMonthly? schemeMonthly, @JsonKey(name: 'primary_image')  String? primaryImage, @JsonKey(name: 'is_in_vault')  bool isInVault, @JsonKey(name: 'stock_available')  bool stockAvailable, @JsonKey(name: 'stock_label')  String? stockLabel, @JsonKey(name: 'has_ar')  bool hasAr,  List<String> badges,  List<ProductImage> images,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.category,_that.collection,_that.purity,_that.purityDisplay,_that.weightGrams,_that.weightDisplay,_that.price,_that.schemeMonthly,_that.primaryImage,_that.isInVault,_that.stockAvailable,_that.stockLabel,_that.hasAr,_that.badges,_that.images,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({required this.id, required this.sku, required this.name, this.category, this.collection, required this.purity, @JsonKey(name: 'purity_display') required this.purityDisplay, @JsonKey(name: 'weight_grams') required this.weightGrams, @JsonKey(name: 'weight_display') required this.weightDisplay, required this.price, @JsonKey(name: 'scheme_monthly') this.schemeMonthly, @JsonKey(name: 'primary_image') this.primaryImage, @JsonKey(name: 'is_in_vault') this.isInVault = false, @JsonKey(name: 'stock_available') this.stockAvailable = true, @JsonKey(name: 'stock_label') this.stockLabel, @JsonKey(name: 'has_ar') this.hasAr = false, final  List<String> badges = const <String>[], final  List<ProductImage> images = const <ProductImage>[], this.description}): _badges = badges,_images = images;
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  String id;
@override final  String sku;
@override final  String name;
@override final  CatalogRef? category;
@override final  CatalogRef? collection;
@override final  String purity;
@override@JsonKey(name: 'purity_display') final  String purityDisplay;
@override@JsonKey(name: 'weight_grams') final  String weightGrams;
@override@JsonKey(name: 'weight_display') final  String weightDisplay;
@override final  ProductPrice price;
@override@JsonKey(name: 'scheme_monthly') final  SchemeMonthly? schemeMonthly;
@override@JsonKey(name: 'primary_image') final  String? primaryImage;
@override@JsonKey(name: 'is_in_vault') final  bool isInVault;
@override@JsonKey(name: 'stock_available') final  bool stockAvailable;
@override@JsonKey(name: 'stock_label') final  String? stockLabel;
@override@JsonKey(name: 'has_ar') final  bool hasAr;
 final  List<String> _badges;
@override@JsonKey() List<String> get badges {
  if (_badges is EqualUnmodifiableListView) return _badges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_badges);
}

 final  List<ProductImage> _images;
@override@JsonKey() List<ProductImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  String? description;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.collection, collection) || other.collection == collection)&&(identical(other.purity, purity) || other.purity == purity)&&(identical(other.purityDisplay, purityDisplay) || other.purityDisplay == purityDisplay)&&(identical(other.weightGrams, weightGrams) || other.weightGrams == weightGrams)&&(identical(other.weightDisplay, weightDisplay) || other.weightDisplay == weightDisplay)&&(identical(other.price, price) || other.price == price)&&(identical(other.schemeMonthly, schemeMonthly) || other.schemeMonthly == schemeMonthly)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage)&&(identical(other.isInVault, isInVault) || other.isInVault == isInVault)&&(identical(other.stockAvailable, stockAvailable) || other.stockAvailable == stockAvailable)&&(identical(other.stockLabel, stockLabel) || other.stockLabel == stockLabel)&&(identical(other.hasAr, hasAr) || other.hasAr == hasAr)&&const DeepCollectionEquality().equals(other._badges, _badges)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sku,name,category,collection,purity,purityDisplay,weightGrams,weightDisplay,price,schemeMonthly,primaryImage,isInVault,stockAvailable,stockLabel,hasAr,const DeepCollectionEquality().hash(_badges),const DeepCollectionEquality().hash(_images),description]);

@override
String toString() {
  return 'Product(id: $id, sku: $sku, name: $name, category: $category, collection: $collection, purity: $purity, purityDisplay: $purityDisplay, weightGrams: $weightGrams, weightDisplay: $weightDisplay, price: $price, schemeMonthly: $schemeMonthly, primaryImage: $primaryImage, isInVault: $isInVault, stockAvailable: $stockAvailable, stockLabel: $stockLabel, hasAr: $hasAr, badges: $badges, images: $images, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String sku, String name, CatalogRef? category, CatalogRef? collection, String purity,@JsonKey(name: 'purity_display') String purityDisplay,@JsonKey(name: 'weight_grams') String weightGrams,@JsonKey(name: 'weight_display') String weightDisplay, ProductPrice price,@JsonKey(name: 'scheme_monthly') SchemeMonthly? schemeMonthly,@JsonKey(name: 'primary_image') String? primaryImage,@JsonKey(name: 'is_in_vault') bool isInVault,@JsonKey(name: 'stock_available') bool stockAvailable,@JsonKey(name: 'stock_label') String? stockLabel,@JsonKey(name: 'has_ar') bool hasAr, List<String> badges, List<ProductImage> images, String? description
});


@override $CatalogRefCopyWith<$Res>? get category;@override $CatalogRefCopyWith<$Res>? get collection;@override $ProductPriceCopyWith<$Res> get price;@override $SchemeMonthlyCopyWith<$Res>? get schemeMonthly;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? category = freezed,Object? collection = freezed,Object? purity = null,Object? purityDisplay = null,Object? weightGrams = null,Object? weightDisplay = null,Object? price = null,Object? schemeMonthly = freezed,Object? primaryImage = freezed,Object? isInVault = null,Object? stockAvailable = null,Object? stockLabel = freezed,Object? hasAr = null,Object? badges = null,Object? images = null,Object? description = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CatalogRef?,collection: freezed == collection ? _self.collection : collection // ignore: cast_nullable_to_non_nullable
as CatalogRef?,purity: null == purity ? _self.purity : purity // ignore: cast_nullable_to_non_nullable
as String,purityDisplay: null == purityDisplay ? _self.purityDisplay : purityDisplay // ignore: cast_nullable_to_non_nullable
as String,weightGrams: null == weightGrams ? _self.weightGrams : weightGrams // ignore: cast_nullable_to_non_nullable
as String,weightDisplay: null == weightDisplay ? _self.weightDisplay : weightDisplay // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as ProductPrice,schemeMonthly: freezed == schemeMonthly ? _self.schemeMonthly : schemeMonthly // ignore: cast_nullable_to_non_nullable
as SchemeMonthly?,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as String?,isInVault: null == isInVault ? _self.isInVault : isInVault // ignore: cast_nullable_to_non_nullable
as bool,stockAvailable: null == stockAvailable ? _self.stockAvailable : stockAvailable // ignore: cast_nullable_to_non_nullable
as bool,stockLabel: freezed == stockLabel ? _self.stockLabel : stockLabel // ignore: cast_nullable_to_non_nullable
as String?,hasAr: null == hasAr ? _self.hasAr : hasAr // ignore: cast_nullable_to_non_nullable
as bool,badges: null == badges ? _self._badges : badges // ignore: cast_nullable_to_non_nullable
as List<String>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ProductImage>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CatalogRefCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogRefCopyWith<$Res>? get collection {
    if (_self.collection == null) {
    return null;
  }

  return $CatalogRefCopyWith<$Res>(_self.collection!, (value) {
    return _then(_self.copyWith(collection: value));
  });
}/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductPriceCopyWith<$Res> get price {
  
  return $ProductPriceCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SchemeMonthlyCopyWith<$Res>? get schemeMonthly {
    if (_self.schemeMonthly == null) {
    return null;
  }

  return $SchemeMonthlyCopyWith<$Res>(_self.schemeMonthly!, (value) {
    return _then(_self.copyWith(schemeMonthly: value));
  });
}
}


/// @nodoc
mixin _$CmsBanner {

 String get id; String get title;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'cta_label') String? get ctaLabel;@JsonKey(name: 'cta_route') String? get ctaRoute; String get placement;
/// Create a copy of CmsBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CmsBannerCopyWith<CmsBanner> get copyWith => _$CmsBannerCopyWithImpl<CmsBanner>(this as CmsBanner, _$identity);

  /// Serializes this CmsBanner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CmsBanner&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.ctaLabel, ctaLabel) || other.ctaLabel == ctaLabel)&&(identical(other.ctaRoute, ctaRoute) || other.ctaRoute == ctaRoute)&&(identical(other.placement, placement) || other.placement == placement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,ctaLabel,ctaRoute,placement);

@override
String toString() {
  return 'CmsBanner(id: $id, title: $title, imageUrl: $imageUrl, ctaLabel: $ctaLabel, ctaRoute: $ctaRoute, placement: $placement)';
}


}

/// @nodoc
abstract mixin class $CmsBannerCopyWith<$Res>  {
  factory $CmsBannerCopyWith(CmsBanner value, $Res Function(CmsBanner) _then) = _$CmsBannerCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'cta_label') String? ctaLabel,@JsonKey(name: 'cta_route') String? ctaRoute, String placement
});




}
/// @nodoc
class _$CmsBannerCopyWithImpl<$Res>
    implements $CmsBannerCopyWith<$Res> {
  _$CmsBannerCopyWithImpl(this._self, this._then);

  final CmsBanner _self;
  final $Res Function(CmsBanner) _then;

/// Create a copy of CmsBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? ctaLabel = freezed,Object? ctaRoute = freezed,Object? placement = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,ctaLabel: freezed == ctaLabel ? _self.ctaLabel : ctaLabel // ignore: cast_nullable_to_non_nullable
as String?,ctaRoute: freezed == ctaRoute ? _self.ctaRoute : ctaRoute // ignore: cast_nullable_to_non_nullable
as String?,placement: null == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CmsBanner].
extension CmsBannerPatterns on CmsBanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CmsBanner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CmsBanner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CmsBanner value)  $default,){
final _that = this;
switch (_that) {
case _CmsBanner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CmsBanner value)?  $default,){
final _that = this;
switch (_that) {
case _CmsBanner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'cta_label')  String? ctaLabel, @JsonKey(name: 'cta_route')  String? ctaRoute,  String placement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CmsBanner() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.ctaLabel,_that.ctaRoute,_that.placement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'cta_label')  String? ctaLabel, @JsonKey(name: 'cta_route')  String? ctaRoute,  String placement)  $default,) {final _that = this;
switch (_that) {
case _CmsBanner():
return $default(_that.id,_that.title,_that.imageUrl,_that.ctaLabel,_that.ctaRoute,_that.placement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'cta_label')  String? ctaLabel, @JsonKey(name: 'cta_route')  String? ctaRoute,  String placement)?  $default,) {final _that = this;
switch (_that) {
case _CmsBanner() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.ctaLabel,_that.ctaRoute,_that.placement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CmsBanner implements CmsBanner {
  const _CmsBanner({required this.id, required this.title, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'cta_label') this.ctaLabel, @JsonKey(name: 'cta_route') this.ctaRoute, required this.placement});
  factory _CmsBanner.fromJson(Map<String, dynamic> json) => _$CmsBannerFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'cta_label') final  String? ctaLabel;
@override@JsonKey(name: 'cta_route') final  String? ctaRoute;
@override final  String placement;

/// Create a copy of CmsBanner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CmsBannerCopyWith<_CmsBanner> get copyWith => __$CmsBannerCopyWithImpl<_CmsBanner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CmsBannerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CmsBanner&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.ctaLabel, ctaLabel) || other.ctaLabel == ctaLabel)&&(identical(other.ctaRoute, ctaRoute) || other.ctaRoute == ctaRoute)&&(identical(other.placement, placement) || other.placement == placement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,ctaLabel,ctaRoute,placement);

@override
String toString() {
  return 'CmsBanner(id: $id, title: $title, imageUrl: $imageUrl, ctaLabel: $ctaLabel, ctaRoute: $ctaRoute, placement: $placement)';
}


}

/// @nodoc
abstract mixin class _$CmsBannerCopyWith<$Res> implements $CmsBannerCopyWith<$Res> {
  factory _$CmsBannerCopyWith(_CmsBanner value, $Res Function(_CmsBanner) _then) = __$CmsBannerCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'cta_label') String? ctaLabel,@JsonKey(name: 'cta_route') String? ctaRoute, String placement
});




}
/// @nodoc
class __$CmsBannerCopyWithImpl<$Res>
    implements _$CmsBannerCopyWith<$Res> {
  __$CmsBannerCopyWithImpl(this._self, this._then);

  final _CmsBanner _self;
  final $Res Function(_CmsBanner) _then;

/// Create a copy of CmsBanner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? ctaLabel = freezed,Object? ctaRoute = freezed,Object? placement = null,}) {
  return _then(_CmsBanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,ctaLabel: freezed == ctaLabel ? _self.ctaLabel : ctaLabel // ignore: cast_nullable_to_non_nullable
as String?,ctaRoute: freezed == ctaRoute ? _self.ctaRoute : ctaRoute // ignore: cast_nullable_to_non_nullable
as String?,placement: null == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
