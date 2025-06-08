import 'package:learn_sqflite/data/datasources/local/database_helper.dart';
import 'package:learn_sqflite/data/datasources/local/tables/users_table.dart';
import 'package:learn_sqflite/domain/models/user.dart';
import 'package:sqflite/sqlite_api.dart';

class UsersDao {
  Future<Database> get _db async => await DatabaseHelper.database;

  Future<List<User>> getAllUsers() async {
    final db = await _db;

    final maps = await db.query(UsersTable.tableName);
    return List.generate(maps.length, (index) => User.fromMap(maps[index]));
  }

  Future<int> addUser(User user) async {
    final db = await _db;
    return await db.insert(UsersTable.tableName, user.toMap());
  }

  Future<int> updateUser(User user) async {
    final db = await _db;
    return await db.update(
      UsersTable.tableName,
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.idUser],
    );
  }

  Future<int> deleteUser(int idUser) async {
    final db = await _db;
    return await db.delete(
      UsersTable.tableName,
      where: "id = ?",
      whereArgs: [idUser],
    );
  }
}
