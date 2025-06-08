class User {
  final int? idUser;
  final String? name;
  final String? email;
  final String? password;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.idUser,
    this.name,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  // Dari JSON (biasanya dari API)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser:
          json['id_users'] != null
              ? int.tryParse(json['id_users'].toString())
              : null,
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      role: json['role']?.toString(),
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'].toString())
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'].toString())
              : null,
    );
  }

  // Ke JSON (untuk dikirim ke API)
  Map<String, dynamic> toJson() {
    return {
      'id_users': idUser,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  // Dari Map (biasanya dari SQLite)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      idUser: map['id_users'] as int?,
      name: map['name'] as String?,
      email: map['email'] as String?,
      password: map['password'] as String?,
      role: map['role'] as String?,
      createdAt:
          map['created_at'] != null
              ? (map['created_at'] is int
                  ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
                  : DateTime.tryParse(map['created_at'].toString()))
              : null,
      updatedAt:
          map['updated_at'] != null
              ? (map['updated_at'] is int
                  ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
                  : DateTime.tryParse(map['updated_at'].toString()))
              : null,
    );
  }

  // Ke Map (untuk disimpan di SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id_users': idUser,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }
}
