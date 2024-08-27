import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/view/home/widgets/grid_view_widget.dart';
import 'package:wallpaper_app/view/home/widgets/search_container.dart';
import 'package:wallpaper_app/view/home/widgets/tab_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
                width: 150.w,
                child: SvgPicture.asset(
                  AssetPaths.logoIcon,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              const SearchContainer(),
            ],
          ),
          centerTitle: true,
          toolbarHeight: 150.h,
          bottom: PreferredSize(
            preferredSize: Size(620.w, 100.h),
            child: const TabBarWidget(),
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            GridViewWidget(
              order: 'popular',
              editorsChoice: true,
            ),
            GridViewWidget(
              order: 'popular',
              editorsChoice: false,
            ),
            GridViewWidget(
              order: 'latest',
              editorsChoice: false,
            ),
          ],
        ),
      ),
    );
  }
}
