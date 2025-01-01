import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/core/api/providers/api_client_provider.dart';
import 'package:wallpaper_app/repositories/wallpaper_repository.dart';

part 'wallpaper_repository_provider.g.dart';

@riverpod
WallpaperRepository wallpaperRepository(Ref ref) {
  return WallpaperRepository(apiClient: ref.watch(apiClientProvider));
}
