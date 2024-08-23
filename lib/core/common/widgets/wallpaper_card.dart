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
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallpaper = ref.watch(currentWallpaperProvider);
    return InkWell(
      onTap: () {
        context.pushNamed(
          RouteNames.wallpaper,
          // pathParameters: {
          //   'imageUrl': imageUrl,
          // },
          extra: wallpaper.largeImageURL,
          // queryParameters: {
          //   'imageUrl': imageUrl,
          // },
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
    );
  }
}
