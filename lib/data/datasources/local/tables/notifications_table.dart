class NotificationsTable {
  static const String tableName = "notifications";

  static const String createTable = '''
    CREATE TABLE $tableName (
      id_notifications INTEGER PRIMARY KEY AUTOINCREMENT,
      users_id INTEGER NOT NULL,
      message TEXT NOT NULL,
      is_read INTEGER DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(users_id) REFERENCES users(id_users)
    );
  ''';
}
