import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_app/view/favorites/widgets/grid_view_favorites.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: const GridViewFavorites(),
    );
  }
}
