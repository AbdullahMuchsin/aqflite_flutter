import 'package:learn_sqflite/data/datasources/local/database_helper.dart';
import 'package:learn_sqflite/data/datasources/local/tables/devices_table.dart';
import 'package:learn_sqflite/domain/models/device.dart';
import 'package:sqflite/sqflite.dart';

class DevicesDao {
  Future<Database> get _db async => await DatabaseHelper.database;

  Future<List<Device>> getAllDevices() async {
    final db = await _db;
    final maps = await db.query(DevicesTable.tableName);
    return List.generate(maps.length, (index) => Device.fromJson(maps[index]));
  }

  Future<int> addDevice(Device device) async {
    final db = await _db;
    return await db.insert(DevicesTable.tableName, device.toMap());
  }

  Future<int> updateDevice(Device device) async {
    final db = await _db;
    return await db.update(
      DevicesTable.tableName,
      device.toMap(),
      where: "id_device = ?",
      whereArgs: [device.idDevice],
    );
  }

  Future<int> deleteDevice(int idDevice) async {
    final db = await _db;
    return await db.delete(
      DevicesTable.tableName,
      where: "id_device = ?",
      whereArgs: [idDevice],
    );
  }
}
