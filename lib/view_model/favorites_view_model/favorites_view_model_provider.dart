import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/repositories/providers/local_wallpapers_repository_provider.dart';

part 'favorites_view_model_provider.g.dart';

@riverpod
class FavoritesViewModel extends _$FavoritesViewModel {
  @override
  Future<List<WallpaperModel>> build() async {
    return ref.watch(localWallpaperRepositoryProvider).loadFavoriteWallpapers();
  }

  Future<void> toggleFavorite(WallpaperModel wallpaper) async {
    state = const AsyncLoading();

    await AsyncValue.guard(
      () async {
        final repository = ref.read(localWallpaperRepositoryProvider);
        if (state.value != null && state.value!.contains(wallpaper)) {
          await repository.removeWallpaper(wallpaper);
        } else {
          await repository.addWallpaper(wallpaper);
        }

        final updatedWallpapers = await repository.loadFavoriteWallpapers();
        state = AsyncValue.data(updatedWallpapers);
      },
    );
  }
}
