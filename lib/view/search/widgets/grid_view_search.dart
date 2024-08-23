import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/core/common/providers/providers.dart';
import 'package:wallpaper_app/core/common/widgets/shimmer_loading.dart';
import 'package:wallpaper_app/core/common/widgets/wallpaper_card.dart';
import 'package:wallpaper_app/view/search/providers/providers.dart';
import 'package:wallpaper_app/view_model/search_view_model/search_view_model_provider.dart';

class GridViewSearch extends ConsumerWidget {
  const GridViewSearch({
    super.key,
  });

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchTextProvider);

    return search.trim().isEmpty
        ? const Center(
            child: Text('Search for something...'),
          )
        : ref
            .watch(
              searchViewModelProvider(page: 1, search: search),
            )
            .when(
              data: (data) {
                if (data.isEmpty) {
                  return const Center(
                    child: Text(
                        'No results were found!\nTry searching for another term.'),
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
                      searchViewModelProvider(
                        search: search,
                        page: page,
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
                            currentWallpaperProvider
                                .overrideWithValue(wallpaper)
                          ],
                          child: const WallpaperCard(),
                        );
                      },
                      error: (error, stackTrace) => Center(
                        child: Text(error.toString()),
                      ),
                      loading: () => const ShimmerLoading(),
                    );
                  },
                );
              },
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );
  }
}