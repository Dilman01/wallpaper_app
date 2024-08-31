import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.title,
    required this.svgPath,
    required this.isSelected,
  });

  final String title;
  final String svgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 180.w,
      child: Tab(
        icon: isSelected
            ? SvgPicture.asset(
                svgPath,
                height: 37.h,
                width: 31.w,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              )
            : SvgPicture.asset(
                svgPath,
                height: 37.h,
                width: 31.w,
              ),
        child: Center(
          child: isSelected
              ? Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                )
              : ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.onPrimary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
        ),
      ),
    );
  }
}
