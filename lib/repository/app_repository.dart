

import 'package:learn_sqflite/dao/category_dao.dart';
import 'package:learn_sqflite/dao/note_dao.dart';
import 'package:learn_sqflite/dao/user_dao.dart';
import 'package:learn_sqflite/models/category.dart';
import 'package:learn_sqflite/models/note.dart';
import 'package:learn_sqflite/models/user.dart';

class AppRepository {
  final UserDao userDao = UserDao();
  final NoteDao noteDao = NoteDao();
  final CategoryDao categoryDao = CategoryDao();

  // User
  Future<int> addUser(User user) => userDao.insertUser(user);
  Future<List<User>> fetchUsers() => userDao.getAllUsers();
  Future<int> updateUser(User user) => userDao.updateUser(user);
  Future<int> deleteUser(int id) => userDao.deleteUser(id);

  // Note
  Future<int> addNote(Note note) => noteDao.insertNote(note);
  Future<List<Note>> fetchNotesByUser(int userId) =>
      noteDao.getNotesByUser(userId);
  Future<int> updateNote(Note note) => noteDao.updateNote(note);
  Future<int> deleteNote(int id) => noteDao.deleteNote(id);

  // Category
  Future<int> addCategory(Category category) =>
      categoryDao.insertCategory(category);
  Future<List<Category>> fetchCategories() => categoryDao.getAllCategories();
  Future<int> updateCategory(Category category) =>
      categoryDao.updateCategory(category);
  Future<int> deleteCategory(int id) => categoryDao.deleteCategory(id);
}
