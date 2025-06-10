import 'package:learn_sqflite/data/datasources/local/database_helper.dart';
import 'package:learn_sqflite/data/datasources/local/tables/notifications_table.dart';
import 'package:learn_sqflite/domain/models/notifiaction.dart';
import 'package:sqflite/sqflite.dart';

class NotificationsDao {
  Future<Database> get _db async => DatabaseHelper.database;

  Future<List<NotificationModel>> getAllNotifications() async {
    final db = await _db;
    final maps = await db.query(NotificationsTable.tableName);
    return List.generate(
      maps.length,
      (index) => NotificationModel.fromMap(maps[index]),
    );
  }

  Future<int> addNotification(NotificationModel notification) async {
    final db = await _db;
    return await db.insert(NotificationsTable.tableName, notification.toMap());
  }

  Future<int> updateNotification(NotificationModel notification) async {
    final db = await _db;
    return await db.update(
      NotificationsTable.tableName,
      notification.toMap(),
      where: "id = ?",
      whereArgs: [notification.idNotification],
    );
  }

  Future<int> deleteNotification(int idNotification) async {
    final db = await _db;
    return await db.delete(
      NotificationsTable.tableName,
      where: "id = ?",
      whereArgs: [idNotification],
    );
  }
}
