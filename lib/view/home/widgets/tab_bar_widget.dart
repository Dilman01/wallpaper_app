import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/view/home/widgets/tab_item.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int isTabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20).r,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(225, 244, 255, 1),
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(103, 71, 231, 1),
              Color.fromRGBO(0, 255, 240, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        labelStyle: TextStyle(fontSize: 24.sp),
        splashFactory: NoSplash.splashFactory,
        isScrollable: false,
        physics: const NeverScrollableScrollPhysics(),
        onTap: (value) {
          setState(() {
            isTabSelected = value;
          });
        },
        tabs: [
          TabItem(
            title: S.of(context).firstTabTitle,
            svgPath: AssetPaths.editorsChoiceIcon,
            isSelected: isTabSelected == 0,
          ),
          TabItem(
            title: S.of(context).secondTabTitle,
            svgPath: AssetPaths.trendingIcon,
            isSelected: isTabSelected == 1,
          ),
          TabItem(
            title: S.of(context).thirdTabTitle,
            svgPath: AssetPaths.latestIcon,
            isSelected: isTabSelected == 2,
          ),
        ],
      ),
    );
  }
}
