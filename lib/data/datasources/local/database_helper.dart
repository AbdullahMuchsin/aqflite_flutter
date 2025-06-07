import 'package:learn_sqflite/data/datasources/local/tables/devices_table.dart';
import 'package:learn_sqflite/data/datasources/local/tables/notifications_table.dart';
import 'package:learn_sqflite/data/datasources/local/tables/sensor_table.dart';
import 'package:learn_sqflite/data/datasources/local/tables/users_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) _database;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(UsersTable.createTable);
        await db.execute(DevicesTable.createTable);
        await db.execute(SensorTable.createTable);
        await db.execute(NotificationsTable.createTable);
      },
    );

    return _database!;
  }

  static Future close() async {
    if (_database != null) {
      final db = await database;
      await db.close();
      _database = null;
    }
  }
}
