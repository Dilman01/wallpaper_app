import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_app/view/search/providers/providers.dart';
import 'package:wallpaper_app/view/search/widgets/grid_view_search.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 60.r,
                  ),
                ),
                Container(
                  height: 70.h,
                  width: 600.w,
                  margin: const EdgeInsets.only(top: 20, right: 20).r,
                  padding: const EdgeInsets.symmetric(horizontal: 10).r,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.circular(98).r,
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      textSelectionTheme: TextSelectionThemeData(
                        selectionColor: Colors.grey.shade400,
                        selectionHandleColor: Colors.grey.shade500,
                      ),
                    ),
                    child: TextField(
                      controller: _searchController,
                      autofocus: true,
                      cursorColor: Colors.black,
                      textCapitalization: TextCapitalization.sentences,
                      selectionControls: MaterialTextSelectionControls(),
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        hintText: 'Find Wallpapers...',
                        hintStyle: TextStyle(
                          color: const Color.fromRGBO(182, 182, 182, 1),
                          fontSize: 28.sp,
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          size: 50.w,
                        ),
                        suffixIconColor: const Color.fromRGBO(182, 182, 182, 1),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (value) {
                        ref.read(searchTextProvider.notifier).changeText(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const Expanded(
              child: GridViewSearch(),
            ),
          ],
        ),
      ),
    );
  }
}
