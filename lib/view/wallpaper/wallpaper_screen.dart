import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/view/wallpaper/widgets/buttons_container.dart';

class WallpaperScreen extends ConsumerWidget {
  const WallpaperScreen({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0,
          forceMaterialTransparency: true,
        ),
        body: Stack(
          children: [
            Hero(
              tag: imageUrl,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              bottom: 30,
              right: 0,
              left: 0,
              child: ButtonsContainer(),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(5).r,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(25, 30, 49, 0.55),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 60.r,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
