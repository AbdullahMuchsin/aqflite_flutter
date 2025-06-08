class NotificationModel {
  int? idNotification;
  int? usersId;
  String? message;
  int? isRead; // 0 = unread, 1 = read
  DateTime? createdAt;

  NotificationModel({
    this.idNotification,
    this.usersId,
    this.message,
    this.isRead,
    this.createdAt,
  });

  // From Map (SQLite)
  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      idNotification: map['id_notifications'] as int?,
      usersId: map['users_id'] as int?,
      message: map['message'] as String?,
      isRead: map['is_read'] as int?,
      createdAt: map['created_at'] != null
          ? DateTime.tryParse(map['created_at'])
          : null,
    );
  }

  // To Map (SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id_notifications': idNotification,
      'users_id': usersId,
      'message': message,
      'is_read': isRead,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  // From JSON (misalnya dari API)
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      idNotification: json['id_notifications'] as int?,
      usersId: json['users_id'] as int?,
      message: json['message'] as String?,
      isRead: json['is_read'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
    );
  }

  // To JSON (misalnya untuk dikirim ke API)
  Map<String, dynamic> toJson() {
    return {
      'id_notifications': idNotification,
      'users_id': usersId,
      'message': message,
      'is_read': isRead,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
