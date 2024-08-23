import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/core/router/route_names.dart';

class SearchContainer extends ConsumerWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteNames.search);
      },
      child: Container(
        height: 70.h,
        width: 550.w,
        margin: const EdgeInsets.only(top: 20).r,
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          // vertical: 20,
        ).r,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(98).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Find Wallpapers...',
              style: TextStyle(
                color: const Color.fromRGBO(182, 182, 182, 1),
                fontSize: 28.spMin,
              ),
            ),
            Icon(
              Icons.search,
              color: const Color.fromRGBO(182, 182, 182, 1),
              size: 50.r,
            ),
          ],
        ),
      ),
    );
  }
}
