import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/core/constants/asset_paths.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/view_model/favorites_view_model/favorites_view_model_provider.dart';

class FavoritesButton extends ConsumerStatefulWidget {
  const FavoritesButton({
    super.key,
    required this.wallpaper,
  });

  final WallpaperModel wallpaper;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavoritesButtonState();
}

class _FavoritesButtonState extends ConsumerState<FavoritesButton> {
  // bool isFavorite =
  @override
  Widget build(BuildContext context) {
    final wallpapersList = ref.watch(favoritesViewModelProvider).valueOrNull;
    return InkWell(
      onTap: () async {
        await ref
            .read(favoritesViewModelProvider.notifier)
            .toggleFavorite(widget.wallpaper);
      },
      child: Container(
        padding: const EdgeInsets.all(25).r,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(25, 30, 49, 0.55),
          shape: BoxShape.circle,
        ),
        child:
            wallpapersList != null && wallpapersList.contains(widget.wallpaper)
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
  }
}
