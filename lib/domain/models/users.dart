class Users {
  final int? idUsers;
  final String? name;
  final String? email;
  final String? password;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Users({
    required this.idUsers,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      idUsers:
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

  Map<String, dynamic> toJson() {
    return {
      'id_users': idUsers?.toString(),
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
