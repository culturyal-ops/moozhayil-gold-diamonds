import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/app_routes.dart';

/// Deep-link navigation from CMS banner [ctaRoute] values.
void navigateCmsRoute(BuildContext context, String? route) {
  if (route == null || route.isEmpty) {
    context.go(AppRoutes.shop);
    return;
  }

  final path = route.startsWith('/') ? route : '/$route';
  if (path.startsWith(AppRoutes.shopProduct.replaceFirst(':productId', ''))) {
    context.push(path);
    return;
  }
  context.go(path);
}
