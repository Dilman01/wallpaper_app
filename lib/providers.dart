import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/repositories/providers/wallpaper_repository_provider.dart';

part 'providers.g.dart';

@riverpod
Future<List<WallpaperModel>> fetchWallpapers(
  FetchWallpapersRef ref,
  int page, {
  String order = 'popular',
  bool editorsChoice = false,
}) {
  final wallpapersReps = ref.watch(wallpaperRepositoryProvider);

  return wallpapersReps.getWallpapers(
    page: page,
    order: order,
    editorsChoice: editorsChoice,
  );
}
