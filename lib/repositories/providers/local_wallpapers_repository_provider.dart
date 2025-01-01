import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/repositories/local_wallpaper_repository.dart';

part 'local_wallpapers_repository_provider.g.dart';

@Riverpod(keepAlive: true)
LocalWallpaperRepository localWallpaperRepository(Ref ref) {
  return LocalWallpaperRepository();
}
