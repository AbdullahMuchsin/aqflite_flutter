import 'package:learn_sqflite/domain/models/user.dart';

abstract class UsersRepository {
  Future<List<User>> getAllUsers();
  Future<int> updateUser(User user);
  Future<int> addUser(User user);
  Future<int> deleteUser(int idUser);
}
