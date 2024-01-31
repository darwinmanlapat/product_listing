import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_listing/feature/product/presentation/component/grid/products_grid.dart';

class ProductsLayout extends HookWidget {
  const ProductsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage('assets/images/woman-with-shopping-bags.jpg'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xB3404453),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x4D404453),
                      Color(0xB3404453),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 24,
              right: 0,
              top: 100,
              child: Text(
                'SHOP NOW',
                style: TextStyle(
                  fontFamily: 'Clear Sans',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ProductsGrid(),
          ),
        ),
      ],
    );
  }
}
