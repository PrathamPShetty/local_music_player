import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/song_model.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('songs.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE songs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            artist TEXT,
            filePath TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertSong(SongModel song) async {
    final db = await instance.database;
    return await db.insert('songs', song.toMap());
  }

  Future<List<SongModel>> getAllSongs() async {
    final db = await instance.database;
    final maps = await db.query('songs');
    return maps.map((e) => SongModel.fromMap(e)).toList();
  }

  Future<void> updateSongPath(String title, String newPath) async {
    final db = await instance.database;
    await db.update(
      'songs',
      {'filePath': newPath},
      where: 'title = ?',
      whereArgs: [title],
    );
  }
  Future<int> deleteSong(int id) async {
    final db = await instance.database;
    return await db.delete(
      'songs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
