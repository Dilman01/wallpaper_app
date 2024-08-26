import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/view_model/favorites_view_model/favorites_view_model_provider.dart';

class FavoritesButton extends ConsumerWidget {
  const FavoritesButton({
    super.key,
    required this.wallpaper,
  });

  final WallpaperModel wallpaper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallpapersAsync = ref.watch(favoritesViewModelProvider);

    return wallpapersAsync.when(
      data: (data) {
        final wallpapersIds = data
            .map(
              (e) => e.id,
            )
            .toList();

        bool isFav = wallpapersIds.contains(wallpaper.id);

        return InkWell(
          onTap: () async {
            if (isFav) {
              await ref
                  .read(favoritesViewModelProvider.notifier)
                  .removeFavorite(wallpaper);
            } else {
              await ref
                  .read(favoritesViewModelProvider.notifier)
                  .addFavorite(wallpaper);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(25).r,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(25, 30, 49, 0.55),
              shape: BoxShape.circle,
            ),
            child: isFav
                ? SvgPicture.asset(
                    AssetPaths.favoritesIcon,
                    height: 40.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.red,
                      BlendMode.srcIn,
                    ),
                  )
                : SvgPicture.asset(
                    AssetPaths.heartIcon,
                    height: 40.h,
                  ),
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => Center(
        child: Container(
          padding: const EdgeInsets.all(25).r,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(25, 30, 49, 0.55),
            shape: BoxShape.circle,
          ),
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
