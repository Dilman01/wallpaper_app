import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/core/api/api_client.dart';
import 'package:wallpaper_app/core/api/providers/dio_provider.dart';

part 'api_client_provider.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient(dio: ref.watch(dioProvider));
}
