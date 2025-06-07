import 'package:learn_sqflite/domain/models/users.dart';

abstract class UsersRepository {
  Future<List<Users>> getUsers();
  Future<void> addUser();
  Future<void> deleteUser();
}
