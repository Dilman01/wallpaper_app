import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.onSecondaryFixed,
      highlightColor: Theme.of(context).colorScheme.onPrimaryFixed,
      child: Container(
        height: 360.h,
        width: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: Theme.of(context).colorScheme.onPrimaryFixed,
        ),
      ),
    );
  }
}
