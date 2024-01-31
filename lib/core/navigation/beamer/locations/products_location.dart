import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:product_listing/feature/product/presentation/screens/screens.dart';

class ProductsLocation extends BeamLocation<BeamState> {
  static const route = '/products';

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('products'),
        name: 'Products',
        title: 'Products',
        child: ProductsScreen(),
      )
    ];
  }

  @override
  List<Pattern> get pathPatterns => const [route];
}
