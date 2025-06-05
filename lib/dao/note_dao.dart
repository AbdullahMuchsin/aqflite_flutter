import 'package:learn_sqflite/core/db/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../models/note.dart';

class NoteDao {
  Future<Database> get _db async => await DatabaseHelper.database;

  Future<int> insertNote(Note note) async {
    final db = await _db;
    return await db.insert('notes', note.toMap());
  }

  Future<List<Note>> getNotesByUser(int userId) async {
    final db = await _db;
    final maps = await db.query(
      'notes',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  Future<int> updateNote(Note note) async {
    final db = await _db;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await _db;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
