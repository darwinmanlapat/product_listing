import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:product_listing/core/navigation/beamer/locations/locations.dart';
import 'package:product_listing/feature/product/presentation/screens/screens.dart';


class ProductLocation extends BeamLocation<BeamState> {
  static const route = '/product';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('product'),
        name: 'Product',
        title: 'Product',
        popToNamed: ProductsLocation.route,
        child: ProductScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
