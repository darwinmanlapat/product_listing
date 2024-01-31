import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_listing/feature/product/presentation/blocs/selected_product/selected_product_bloc.dart';
import 'package:product_listing/feature/product/presentation/component/carousel/carousel_indicator.dart';
import 'package:product_listing/feature/product/presentation/component/carousel/carousel_item.dart';

class Carousel extends HookWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<SelectedProductBloc>().state;
    final currentPage = useState(0);

    PageController? pageController;
    Timer? timer;
    const pageTurnDuration = Duration(milliseconds: 700);
    const Curve pageTurnCurve = Curves.easeInOutCubic;

    void goForward() {
      pageController?.nextPage(
        duration: pageTurnDuration,
        curve: pageTurnCurve,
      );
    }

    useEffect(
      () {
        pageController = PageController(
          initialPage: currentPage.value,
        );

        timer = Timer.periodic(
          const Duration(seconds: 3),
          (Timer t) => goForward(),
        );

        return () {
          timer?.cancel();
          pageController?.dispose();
        };
      },
    );

    return GestureDetector(
      onLongPress: timer?.cancel,
      onLongPressUp: () {
        timer = Timer.periodic(
          const Duration(seconds: 3),
          (Timer t) => goForward(),
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 572,
              child: PageView.builder(
                controller: pageController,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (page) {
                  currentPage.value = page;
                },
                itemBuilder: (context, index) {
                  return CarouselItem(
                    imageUrl: state
                        .product.images?[index % state.product.images!.length],
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 530,
              child: CarouselIndicator(
                length: state.product.images!.length,
                currentPage: currentPage.value,
              ),
            )
          ],
        ),
      ),
    );
  }
}
