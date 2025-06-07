import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) _database;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {},
    );

    return _database!;
  }

  Future close() async {
    if (_database != null) {
      final db = await database;
      await db.close();
      _database = null;
    }
  }
}
