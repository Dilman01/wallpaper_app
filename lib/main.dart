import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/providers.dart';

void main() {
  runApp(
    const ProviderScope(
      child: WallpaperApp(),
    ),
  );
}

class WallpaperApp extends ConsumerWidget {
  const WallpaperApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int pageSize = 20;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: GridView.builder(
            padding: const EdgeInsets.all(10),
            // itemCount: pageSize,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              final page = index ~/ pageSize + 1;
              final indexInPage = index % pageSize;
              log('index: $index, page: $page, indexInPage: $indexInPage');
              if (page > 25) {
                return null;
              }

              final wallpapers = ref.watch(
                fetchWallpapersProvider(
                  page,
                  order: 'latest',
                ),
              );

              return wallpapers.when(
                data: (data) {
                  if (indexInPage >= data.length) {
                    return null;
                  }

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(data[indexInPage].largeImageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
