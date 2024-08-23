import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/repositories/providers/wallpaper_repository_provider.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

part 'search_view_model_provider.g.dart';

@riverpod
class SearchViewModel extends _$SearchViewModel {
  @override
  FutureOr<List<WallpaperModel>> build({
    required String search,
    required int page,
  }) {
    return ref
        .watch(wallpaperRepositoryProvider)
        .searchWallpapers(search: search, page: page);
  }
}
