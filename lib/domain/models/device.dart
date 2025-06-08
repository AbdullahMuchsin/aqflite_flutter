class Device {
  final int? idDevice;
  final String? deviceName;
  final String? apiKey;
  final String? location;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Device({
    required this.idDevice,
    required this.deviceName,
    required this.apiKey,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  // fromJson: membuat instance Device dari JSON (biasanya dari API)
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      idDevice: json['idDevice'],
      deviceName: json['deviceName'],
      apiKey: json['apiKey'],
      location: json['location'],
      createdAt:
          json['createdAt'] != null
              ? DateTime.tryParse(json['createdAt'])
              : null,
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.tryParse(json['updatedAt'])
              : null,
    );
  }

  // fromMap: membuat instance Device dari Map (biasanya dari SQLite)
  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      idDevice: map['idDevice'] as int?,
      deviceName: map['deviceName'] as String?,
      apiKey: map['apiKey'] as String?,
      location: map['location'] as String?,
      createdAt:
          map['createdAt'] != null ? DateTime.tryParse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.tryParse(map['updatedAt']) : null,
    );
  }

  // toMap: membuat Map yang cocok untuk disimpan di database lokal (sqflite)
  Map<String, dynamic> toMap() {
    return {
      'idDevice': idDevice,
      'deviceName': deviceName,
      'apiKey': apiKey,
      'location': location,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // toJson: membuat Map untuk dikirim sebagai JSON (misal ke API)
  Map<String, dynamic> toJson() {
    return {
      'idDevice': idDevice,
      'deviceName': deviceName,
      'apiKey': apiKey,
      'location': location,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
