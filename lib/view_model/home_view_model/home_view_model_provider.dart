import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/repositories/providers/wallpaper_repository_provider.dart';

part 'home_view_model_provider.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  FutureOr<List<WallpaperModel>> build({
    required int page,
    String order = 'popular',
    bool editorsChoice = false,
  }) {
    ref.keepAlive();
    return ref.watch(wallpaperRepositoryProvider).getWallpapers(
          page: page,
          order: order,
          editorsChoice: editorsChoice,
        );
  }
}
