import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_listing/core/navigation/router/delegate/product_router_delegate.dart';
import 'package:product_listing/core/navigation/router/parser/product_route_info_parser.dart';

class ProductListingApp extends HookWidget {
  const ProductListingApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final routerDelegate = useMemoized(() {
    //   return BeamerDelegate(
    //     initialPath: ProductsLocation.route,
    //     locationBuilder: locationBuilder,
    //     transitionDelegate: const NoAnimationTransitionDelegate(),
    //     beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
    //   );
    // });

    final ProductRouterDelegate routerDelegate = ProductRouterDelegate();
    final ProductRouteInformationParser routeInformationParser =
        ProductRouteInformationParser();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: routeInformationParser,
    );
  }
}
