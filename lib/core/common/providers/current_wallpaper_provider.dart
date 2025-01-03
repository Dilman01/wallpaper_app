import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

part 'current_wallpaper_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
WallpaperModel currentWallpaper(Ref ref) {
  throw UnimplementedError();
}
