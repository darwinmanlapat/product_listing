import 'package:flutter/material.dart';
import 'package:product_listing/core/navigation/router/type/product_route_path.dart';

class ProductRouteInformationParser
    extends RouteInformationParser<ProductRoutePath> {
  @override
  Future<ProductRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    // Handle '/products'
    if (uri.pathSegments.length == 1) {
      return ProductRoutePath.productList();
    }

    // Handle '/product/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'product') return ProductRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return ProductRoutePath.unknown();
      return ProductRoutePath.productDetails(id);
    }

    // Handle unknown routes
    return ProductRoutePath.unknown();
  }

  /// The [parseRouteInformation] method must produce an equivalent configuration when passed this method's return value.

  @override
  RouteInformation? restoreRouteInformation(ProductRoutePath configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(uri: Uri.parse(''));
    }
    if (configuration.isProductListPage) {
      return RouteInformation(uri: Uri.parse(''));
    }
    if (configuration.isProductDetailsPage) {
      return RouteInformation(uri: Uri.parse(''));
    }
    return null;
  }
}
