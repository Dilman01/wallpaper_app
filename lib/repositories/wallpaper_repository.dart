import 'package:wallpaper_app/core/api/api_client.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

class WallpaperRepository {
  final ApiClient apiClient;

  WallpaperRepository({required this.apiClient});

  Future<List<WallpaperModel>> getWallpapers(
      {String order = 'popular', bool editorsChoice = false}) async {
    try {
      final response = await apiClient.get(
        queryParameters: {
          'order': order,
          'editors_choice': editorsChoice,
        },
      );

      final List<dynamic> data = response.data['hits'];

      return data
          .map(
            (wallpaper) => WallpaperModel.fromJson(wallpaper),
          )
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<WallpaperModel>> searchWallpapers(
      {required String search}) async {
    try {
      final response = await apiClient.get(queryParameters: {
        'q': search,
      });

      final List<dynamic> data = response.data['hits'];

      return data
          .map(
            (wallpaper) => WallpaperModel.fromJson(wallpaper),
          )
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<WallpaperModel>> getCategory({required String category}) async {
    try {
      final response = await apiClient.get(
        queryParameters: {
          'category': category,
        },
      );

      final List<dynamic> data = response.data['hits'];

      return data
          .map(
            (wallpaper) => WallpaperModel.fromJson(wallpaper),
          )
          .toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
