import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25).r,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(25, 30, 49, 0.55),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AssetPaths.downloadIcon,
                height: 40.h,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 4).r,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(25, 30, 49, 0.55),
                borderRadius: BorderRadius.circular(34).r,
              ),
              child: const Text(
                'Download',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30.w,
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25).r,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AssetPaths.brushIcon,
                height: 60.h,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 4).r,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(25, 30, 49, 0.7),
                borderRadius: BorderRadius.circular(34).r,
              ),
              child: const Text(
                'Set',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30.w,
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25).r,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(25, 30, 49, 0.55),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AssetPaths.heartIcon,
                height: 40.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 4).r,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(25, 30, 49, 0.7),
                borderRadius: BorderRadius.circular(34).r,
              ),
              child: const Text(
                'Favorite',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
