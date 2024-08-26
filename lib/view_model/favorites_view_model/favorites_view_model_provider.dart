import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/repositories/providers/local_wallpapers_repository_provider.dart';

part 'favorites_view_model_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoritesViewModel extends _$FavoritesViewModel {
  @override
  Future<List<WallpaperModel>> build() async {
    return ref.watch(localWallpaperRepositoryProvider).loadFavoriteWallpapers();
  }

  Future<void> addFavorite(WallpaperModel wallpaper) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));

    await AsyncValue.guard(
      () async {
        await ref
            .read(localWallpaperRepositoryProvider)
            .addWallpaper(wallpaper);

        final updatedWallpapers = await ref
            .read(localWallpaperRepositoryProvider)
            .loadFavoriteWallpapers();

        state = AsyncValue.data(updatedWallpapers);
      },
    );
  }

  Future<void> removeFavorite(WallpaperModel wallpaper) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    await AsyncValue.guard(
      () async {
        await ref
            .read(localWallpaperRepositoryProvider)
            .removeWallpaper(wallpaper);

        final updatedWallpapers = await ref
            .read(localWallpaperRepositoryProvider)
            .loadFavoriteWallpapers();

        state = AsyncValue.data(updatedWallpapers);
      },
    );
  }
}
