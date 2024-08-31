import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_app/core/common/providers/app_theme_mode_provider.dart';
import 'package:wallpaper_app/core/common/providers/language_code_provider.dart';
import 'package:wallpaper_app/core/constants/app_colors.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/core/router/router_provider.dart';
import 'package:wallpaper_app/core/theme/app_theme.dart';
import 'package:wallpaper_app/generated/l10n.dart';

import 'package:wallpaper_app/view/home/home_screen.dart';
import 'package:wallpaper_app/view/category/categories_screen.dart';
import 'package:wallpaper_app/view/favorites/favorites_screen.dart';
import 'package:wallpaper_app/view/settings/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.getString('lang-code') ?? prefs.setString('lang-code', 'en');

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
    final languageCode = ref.watch(languageCodeProvider);
    final themeMode = ref.watch(appThemeModeProvider);

    return ScreenUtilInit(
      designSize: const Size(720, 1280),
      builder: (_, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(languageCode.value ?? 'en'),
          routerConfig: router,
        );
      },
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
    List<PersistentBottomNavBarItem> navBarItems = [
      navBarItem(
          svgPath: AssetPaths.homeIcon,
          title: S.of(context).home,
          context: context),
      navBarItem(
          svgPath: AssetPaths.categoryIcon,
          title: S.of(context).categorires,
          context: context),
      navBarItem(
          svgPath: AssetPaths.favoritesIcon,
          title: S.of(context).favorites,
          context: context),
      navBarItem(
          svgPath: AssetPaths.settingsIcon,
          title: S.of(context).settings,
          context: context),
    ];

    return SafeArea(
      child: PersistentTabView(
        context,
        controller: controller,
        screens: screens,
        items: navBarItems,
        backgroundColor: Theme.of(context).primaryColor,
        handleAndroidBackButtonPress: false,
        navBarStyle: NavBarStyle.style7,
      ),
    );
  }
}

PersistentBottomNavBarItem navBarItem({
  required String svgPath,
  required String title,
  required BuildContext context,
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
        AppColorsLight.inactiveTabColor,
        BlendMode.srcIn,
      ),
    ),
    title: ' $title ',
    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
    contentPadding: 10.r,
    activeColorPrimary: AppColorsLight.activeTabColor,
    activeColorSecondary: AppColorsLight.activeSecondaryTabColor,
    inactiveColorPrimary: AppColorsLight.inactiveTabColor,
  );
}
