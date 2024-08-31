import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wallpaper_app/core/enums/categories.dart';
import 'package:wallpaper_app/view/category/widgets/grid_view_category.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({
    super.key,
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Intl.getCurrentLocale() == 'ar'
                ? category.arabicName
                : category.name,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: GridViewCategory(title: category.name),
      ),
    );
  }
}
