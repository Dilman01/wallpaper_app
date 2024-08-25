import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/core/common/providers/providers.dart';
import 'package:wallpaper_app/core/common/widgets/shimmer_loading.dart';
import 'package:wallpaper_app/core/router/route_names.dart';

class WallpaperCard extends ConsumerWidget {
  const WallpaperCard({
    super.key,
    required this.isFavoritesScreen,
  });

  final String isFavoritesScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallpaper = ref.watch(currentWallpaperProvider);
    return Hero(
      tag: isFavoritesScreen == 'yes' ? wallpaper.largeImageURL : wallpaper.id,
      child: Material(
        child: InkWell(
          onTap: () {
            context.pushNamed(
              RouteNames.wallpaper,
              extra: wallpaper,
              pathParameters: {
                'fav': isFavoritesScreen,
              },
            );
          },
          child: CachedNetworkImage(
            imageUrl: wallpaper.largeImageURL,
            imageBuilder: (context, imageProvider) => Container(
              height: 360.h,
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12).r,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const ShimmerLoading(),
            errorWidget: (context, url, error) => Center(
              child: Text(
                error.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
