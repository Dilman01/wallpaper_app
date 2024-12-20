import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/core/router/route_names.dart';
import 'package:wallpaper_app/generated/l10n.dart';

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
        width: 510.w,
        margin: const EdgeInsets.only(top: 20).r,
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          // vertical: 20,
        ).r,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          borderRadius: BorderRadius.circular(98).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).searchHintText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                fontSize: 28.spMin,
              ),
            ),
            Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              size: 50.r,
            ),
          ],
        ),
      ),
    );
  }
}
