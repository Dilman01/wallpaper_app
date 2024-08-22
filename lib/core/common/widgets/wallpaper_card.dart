import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/core/common/widgets/shimmer_loading.dart';

class WallpaperCard extends StatelessWidget {
  const WallpaperCard({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
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
    );
  }
}
