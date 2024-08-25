import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/core/common/providers/providers.dart';
import 'package:wallpaper_app/core/common/widgets/wallpaper_card.dart';
import 'package:wallpaper_app/view_model/favorites_view_model/favorites_view_model_provider.dart';

class GridViewFavorites extends ConsumerWidget {
  const GridViewFavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteWallpapers = ref.watch(favoritesViewModelProvider);
    return favoriteWallpapers.isEmpty
        ? const Center(
            child: Text('No favorites found.'),
          )
        : GridView.builder(
            itemCount: favoriteWallpapers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 8,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15).r,
            itemBuilder: (context, index) {
              if (favoriteWallpapers.isEmpty) {
                return null;
              }

              return ProviderScope(
                overrides: [
                  currentWallpaperProvider.overrideWithValue(
                    favoriteWallpapers[index],
                  ),
                ],
                child: const WallpaperCard(
                  isFavoritesScreen: 'yes',
                ),
              );
            },
          );
  }
}
