import 'package:flutter/material.dart';
import 'package:wallpaper_app/generated/l10n.dart';
import 'package:wallpaper_app/view/favorites/widgets/grid_view_favorites.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).favorites,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: const GridViewFavorites(),
    );
  }
}
