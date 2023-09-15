import 'dart:io';
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
    var databaseFactory = databaseFactoryFfi;
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}\\${MasterConfig.app_db_name}';
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

  close() async {
    var db = await database;
    var result = db.close();
    return result;
  }
}
