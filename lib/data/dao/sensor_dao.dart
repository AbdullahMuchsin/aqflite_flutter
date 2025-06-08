import 'package:learn_sqflite/data/datasources/local/database_helper.dart';
import 'package:learn_sqflite/data/datasources/local/tables/sensor_table.dart';
import 'package:learn_sqflite/domain/models/sensor.dart';
import 'package:sqflite/sqlite_api.dart';

class SensorDao {
  Future<Database> get _db async => await DatabaseHelper.database;

  Future<List<Sensor>> getAllSensor() async {
    final db = await _db;
    final maps = await db.query(SensorTable.tableName);
    return List.generate(maps.length, (index) => Sensor.fromMap(maps[index]));
  }

  Future<int> addUser(Sensor user) async {
    final db = await _db;
    return await db.insert(SensorTable.tableName, user.toMap());
  }

  Future<int> updateUser(Sensor sensor) async {
    final db = await _db;
    return await db.update(
      SensorTable.tableName,
      sensor.toMap(),
      where: "id = ?",
      whereArgs: [sensor.idSensor],
    );
  }

  Future<int> deleteUser(int idSensor) async {
    final db = await _db;
    return await db.delete(
      SensorTable.tableName,
      where: "id = ?",
      whereArgs: [idSensor],
    );
  }
}
