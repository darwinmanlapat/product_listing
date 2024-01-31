import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_listing/core/enum/enum.dart';
import 'package:product_listing/feature/product/presentation/blocs/selected_product/selected_product_bloc.dart';
import 'package:product_listing/feature/product/presentation/layout/layout.dart';
import 'package:product_listing/feature/product/presentation/layout/product_shimmer_layout.dart';

class ProductScreen extends HookWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SelectedProductBloc, SelectedProductState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return const ProductShimmerLayout();
            case Status.success:
              return const ProductLayout();
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
