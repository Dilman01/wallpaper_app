import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
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
                    'Wallpaper set!',
                    style: TextStyle(
                      fontSize: 35.spMin,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'All done! your phone looks amazing.',
                    style: TextStyle(
                      fontSize: 26.spMin,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
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
                        'DISMISS',
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
                  'What would you like to do?',
                  style: TextStyle(
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
                        title: 'Set on home screen',
                        svgPath: AssetPaths.setHomeIcon,
                      ),
                      Divider(
                        height: 1.h,
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      SetWallpaperButton(
                        onTap: () => setWallpaper(AsyncWallpaper.LOCK_SCREEN),
                        title: 'Set on lock screen',
                        svgPath: AssetPaths.setLockIcon,
                      ),
                      Divider(
                        height: 1.h,
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      SetWallpaperButton(
                        onTap: () => setWallpaper(AsyncWallpaper.BOTH_SCREENS),
                        title: 'Set on both screen',
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(25, 30, 49, 1),
                    foregroundColor: Colors.white,
                    fixedSize: Size(500.w, 80.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50).r,
                    ),
                  ),
                  child: Text(
                    'Cancel',
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
                fontSize: 35.spMin,
              ),
            )
          ],
        ),
      ),
    );
  }
}
