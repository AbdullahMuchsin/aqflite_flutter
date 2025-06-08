import 'package:learn_sqflite/domain/models/notifiaction.dart';

abstract class NotificationsRepository {
  Future<List<NotificationModel>> getAllNotifications();
  Future<int> updateNotification(NotificationModel notification);
  Future<int> addNotification(NotificationModel notification);
  Future<int> deleteNotification(int idNotification);
}
