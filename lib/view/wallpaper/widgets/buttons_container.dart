import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/view/wallpaper/widgets/buttom_sheet.dart';
import 'package:wallpaper_app/view/wallpaper/widgets/favorites_button.dart';

class ButtonsContainer extends ConsumerStatefulWidget {
  const ButtonsContainer({
    super.key,
    required this.wallpaper,
  });

  final WallpaperModel wallpaper;

  @override
  ConsumerState<ButtonsContainer> createState() => _ButtonsContainerState();
}

class _ButtonsContainerState extends ConsumerState<ButtonsContainer> {
  // @override
  // void dispose() {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   super.dispose();
  // }

  void _saveNetworkImage() async {
    var response = await Dio().get(
      widget.wallpaper.largeImageURL,
      options: Options(responseType: ResponseType.bytes),
    );

    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 100,
      name: widget.wallpaper.id.toString(),
    );

    if (result['isSuccess']) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Image was downloaded successfully! 😊',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 50).r,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20).r,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              InkWell(
                onTap: _saveNetworkImage,
                child: Container(
                  padding: const EdgeInsets.all(25).r,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(25, 30, 49, 0.55),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AssetPaths.downloadIcon,
                    height: 40.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4).r,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(25, 30, 49, 0.55),
                  borderRadius: BorderRadius.circular(34).r,
                ),
                child: const Text(
                  'Download',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  showBottomSheet(
                    context: context,
                    showDragHandle: true,
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return ButtomSheet(
                        wallpaper: widget.wallpaper,
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(25).r,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AssetPaths.brushIcon,
                    height: 60.h,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4).r,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(25, 30, 49, 0.7),
                  borderRadius: BorderRadius.circular(34).r,
                ),
                child: const Text(
                  'Set',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          Column(
            children: [
              FavoritesButton(wallpaper: widget.wallpaper),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4).r,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(25, 30, 49, 0.7),
                  borderRadius: BorderRadius.circular(34).r,
                ),
                child: const Text(
                  'Favorite',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
