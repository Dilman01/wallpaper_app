import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';

class LocalWallpaperRepository {
  Future<Database> _getDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'wallpapers.db');

    final db = await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE wallpapers(id INTEGER PRIMARY KEY, imageUrl TEXT, timestamp INTEGER)');
      },
      version: 1,
    );

    return db;
  }

  Future<List<WallpaperModel>> loadFavoriteWallpapers() async {
    final db = await _getDatabase();

    final data = await db.query('wallpapers', orderBy: 'timestamp DESC');

    final wallpapers = data
        .map(
          (wallpaper) => WallpaperModel(
            id: wallpaper['id'] as int,
            largeImageURL: wallpaper['imageUrl'] as String,
          ),
        )
        .toList();

    return wallpapers;
  }

  Future<void> addWallpaper(WallpaperModel wallpaper) async {
    final db = await _getDatabase();

    db.insert(
      'wallpapers',
      {
        'id': wallpaper.id,
        'imageUrl': wallpaper.largeImageURL,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeWallpaper(WallpaperModel wallpaper) async {
    final db = await _getDatabase();

    try {
      await db.delete(
        'wallpapers',
        where: 'id = ?',
        whereArgs: [wallpaper.id],
      );
    } catch (e) {
      print('Something went wrong when deleteing a Wallpaper, Erorr: $e');
    }
  }
}
