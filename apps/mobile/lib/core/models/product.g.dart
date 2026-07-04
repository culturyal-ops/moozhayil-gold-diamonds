// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogRef _$CatalogRefFromJson(Map<String, dynamic> json) => _CatalogRef(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String?,
  coverImage: json['cover_image'] as String?,
  imageUrl: json['image_url'] as String?,
  bgImageUrl: json['bg_image_url'] as String?,
  isFeatured: json['is_featured'] as bool? ?? false,
);

Map<String, dynamic> _$CatalogRefToJson(_CatalogRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'cover_image': instance.coverImage,
      'image_url': instance.imageUrl,
      'bg_image_url': instance.bgImageUrl,
      'is_featured': instance.isFeatured,
    };

_ProductPrice _$ProductPriceFromJson(Map<String, dynamic> json) =>
    _ProductPrice(
      totalPaise: (json['total_paise'] as num).toInt(),
      totalDisplay: json['total_display'] as String,
      goldValuePaise: (json['gold_value_paise'] as num).toInt(),
      goldValueDisplay: json['gold_value_display'] as String,
      makingChargePaise: (json['making_charge_paise'] as num).toInt(),
      makingChargeDisplay: json['making_charge_display'] as String,
      wastagePaise: (json['wastage_paise'] as num?)?.toInt() ?? 0,
      gstPaise: (json['gst_paise'] as num).toInt(),
      gstDisplay: json['gst_display'] as String,
      rateUsedPaise: (json['rate_used_paise'] as num).toInt(),
      rateDisplay: json['rate_display'] as String,
      rateUpdatedAt: json['rate_updated_at'] as String,
      priceValidUntil: json['price_valid_until'] as String,
    );

Map<String, dynamic> _$ProductPriceToJson(_ProductPrice instance) =>
    <String, dynamic>{
      'total_paise': instance.totalPaise,
      'total_display': instance.totalDisplay,
      'gold_value_paise': instance.goldValuePaise,
      'gold_value_display': instance.goldValueDisplay,
      'making_charge_paise': instance.makingChargePaise,
      'making_charge_display': instance.makingChargeDisplay,
      'wastage_paise': instance.wastagePaise,
      'gst_paise': instance.gstPaise,
      'gst_display': instance.gstDisplay,
      'rate_used_paise': instance.rateUsedPaise,
      'rate_display': instance.rateDisplay,
      'rate_updated_at': instance.rateUpdatedAt,
      'price_valid_until': instance.priceValidUntil,
    };

_SchemeMonthly _$SchemeMonthlyFromJson(Map<String, dynamic> json) =>
    _SchemeMonthly(
      amountPaise: (json['amount_paise'] as num).toInt(),
      amountDisplay: json['amount_display'] as String,
      months: (json['months'] as num).toInt(),
    );

Map<String, dynamic> _$SchemeMonthlyToJson(_SchemeMonthly instance) =>
    <String, dynamic>{
      'amount_paise': instance.amountPaise,
      'amount_display': instance.amountDisplay,
      'months': instance.months,
    };

_ProductImage _$ProductImageFromJson(Map<String, dynamic> json) =>
    _ProductImage(
      id: json['id'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
      isPrimary: json['is_primary'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductImageToJson(_ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'type': instance.type,
      'is_primary': instance.isPrimary,
    };

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  sku: json['sku'] as String,
  name: json['name'] as String,
  category: json['category'] == null
      ? null
      : CatalogRef.fromJson(json['category'] as Map<String, dynamic>),
  collection: json['collection'] == null
      ? null
      : CatalogRef.fromJson(json['collection'] as Map<String, dynamic>),
  purity: json['purity'] as String,
  purityDisplay: json['purity_display'] as String,
  weightGrams: json['weight_grams'] as String,
  weightDisplay: json['weight_display'] as String,
  price: ProductPrice.fromJson(json['price'] as Map<String, dynamic>),
  schemeMonthly: json['scheme_monthly'] == null
      ? null
      : SchemeMonthly.fromJson(json['scheme_monthly'] as Map<String, dynamic>),
  primaryImage: json['primary_image'] as String?,
  isInVault: json['is_in_vault'] as bool? ?? false,
  stockAvailable: json['stock_available'] as bool? ?? true,
  stockLabel: json['stock_label'] as String?,
  hasAr: json['has_ar'] as bool? ?? false,
  badges:
      (json['badges'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductImage>[],
  description: json['description'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'name': instance.name,
  'category': instance.category,
  'collection': instance.collection,
  'purity': instance.purity,
  'purity_display': instance.purityDisplay,
  'weight_grams': instance.weightGrams,
  'weight_display': instance.weightDisplay,
  'price': instance.price,
  'scheme_monthly': instance.schemeMonthly,
  'primary_image': instance.primaryImage,
  'is_in_vault': instance.isInVault,
  'stock_available': instance.stockAvailable,
  'stock_label': instance.stockLabel,
  'has_ar': instance.hasAr,
  'badges': instance.badges,
  'images': instance.images,
  'description': instance.description,
};

_CmsBanner _$CmsBannerFromJson(Map<String, dynamic> json) => _CmsBanner(
  id: json['id'] as String,
  title: json['title'] as String,
  imageUrl: json['image_url'] as String,
  ctaLabel: json['cta_label'] as String?,
  ctaRoute: json['cta_route'] as String?,
  placement: json['placement'] as String,
);

Map<String, dynamic> _$CmsBannerToJson(_CmsBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'cta_label': instance.ctaLabel,
      'cta_route': instance.ctaRoute,
      'placement': instance.placement,
    };
