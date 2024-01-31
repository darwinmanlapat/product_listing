import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CarouselItem extends HookWidget {
  const CarouselItem({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl ??
                'https://dummyimage.com/390x572/6b686b/ffffff.png&text=Image+not+available',
          ),
          fit: BoxFit.contain,
        ),
      ),
      child: Container(
        height: 340,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Color(0x006E6E6E),
              Color(0x006E6E6E),
            ],
            stops: [0.0, 1.0],
          ),
        ),
      ),
    );
  }
}
