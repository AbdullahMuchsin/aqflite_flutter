import 'package:learn_sqflite/core/db/tables/category_table.dart';
import 'package:learn_sqflite/core/db/tables/note_table.dart';
import 'package:learn_sqflite/core/db/tables/user_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "app_database.db");

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
      db.close();
    }
  }
}
