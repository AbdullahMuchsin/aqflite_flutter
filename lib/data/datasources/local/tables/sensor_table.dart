class SensorTable {
  static const String tableName = "sensor";

  static const String createTable = '''
    CREATE TABLE $tableName (
      id_sensor INTEGER PRIMARY KEY AUTOINCREMENT,
      devices_id INTEGER NOT NULL,
      temperature REAL NOT NULL,
      humidity REAL NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY(devices_id) REFERENCES devices(id_devices)
    );
  ''';
}
