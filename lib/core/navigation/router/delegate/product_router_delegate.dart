import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing/core/navigation/router/type/product_route_path.dart';
import 'package:product_listing/feature/product/presentation/blocs/product/product_bloc.dart';
import 'package:product_listing/feature/product/presentation/screens/screens.dart';

class ProductRouterDelegate extends RouterDelegate<ProductRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ProductRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  ProductRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final state = context.read<ProductBloc>();
    final stateWatch = context.watch<ProductBloc>().state;

    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(
          key: ValueKey('ProductListScreen'),
          child: ProductsScreen(),
        ),
        if (stateWatch.isProductSelected == true)
          const MaterialPage(
            key: ValueKey('ProductDetailsScreen'),
            child: ProductScreen(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        state.add(ProductSelect(false));
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(ProductRoutePath configuration) async {}
}
