import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/api/api_client.dart';
import 'package:wallpaper_app/repositories/wallpaper_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var image = WallpaperRepository(apiClient: ApiClient(dio: Dio()))
        .getWallpapers(editorsChoice: true);

    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: image,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null) {
              return const Center(
                child: Text('No Data!'),
              );
            }

            final data = snapshot.data!;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Image.network(data[index].largeImageURL),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
