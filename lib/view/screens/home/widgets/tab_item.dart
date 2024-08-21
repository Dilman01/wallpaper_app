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
    return Tab(
      height: 80.h,
      // iconMargin: EdgeInsets.all(10),
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
      text: title,
    );
  }
}
