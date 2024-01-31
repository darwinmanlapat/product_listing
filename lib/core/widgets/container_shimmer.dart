import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerShimmer extends StatelessWidget {
  const ContainerShimmer({
    super.key,
    required this.height,
    this.width,
    this.margin,
  });

  final double? width;
  final double height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: margin,
        width: width ?? double.infinity,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }
}
