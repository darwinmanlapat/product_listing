import 'package:flutter/material.dart';
import 'package:product_listing/core/widgets/shimmer.dart';

class ProductsGridShimmer extends StatelessWidget {
  const ProductsGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: 140,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey,
              ),
              margin: const EdgeInsets.only(bottom: 16),
            );
          },
        ),
      ),
    );
  }
}
