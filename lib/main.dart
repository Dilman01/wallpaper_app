import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/core/router/router_provider.dart';

import 'package:wallpaper_app/view/home/home_screen.dart';
import 'package:wallpaper_app/view/category/categories_screen.dart';
import 'package:wallpaper_app/view/favorites/favorites_screen.dart';
import 'package:wallpaper_app/view/settings/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(
    const ProviderScope(
      child: WallpaperApp(),
    ),
  );
}

class WallpaperApp extends ConsumerWidget {
  const WallpaperApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return ScreenUtilInit(
      designSize: const Size(720, 1280),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}

class WallApp extends StatefulWidget {
  const WallApp({
    super.key,
  });

  @override
  State<WallApp> createState() => _WallAppState();
}

class _WallAppState extends State<WallApp> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> navBarItems = [
    navBarItem(svgPath: AssetPaths.homeIcon, title: 'Home'),
    navBarItem(svgPath: AssetPaths.categoryIcon, title: 'Category'),
    navBarItem(svgPath: AssetPaths.favoritesIcon, title: 'Favorites'),
    navBarItem(svgPath: AssetPaths.settingsIcon, title: 'Settings'),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: controller,
        screens: screens,
        items: navBarItems,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: false,
        navBarStyle: NavBarStyle.style7,
      ),
    );
  }
}

PersistentBottomNavBarItem navBarItem({
  required String svgPath,
  required String title,
}) {
  return PersistentBottomNavBarItem(
    icon: SvgPicture.asset(
      svgPath,
      height: 35.h,
      width: 35.w,
    ),
    inactiveIcon: SvgPicture.asset(
      svgPath,
      height: 35.h,
      width: 35.w,
      colorFilter: const ColorFilter.mode(
        Color.fromRGBO(168, 168, 168, 1),
        BlendMode.srcIn,
      ),
    ),
    title: title,
    textStyle: TextStyle(
      fontSize: 27.sp,
      fontWeight: FontWeight.w500,
    ),
    contentPadding: 10.r,
    activeColorPrimary: const Color.fromRGBO(240, 240, 240, 1),
    activeColorSecondary: Colors.black,
    inactiveColorPrimary: const Color.fromRGBO(168, 168, 168, 1),
  );
}
