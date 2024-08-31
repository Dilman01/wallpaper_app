import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wallpaper_app/core/enums/categories.dart';
import 'package:wallpaper_app/core/router/route_names.dart';
import 'package:wallpaper_app/generated/l10n.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cateogry = Categories.values;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).categorires,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: GridView.builder(
        itemCount: cateogry.length,
        padding: const EdgeInsets.all(20).r,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pushNamed(
                RouteNames.category,
                extra: cateogry[index],
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    cateogry[index].backgraoundImageUrl,
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black,
                    Color.fromRGBO(41, 50, 59, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(50).r,
              ),
              child: Center(
                child: Text(
                  Intl.getCurrentLocale() == 'ar'
                      ? cateogry[index].arabicName
                      : cateogry[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
