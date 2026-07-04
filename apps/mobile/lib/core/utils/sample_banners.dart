import '../models/product.dart';
import 'sample_imagery.dart';

/// Editorial banner fallbacks when CMS placements are empty (dev / offline).
abstract final class SampleBanners {
  static CmsBanner get hero => CmsBanner(
        id: 'sample-hero',
        title: 'Elegance\nmeets mastery',
        imageUrl: SampleImagery.hero(width: 1600),
        ctaLabel: 'Explore the collection',
        ctaRoute: '/shop',
        placement: 'home_hero',
      );

  static List<CmsBanner> get homeEdit => [
        CmsBanner(
          id: 'sample-edit-1',
          title: 'Bridal edit',
          imageUrl: SampleImagery.editorial('edit-bridal', width: 900),
          ctaLabel: 'Shop bridal',
          ctaRoute: '/shop',
          placement: 'home_edit',
        ),
        CmsBanner(
          id: 'sample-edit-2',
          title: 'Everyday gold',
          imageUrl: SampleImagery.product('edit-daily', width: 900),
          ctaLabel: 'Discover',
          ctaRoute: '/shop',
          placement: 'home_edit',
        ),
        CmsBanner(
          id: 'sample-edit-3',
          title: 'Festive glow',
          imageUrl: SampleImagery.editorial('edit-festive', width: 900),
          ctaLabel: 'View pieces',
          ctaRoute: '/shop',
          placement: 'home_edit',
        ),
      ];

  static CmsBanner get homeFeature => CmsBanner(
        id: 'sample-feature',
        title: 'Whisper of Pearl',
        imageUrl: SampleImagery.editorial('home-pearl', width: 1400),
        ctaLabel: 'Explore collection',
        ctaRoute: '/shop',
        placement: 'home_feature',
      );

  static CmsBanner get shopTop => CmsBanner(
        id: 'sample-shop-top',
        title: 'The maison',
        imageUrl: SampleImagery.editorial('shop-hero', width: 1600),
        ctaLabel: 'Browse catalog',
        ctaRoute: '/shop/search',
        placement: 'shop_top',
      );

  static List<CmsBanner> forPlacement(String placement) {
    return switch (placement) {
      'home_hero' => homeHeroCarousel,
      'home_edit' => homeEdit,
      'home_feature' => [homeFeature],
      'shop_top' => [shopTop],
      _ => const [],
    };
  }

  /// Multiple hero slides for the home carousel (dev / offline fallback).
  static List<CmsBanner> get homeHeroCarousel => [
        hero,
        CmsBanner(
          id: 'sample-hero-2',
          title: 'Crafted for\nmilestones',
          imageUrl: SampleImagery.editorial('hero-milestone', width: 1600),
          ctaLabel: 'Shop jewellery',
          ctaRoute: '/shop',
          placement: 'home_hero',
        ),
        CmsBanner(
          id: 'sample-hero-3',
          title: 'Bridal\ncollections',
          imageUrl: SampleImagery.editorial('hero-bridal', width: 1600),
          ctaLabel: 'Explore bridal',
          ctaRoute: '/shop',
          placement: 'home_hero',
        ),
      ];
}
