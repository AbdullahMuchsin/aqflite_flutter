import 'package:learn_sqflite/core/db/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/category.dart';

class CategoryDao {
  Future<Database> get _db async => await DatabaseHelper.database;

  Future<int> insertCategory(Category category) async {
    final db = await _db;
    return await db.insert('categories', category.toMap());
  }

  Future<List<Category>> getAllCategories() async {
    final db = await _db;
    final maps = await db.query('categories');
    return List.generate(maps.length, (i) => Category.fromMap(maps[i]));
  }

  Future<int> updateCategory(Category category) async {
    final db = await _db;
    return await db.update('categories', category.toMap(), where: 'id = ?', whereArgs: [category.id]);
  }

  Future<int> deleteCategory(int id) async {
    final db = await _db;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }
}
