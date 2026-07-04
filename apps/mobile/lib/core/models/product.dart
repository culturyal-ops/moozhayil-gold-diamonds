// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class CatalogRef with _$CatalogRef {
  const factory CatalogRef({
    required String id,
    required String name,
    String? slug,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'bg_image_url') String? bgImageUrl,
    @JsonKey(name: 'is_featured') @Default(false) bool isFeatured,
  }) = _CatalogRef;

  factory CatalogRef.fromJson(Map<String, dynamic> json) =>
      _$CatalogRefFromJson(json);
}

@freezed
abstract class ProductPrice with _$ProductPrice {
  const factory ProductPrice({
    @JsonKey(name: 'total_paise') required int totalPaise,
    @JsonKey(name: 'total_display') required String totalDisplay,
    @JsonKey(name: 'gold_value_paise') required int goldValuePaise,
    @JsonKey(name: 'gold_value_display') required String goldValueDisplay,
    @JsonKey(name: 'making_charge_paise') required int makingChargePaise,
    @JsonKey(name: 'making_charge_display') required String makingChargeDisplay,
    @JsonKey(name: 'wastage_paise') @Default(0) int wastagePaise,
    @JsonKey(name: 'gst_paise') required int gstPaise,
    @JsonKey(name: 'gst_display') required String gstDisplay,
    @JsonKey(name: 'rate_used_paise') required int rateUsedPaise,
    @JsonKey(name: 'rate_display') required String rateDisplay,
    @JsonKey(name: 'rate_updated_at') required String rateUpdatedAt,
    @JsonKey(name: 'price_valid_until') required String priceValidUntil,
  }) = _ProductPrice;

  factory ProductPrice.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceFromJson(json);
}

@freezed
abstract class SchemeMonthly with _$SchemeMonthly {
  const factory SchemeMonthly({
    @JsonKey(name: 'amount_paise') required int amountPaise,
    @JsonKey(name: 'amount_display') required String amountDisplay,
    required int months,
  }) = _SchemeMonthly;

  factory SchemeMonthly.fromJson(Map<String, dynamic> json) =>
      _$SchemeMonthlyFromJson(json);
}

@freezed
abstract class ProductImage with _$ProductImage {
  const factory ProductImage({
    required String id,
    required String url,
    required String type,
    @JsonKey(name: 'is_primary') @Default(false) bool isPrimary,
  }) = _ProductImage;

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String sku,
    required String name,
    CatalogRef? category,
    CatalogRef? collection,
    required String purity,
    @JsonKey(name: 'purity_display') required String purityDisplay,
    @JsonKey(name: 'weight_grams') required String weightGrams,
    @JsonKey(name: 'weight_display') required String weightDisplay,
    required ProductPrice price,
    @JsonKey(name: 'scheme_monthly') SchemeMonthly? schemeMonthly,
    @JsonKey(name: 'primary_image') String? primaryImage,
    @JsonKey(name: 'is_in_vault') @Default(false) bool isInVault,
    @JsonKey(name: 'stock_available') @Default(true) bool stockAvailable,
    @JsonKey(name: 'stock_label') String? stockLabel,
    @JsonKey(name: 'has_ar') @Default(false) bool hasAr,
    @Default(<String>[]) List<String> badges,
    @Default(<ProductImage>[]) List<ProductImage> images,
    String? description,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
abstract class CmsBanner with _$CmsBanner {
  const factory CmsBanner({
    required String id,
    required String title,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'cta_label') String? ctaLabel,
    @JsonKey(name: 'cta_route') String? ctaRoute,
    required String placement,
  }) = _CmsBanner;

  factory CmsBanner.fromJson(Map<String, dynamic> json) =>
      _$CmsBannerFromJson(json);
}
