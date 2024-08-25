import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

part 'favorites_view_model_provider.g.dart';

@riverpod
class FavoritesViewModel extends _$FavoritesViewModel {
  @override
  List<WallpaperModel> build() {
    return [];
  }

  void toggleFavorite(WallpaperModel wallpaper) {
    if (state.contains(wallpaper)) {
      state = state
          .where(
            (wall) => wall.id != wallpaper.id,
          )
          .toList();
    } else {
      state = [wallpaper, ...state];
    }
  }
}
