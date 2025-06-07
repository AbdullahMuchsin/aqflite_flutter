import 'package:learn_sqflite/data/dao/users_dao.dart';
import 'package:learn_sqflite/domain/models/user.dart';
import 'package:learn_sqflite/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDao usersDao = UsersDao();

  Future<List<User>> getAllUsers() => usersDao.getAllUsers();

  Future<int> addUser(User user) => usersDao.addUser(user);

  Future<int> updateUser(User user) => usersDao.updateUser(user);

  Future<int> deleteUser(int idUser) => usersDao.deleteUser(idUser);
}
