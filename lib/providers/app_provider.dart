

import 'package:flutter/material.dart';
import 'package:learn_sqflite/models/category.dart';
import 'package:learn_sqflite/models/note.dart';
import 'package:learn_sqflite/models/user.dart';
import 'package:learn_sqflite/repository/app_repository.dart';

class AppProvider extends ChangeNotifier {
  final AppRepository repository;

  AppProvider(this.repository) {
    loadUsers();
    loadCategories();
  }

  List<User> users = [];
  List<Category> categories = [];
  Map<int, List<Note>> userNotes = {};

  bool isLoading = false;

  // Load Users
  Future<void> loadUsers() async {
    isLoading = true;
    notifyListeners();

    users = await repository.fetchUsers();

    isLoading = false;
    notifyListeners();
  }

  // Add User
  Future<void> addUser(User user) async {
    await repository.addUser(user);
    await loadUsers();
  }

  // Load Categories
  Future<void> loadCategories() async {
    categories = await repository.fetchCategories();
    notifyListeners();
  }

  // Add Category
  Future<void> addCategory(Category category) async {
    await repository.addCategory(category);
    await loadCategories();
  }

  // Load Notes for User
  Future<void> loadNotesForUser(int userId) async {
    userNotes[userId] = await repository.fetchNotesByUser(userId);
    notifyListeners();
  }

  // Add Note
  Future<void> addNote(Note note) async {
    await repository.addNote(note);
    await loadNotesForUser(note.userId);
  }
}
