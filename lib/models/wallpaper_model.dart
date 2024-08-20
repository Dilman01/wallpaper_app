import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallpaper_model.freezed.dart';
part 'wallpaper_model.g.dart';

@freezed
class WallpaperModel with _$WallpaperModel {
  const factory WallpaperModel({
    required int id,
    required String largeImageURL,
  }) = _WallpaperModel;

  factory WallpaperModel.fromJson(Map<String, dynamic> json) =>
      _$WallpaperModelFromJson(json);
}
