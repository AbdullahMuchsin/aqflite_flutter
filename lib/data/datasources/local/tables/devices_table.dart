class DevicesTable {
  static const String tableName = "devices";

  static const String createTable = '''
    CREATE TABLE $tableName (
    id_devices INTEGER PRIMARY KEY AUTOINCREMENT,
    users_id INTEGER NOT NULL,
    device_name TEXT,
    api_key TEXT NOT NULL,
    location TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(users_id) REFERENCES users(id_users)
    );
  ''';
}
