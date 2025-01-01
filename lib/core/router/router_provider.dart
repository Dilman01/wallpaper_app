import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/core/enums/categories.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/view/category/category_screen.dart';
import 'package:wallpaper_app/view/settings/language_screen.dart';
import 'package:wallpaper_app/view/wallpaper/wallpaper_screen.dart';
import 'package:wallpaper_app/core/router/route_names.dart';
import 'package:wallpaper_app/main.dart';
import 'package:wallpaper_app/view/category/categories_screen.dart';
import 'package:wallpaper_app/view/favorites/favorites_screen.dart';
import 'package:wallpaper_app/view/home/home_screen.dart';
import 'package:wallpaper_app/view/search/search_screen.dart';
import 'package:wallpaper_app/view/settings/settings_screen.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter route(Ref ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _rootNavigatorKey,
        builder: (context, state, child) {
          return const WallApp();
        },
        routes: [
          GoRoute(
            path: '/home',
            name: RouteNames.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/categories',
            name: RouteNames.categories,
            builder: (context, state) => const CategoriesScreen(),
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
        path: '/wallpaper/:fav',
        name: RouteNames.wallpaper,
        builder: (context, state) {
          final wallpaper = state.extra as WallpaperModel;
          final isFavoritesScreen = state.pathParameters['fav'] ?? '';

          return WallpaperScreen(
            wallpaper: wallpaper,
            isFavoritesScreen: isFavoritesScreen,
          );
        },
      ),
      GoRoute(
        path: '/search',
        name: RouteNames.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/category',
        name: RouteNames.category,
        builder: (context, state) {
          final category = state.extra as Categories;
          return CategoryScreen(category: category);
        },
      ),
      GoRoute(
        path: '/language',
        name: RouteNames.language,
        builder: (context, state) => const LanguageScreen(),
      ),
    ],
  );
}
