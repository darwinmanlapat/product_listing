import 'package:flutter/material.dart';
import 'package:product_listing/core/widgets/widgets.dart';

class ProductShimmerLayout extends StatelessWidget {
  const ProductShimmerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ContainerShimmer(
          height: 572,
          margin: EdgeInsets.only(bottom: 16),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ContainerShimmer(
                height: 20,
                width: 300,
                margin: EdgeInsets.only(bottom: 8),
              ),
              const ContainerShimmer(
                height: 12,
                width: 150,
                margin: EdgeInsets.only(bottom: 24),
              ),
              const ContainerShimmer(
                height: 24,
                width: 200,
                margin: EdgeInsets.only(bottom: 10),
              ),
              Column(
                children: List.generate(
                  3,
                  (index) => const ContainerShimmer(
                    height: 14,
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
