import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallpaper_app/core/common/providers/current_wallpaper_provider.dart';
import 'package:wallpaper_app/core/common/providers/internet_connection_provider.dart';
import 'package:wallpaper_app/core/common/widgets/no_internet.dart';
import 'package:wallpaper_app/core/common/widgets/shimmer_loading.dart';
import 'package:wallpaper_app/core/common/widgets/wallpaper_card.dart';
import 'package:wallpaper_app/view_model/category_view_model/category_view_model_provider.dart';

class GridViewCategory extends ConsumerWidget {
  const GridViewCategory({
    super.key,
    required this.title,
  });
  final String title;

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final internetConnection = ref.watch(internetConnectionProvider);

    return internetConnection.when(
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      data: (data) {
        if (data == InternetConnectionStatus.disconnected) {
          return const Center(
            child: NoInternet(),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 8,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15).r,
          itemBuilder: (context, index) {
            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;

            if (page > 25) {
              return null;
            }

            final wallpaperAsync = ref.watch(
              categoryViewModelProvider(
                page: page,
                category: title.toLowerCase(),
              ),
            );

            return wallpaperAsync.when(
              data: (data) {
                if (indexInPage >= data.length) {
                  return null;
                }

                final wallpaper = data[indexInPage];

                return ProviderScope(
                  overrides: [
                    currentWallpaperProvider.overrideWithValue(wallpaper)
                  ],
                  child: const WallpaperCard(
                    isFavoritesScreen: 'no',
                  ),
                );
              },
              error: (error, stackTrace) => const Center(
                child: Text('Something went wrong! try again later.'),
              ),
              loading: () => const ShimmerLoading(),
            );
          },
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text('Something went wrong! try again later.'),
      ),
      loading: () => const ShimmerLoading(),
    );
  }
}
