import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'tables/user_table.dart';
import 'tables/note_table.dart';
import 'tables/category_table.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(UserTable.createTable);
        await db.execute(CategoryTable.createTable);
        await db.execute(NoteTable.createTable);
      },
    );

    return _database!;
  }

  static Future close() async {
    final db = _database;
    if (db != null) {
      await db.close();
    }
  }
}
