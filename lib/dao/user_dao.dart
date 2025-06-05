import 'package:learn_sqflite/core/db/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user.dart';

class UserDao {
  Future<Database> get _db async => await DatabaseHelper.database;

  Future<int> insertUser(User user) async {
    final db = await _db;
    return await db.insert('users', user.toMap());
  }

  Future<List<User>> getAllUsers() async {
    final db = await _db;
    final maps = await db.query('users');
    return List.generate(maps.length, (i) => User.fromMap(maps[i]));
  }

  Future<int> updateUser(User user) async {
    final db = await _db;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await _db;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
