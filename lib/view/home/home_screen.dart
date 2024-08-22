import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/view/home/widgets/grid_view_widget.dart';
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
          backgroundColor: Colors.white,
          title: const Text('Wallpaper App'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(619.w, 146.h),
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
