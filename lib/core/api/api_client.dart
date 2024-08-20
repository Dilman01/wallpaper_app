import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/constants/api_constants.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio});

  Future<Response> get({
    required Map<String, dynamic> queryParameters,
  }) async {
    final response = await dio.get(
      baseURL,
      queryParameters: queryParameters,
    );

    return response;
  }
}
