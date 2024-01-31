import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.length,
    required this.currentPage,
  });

  final int length;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        length,
        (index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: currentPage % length == index
                  ? const Color(0xFF05B89D)
                  : const Color(0xB3404453),
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
