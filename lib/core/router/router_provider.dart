import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/core/common/widgets/wallpaper_screen.dart';
import 'package:wallpaper_app/core/router/route_names.dart';
import 'package:wallpaper_app/main.dart';
import 'package:wallpaper_app/view/category/category_screen.dart';
import 'package:wallpaper_app/view/favorites/favorites_screen.dart';
import 'package:wallpaper_app/view/home/home_screen.dart';
import 'package:wallpaper_app/view/settings/settings_screen.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter route(RouteRef ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _rootNavigatorKey,
        builder: (context, state, child) {
          return const WallApp(); // Pass child to WallApp
        },
        routes: [
          GoRoute(
            path: '/home',
            name: RouteNames.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/category',
            name: RouteNames.category,
            builder: (context, state) => const CategoryScreen(),
          ),
          GoRoute(
            path: '/favorites',
            name: RouteNames.favorites,
            builder: (context, state) => const FavoritesScreen(),
          ),
          GoRoute(
            path: '/settings',
            name: RouteNames.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/wallpaper',
        name: RouteNames.wallpaper,
        builder: (context, state) {
          final String imageUrl = state.extra!.toString();

          return WallpaperScreen(
            imageUrl: imageUrl,
          );
        },
      ),
    ],
  );
}
