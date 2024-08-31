import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/core/common/providers/app_theme_mode_provider.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/core/router/route_names.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/view/settings/widgets/settings_button.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 750.h,
            width: 670.w,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30).r,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50).r,
              color: Theme.of(context).colorScheme.onSecondary,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SettingsButton(
                  title: S.of(context).pushNotification,
                  svgPath: AssetPaths.notificationIcon,
                  isNotification: true,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(RouteNames.language);
                  },
                  child: SettingsButton(
                    title: S.of(context).language,
                    svgPath: AssetPaths.languageIcon,
                  ),
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                SettingsButton(
                  title: S.of(context).invite,
                  svgPath: AssetPaths.inviteIcon,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                SettingsButton(
                  title: S.of(context).rate,
                  svgPath: AssetPaths.starIcon,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                SettingsButton(
                  title: S.of(context).feedback,
                  svgPath: AssetPaths.feedbackIcon,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                SettingsButton(
                  title: S.of(context).terms,
                  svgPath: AssetPaths.termsIcon,
                ),
                const Divider(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  thickness: 0.8,
                  indent: 50,
                ),
                SettingsButton(
                  title: S.of(context).privacy,
                  svgPath: AssetPaths.privacyIcon,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          themeMode == ThemeMode.light
              ? IconButton(
                  onPressed: () {
                    ref
                        .read(appThemeModeProvider.notifier)
                        .changeTheme(ThemeMode.dark);
                  },
                  icon: Icon(
                    Icons.light_mode,
                    color: Colors.black,
                    size: 100.r,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    ref
                        .read(appThemeModeProvider.notifier)
                        .changeTheme(ThemeMode.light);
                  },
                  icon: Icon(
                    Icons.dark_mode,
                    color: Colors.white,
                    size: 100.r,
                  ),
                ),
        ],
      ),
    );
  }
}
