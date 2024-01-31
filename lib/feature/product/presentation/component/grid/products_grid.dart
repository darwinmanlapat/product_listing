import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_listing/feature/product/presentation/blocs/product/product_bloc.dart';
import 'package:product_listing/feature/product/presentation/component/grid/products_grid_item.dart';
import 'package:product_listing/feature/product/presentation/component/grid/products_grid_shimmer.dart';

class ProductsGrid extends HookWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ProductBloc>().state;
    final stateWatch = context.watch<ProductBloc>().state;
    final scrollController = useScrollController();

    void onScroll() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<ProductBloc>().add(GetProducts());
        }
      }
    }

    useEffect(() {
      scrollController.addListener(onScroll);

      return null;
    }, []);

    useEffect(() {
      return null;
    }, [stateWatch]);

    if (state.products.isEmpty) {
      return const Center(
        child: Text('No Products Available'),
      );
    }
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ProductsGridItem(
                model: state.products[index],
              );
            },
            childCount: state.products.length,
          ),
        ),
        if (!state.hasReachedMax)
          SliverPadding(
            padding: const EdgeInsets.only(top: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const ProductsGridShimmer();
                },
                childCount: 1,
              ),
            ),
          )
      ],
    );
  }
}
