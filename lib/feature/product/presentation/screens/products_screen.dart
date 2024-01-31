import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_listing/core/enum/enum.dart';
import 'package:product_listing/feature/product/presentation/blocs/product/product_bloc.dart';
import 'package:product_listing/feature/product/presentation/layout/layout.dart';

class ProductsScreen extends HookWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return const ProductsShimmerLayout();
            case Status.success:
              return const ProductsLayout();
            case Status.error:
              return const Center(
                child: Text('Something went wrong. Please try again.'),
              );
          }
        },
      ),
    );
  }
}
