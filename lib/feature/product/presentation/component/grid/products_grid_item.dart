import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing/feature/product/domain/model/product_model.dart';
import 'package:product_listing/feature/product/presentation/blocs/product/product_bloc.dart';
import 'package:product_listing/feature/product/presentation/blocs/selected_product/selected_product_bloc.dart';

class ProductsGridItem extends StatelessWidget {
  const ProductsGridItem({
    super.key,
    required this.model,
  });

  final Product model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SelectedProductBloc>().add(
              GetProductById(
                id: model.id!,
              ),
            );
        context.read<ProductBloc>().add(ProductSelect(true));

        // Beamer.of(context).beamToNamed(ProductLocation.route);
      },
      child: Opacity(
        opacity: 0.93,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: 140,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(model.thumbnail ??
                  'https://dummyimage.com/140x200/6b686b/ffffff.png&text=Image+not+available'),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0x00404453),
                      Color(0xFF404453),
                    ],
                    stops: [
                      0.0,
                      1.0,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 17,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _GridItemTitle(
                        title: model.title ?? '',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _GridItemPrice(
                            price: model.price,
                            discount: model.discountPercentage,
                          ),
                          _GridItemDiscount(
                            discount: model.discountPercentage,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GridItemTitle extends StatelessWidget {
  const _GridItemTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Clear Sans',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.25,
      ),
      overflow: TextOverflow.ellipsis,
      softWrap: false,
    );
  }
}

class _GridItemPrice extends StatelessWidget {
  const _GridItemPrice({
    Key? key,
    required this.price,
    required this.discount,
  }) : super(key: key);

  final int? price;
  final num? discount;

  @override
  Widget build(BuildContext context) {
    final originalPrice = price! / (1 - (discount! / 100));

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '\$${price.toString()} ',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              height: 2,
            ),
          ),
          TextSpan(
            text: '\$${originalPrice.ceil().toString()}',
            style: const TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}

class _GridItemDiscount extends StatelessWidget {
  const _GridItemDiscount({
    Key? key,
    required this.discount,
  }) : super(key: key);

  final num? discount;

  @override
  Widget build(BuildContext context) {
    return Text(
      ' ${discount?.ceil()}% OFF',
      maxLines: 1,
      style: const TextStyle(
        color: Colors.greenAccent,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        letterSpacing: 0.8,
        height: 2,
      ),
      overflow: TextOverflow.ellipsis,
      softWrap: false,
    );
  }
}
