import 'package:flutter/material.dart';
import 'package:product_listing/core/widgets/widgets.dart';
import 'package:product_listing/feature/product/presentation/component/grid/products_grid_shimmer.dart';

class ProductsShimmerLayout extends StatelessWidget {
  const ProductsShimmerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ContainerShimmer(
          height: 240,
          margin: EdgeInsets.only(bottom: 12),
        ),
        ProductsGridShimmer(),
      ],
    );
  }
}
