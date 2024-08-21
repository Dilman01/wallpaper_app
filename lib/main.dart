import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:wallpaper_app/view/screens/home/home_screen.dart';
import 'package:wallpaper_app/view/screens/category/category_screen.dart';
import 'package:wallpaper_app/view/screens/favorites/favorites_screen.dart';
import 'package:wallpaper_app/view/screens/settings/settings_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: WallpaperApp(),
    ),
  );
}

class WallpaperApp extends StatefulWidget {
  const WallpaperApp({super.key});

  @override
  State<WallpaperApp> createState() => _WallpaperAppState();
}

class _WallpaperAppState extends State<WallpaperApp> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> navBarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.home,
      ),
      title: 'Home',
      activeColorPrimary: const Color.fromRGBO(240, 240, 240, 1),
      activeColorSecondary: Colors.black,
      inactiveColorPrimary: const Color.fromRGBO(168, 168, 168, 1),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.category,
      ),
      title: 'Category',
      activeColorPrimary: const Color.fromRGBO(240, 240, 240, 1),
      activeColorSecondary: Colors.black,
      inactiveColorPrimary: const Color.fromRGBO(168, 168, 168, 1),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.favorite,
      ),
      title: 'Favorites',
      activeColorPrimary: const Color.fromRGBO(240, 240, 240, 1),
      activeColorSecondary: Colors.black,
      inactiveColorPrimary: const Color.fromRGBO(168, 168, 168, 1),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.settings,
      ),
      title: 'Settings',
      activeColorPrimary: const Color.fromRGBO(240, 240, 240, 1),
      activeColorSecondary: Colors.black,
      inactiveColorPrimary: const Color.fromRGBO(168, 168, 168, 1),
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: PersistentTabView(
          context,
          controller: controller,
          screens: screens,
          items: navBarItems,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: false,
          navBarStyle: NavBarStyle.style7,
        ),
      ),
    );
  }
}
