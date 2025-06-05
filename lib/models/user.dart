class User {
  int? id;
  String name;
  String email;

  User({this.id, required this.name, required this.email});

  factory User.fromMap(Map<String, dynamic> json) =>
      User(id: json['id'], name: json['name'], email: json['email']);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{'name': name, 'email': email};
    if (id != null) map['id'] = id;
    return map;
  }
}
