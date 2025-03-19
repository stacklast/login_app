import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'session.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE session (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            isLoggedIn INTEGER
          )
          ''',
        );
      },
    );
  }

  Future<void> iniciarSesion() async {
    final db = await database;
    await db.insert(
      'session',
      {'isLoggedIn': 1},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> cerrarSesion() async {
    final db = await database;
    await db.delete('session');
  }

  Future<bool> estaLogueado() async {
    final db = await database;
    final result = await db.query('session');
    return result.isNotEmpty && result[0]['isLoggedIn'] == 1;
  }
}
