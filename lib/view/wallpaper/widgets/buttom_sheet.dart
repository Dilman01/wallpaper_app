import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

class ButtomSheet extends StatefulWidget {
  const ButtomSheet({
    super.key,
    required this.wallpaper,
  });

  final WallpaperModel wallpaper;

  @override
  State<ButtomSheet> createState() => _ButtomSheetState();
}

class _ButtomSheetState extends State<ButtomSheet> {
  bool isWallpaperSetLoading = false;

  void setWallpaper(int wallpaperLocation) async {
    setState(() {
      isWallpaperSetLoading = true;
    });

    bool result = false;

    try {
      result = await AsyncWallpaper.setWallpaper(
        url: widget.wallpaper.largeImageURL,
        wallpaperLocation: wallpaperLocation,
        goToHome: false,
      );

      setState(() {
        isWallpaperSetLoading = false;
      });
    } on PlatformException {
      debugPrint('Failed to get wallpaper.');
    }
    if (result) {
      // ignore: use_build_context_synchronously
      context.pop();

      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 215.h,
              width: 630.w,
              padding: const EdgeInsets.all(20).r,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30).r,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).setDialogHeader,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.spMin,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    S.of(context).setDialogBody,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.spMin,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromRGBO(117, 117, 117, 1),
                      ),
                      child: Text(
                        S.of(context).dismiss,
                        style: TextStyle(
                          fontSize: 28.spMin,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: double.infinity,
      color: Colors.white,
      child: isWallpaperSetLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Column(
              children: [
                Text(
                  S.of(context).bottomSheetTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.spMin,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20).r,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(217, 217, 217, 1),
                    ),
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: Column(
                    children: [
                      SetWallpaperButton(
                        onTap: () => setWallpaper(AsyncWallpaper.HOME_SCREEN),
                        title: S.of(context).setWallpaperHome,
                        svgPath: AssetPaths.setHomeIcon,
                      ),
                      Divider(
                        height: 1.h,
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      SetWallpaperButton(
                        onTap: () => setWallpaper(AsyncWallpaper.LOCK_SCREEN),
                        title: S.of(context).setWallpaperLock,
                        svgPath: AssetPaths.setLockIcon,
                      ),
                      Divider(
                        height: 1.h,
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      SetWallpaperButton(
                        onTap: () => setWallpaper(AsyncWallpaper.BOTH_SCREENS),
                        title: S.of(context).setWallpaperBoth,
                        svgPath: AssetPaths.setBothIcon,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom().copyWith(
                    foregroundColor: const WidgetStatePropertyAll(
                      Colors.white,
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                      Color.fromRGBO(25, 30, 49, 1),
                    ),
                  ),
                  child: Text(
                    S.of(context).cancel,
                    style: TextStyle(
                      fontSize: 35.spMin,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class SetWallpaperButton extends StatelessWidget {
  const SetWallpaperButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.svgPath,
  });

  final void Function() onTap;
  final String title;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 40).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              svgPath,
              height: 50.h,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 35.spMin,
              ),
            )
          ],
        ),
      ),
    );
  }
}
