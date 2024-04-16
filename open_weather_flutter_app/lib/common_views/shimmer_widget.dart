import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final bool? isRounded;
  final double? height;
  final double? width;
  const ShimmerWidget({super.key, this.height, this.isRounded, this.width});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Change the base color as needed
      highlightColor: Colors.grey[100]!, // Change the highlight color as needed
      child: Container(
        decoration: isRounded != null
            ? const BoxDecoration(color: Colors.black, shape: BoxShape.circle)
            : BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
        height: height,
        width: width,
      ),
    );
  }
}
