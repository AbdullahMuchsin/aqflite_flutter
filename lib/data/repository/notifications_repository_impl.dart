import 'package:learn_sqflite/data/dao/notifications_dao.dart';
import 'package:learn_sqflite/domain/models/notifiaction.dart';
import 'package:learn_sqflite/domain/repositories/notifications_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsDao notificationsDao = NotificationsDao();

  @override
  Future<List<NotificationModel>> getAllNotifications() =>
      notificationsDao.getAllNotifications();

  @override
  Future<int> addNotification(NotificationModel notification) =>
      notificationsDao.addNotification(notification);

  @override
  Future<int> updateNotification(NotificationModel notification) =>
      notificationsDao.updateNotification(notification);

  @override
  Future<int> deleteNotification(int idNotification) =>
      notificationsDao.deleteNotification(idNotification);
}
