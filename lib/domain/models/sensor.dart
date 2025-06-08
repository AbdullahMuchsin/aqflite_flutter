class Sensor {
  int? idSensor;
  int? devicesId;
  double? temperature;
  double? humidity;
  DateTime? createdAt;

  Sensor({
    this.idSensor,
    this.devicesId,
    this.temperature,
    this.humidity,
    this.createdAt,
  });

  factory Sensor.fromMap(Map<String, dynamic> map) {
    return Sensor(
      idSensor: map['id_sensor'] as int?,
      devicesId: map['devices_id'] as int?,
      temperature: (map['temperature'] as num?)?.toDouble(),
      humidity: (map['humidity'] as num?)?.toDouble(),
      createdAt:
          map['created_at'] != null
              ? DateTime.tryParse(map['created_at'])
              : null,
    );
  }

  // To Map (SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id_sensor': idSensor,
      'devices_id': devicesId,
      'temperature': temperature,
      'humidity': humidity,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  // From JSON (misalnya dari API)
  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      idSensor: json['id_sensor'] as int?,
      devicesId: json['devices_id'] as int?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
    );
  }

  // To JSON (misalnya untuk dikirim ke API)
  Map<String, dynamic> toJson() {
    return {
      'id_sensor': idSensor,
      'devices_id': devicesId,
      'temperature': temperature,
      'humidity': humidity,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
