import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_listing/feature/product/presentation/blocs/selected_product/selected_product_bloc.dart';
import 'package:product_listing/feature/product/presentation/component/carousel/carousel.dart';

class ProductLayout extends HookWidget {
  const ProductLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<SelectedProductBloc>().state.product;

    return Column(
      children: [
        Stack(
          children: [
            const Carousel(),
            SafeArea(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                color: const Color(0xFF05B89D),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title ?? '',
                              style: const TextStyle(
                                fontFamily: 'Clear Sans',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF404453),
                              ),
                            ),
                            Text(
                              product.category ?? '',
                              style: const TextStyle(
                                fontFamily: 'Clear Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF05B89D),
                              ),
                            ),
                            Text(
                              '\$${product.price} | Stock: ${product.stock}',
                              style: const TextStyle(
                                fontFamily: 'Clear Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF404453),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                            ),
                            Text(
                              '${product.rating}',
                              style: const TextStyle(
                                fontFamily: 'Clear Sans',
                                color: Color(0x80404453),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Clear Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF404453),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description ?? '',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontFamily: 'Clear Sans',
                      color: Color(0xFF404453),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
