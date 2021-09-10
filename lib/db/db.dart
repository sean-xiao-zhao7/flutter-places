import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DB {
  static Future<Database> database() async {
    final dbpath = await getDatabasesPath();
    return openDatabase(path.join(dbpath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);
  }

  static Future<int> insert(String table, Map<String, Object> data) async {
    final db = await DB.database();
    return db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, Object>>> getData(String table) async {
    final db = await DB.database();
    return db.query(table);
  }
}
