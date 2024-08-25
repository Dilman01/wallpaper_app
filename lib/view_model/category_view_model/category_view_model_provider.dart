import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

import 'package:wallpaper_app/repositories/providers/wallpaper_repository_provider.dart';

part 'category_view_model_provider.g.dart';

@riverpod
class CategoryViewModel extends _$CategoryViewModel {
  @override
  FutureOr<List<WallpaperModel>> build({
    required String category,
    required int page,
  }) {
    return ref
        .watch(wallpaperRepositoryProvider)
        .getCategory(category: category, page: page);
  }
}
