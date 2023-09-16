import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../config/master_config.dart';
import '../../viewobject/movie_data.dart';

class DatabaseHelper {
  static Database? _itemDb;
  static DatabaseHelper? _itemDatabaseHelper;

  // Singleton instance
  static final DatabaseHelper _singleton = DatabaseHelper._internal();

  // Singleton accessor
  static DatabaseHelper get instance => _singleton;

  DatabaseHelper._internal();

  static final DatabaseHelper db = DatabaseHelper._internal();
  factory DatabaseHelper() {
    _itemDatabaseHelper = DatabaseHelper._internal();

    return _itemDatabaseHelper!;
  }
  Future<Database> get database async {
    _itemDb = await initializeDatabase();
    return _itemDb!;
  }

  Future<Database> initializeDatabase() async {
    sqfliteFfiInit();
    Directory dir = await getApplicationDocumentsDirectory();
    final dirOfOldAndroidDatabase =
        Directory("${dir.path}/${MasterConfig.app_db_name}");
    if (Platform.isAndroid) {
      if (!await dirOfOldAndroidDatabase.exists()) {
        await dirOfOldAndroidDatabase.create(recursive: true);
      }
    }
    final path = Platform.isIOS
        ? join(dir.path, MasterConfig.app_db_name)
        : join(dir.path.replaceAll("/app_flutter", "/databases"),
            MasterConfig.app_db_name);
    var myDatabase = await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
            version: 1, onCreate: _createDb, onConfigure: _onConfigure));
    return myDatabase;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  void _createDb(Database db, int newVersion) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const realType = 'REAL NOT NULL';

    await db.execute('''
      CREATE TABLE $tableMovie ( 
        ${MovieFields.id} $idType, 
        ${MovieFields.posterPath} $realType,
        ${MovieFields.title} $textType,
        ${MovieFields.voteAverage} $realType
        )
      ''');
  }

  /////////////////////////////////////// Start Movie //////////////////////////////////////

  Future<List<Movie>> fetchMovieData() async {
    final db = await database;
    var itemMapList = await db.query(tableMovie, orderBy: "id ASC");
    return List<Movie>.from(itemMapList.map((x) => Movie.fromJson(x)));
  }

  Future<int> updateMovie(
    Movie movie,
  ) async {
    var db = await database;
    var result = await db.update(
        tableMovie,
        {
          MovieFields.id: movie.id,
          MovieFields.title: movie.title,
          MovieFields.voteAverage: movie.voteAverage,
          MovieFields.posterPath: movie.posterPath
        },
        where: 'id = ?',
        whereArgs: [int.parse(movie.id.toString())]);
    return result;
  }

  Future<int> deleteMovie(String id) async {
    var db = await database;
    return await db.delete(tableMovie, where: 'id = ?', whereArgs: [id]);
  }

  Future<Movie?> getMovieByID(String id) async {
    final db = await database;
    var itemMapList =
        await db.query(tableMovie, where: 'id = ?', whereArgs: [id]);
    return itemMapList.isEmpty
        ? null
        : List<Movie>.from(itemMapList.map((x) => Movie.fromJson(x))).first;
  }

  Future<dynamic> insertMovie(Movie user) async {
    final db = await database;
    final id = await db.insert(tableMovie, {
      MovieFields.id: user.id,
      MovieFields.title: user.title,
      MovieFields.voteAverage: user.voteAverage,
      MovieFields.posterPath: user.posterPath,
    });
    if (id == 0) {
      throw 'No rows were inserted to Movies';
    }
    return id;
  }

/////////////////////////////////////// End Movie //////////////////////////////////////
  ///

  close() async {
    var db = await database;
    var result = db.close();
    return result;
  }
}
