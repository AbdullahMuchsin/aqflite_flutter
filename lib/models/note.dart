class Note {
  int? id;
  int userId;
  String title;
  String? content;

  Note({this.id, required this.userId, required this.title, this.content});

  factory Note.fromMap(Map<String, dynamic> json) => Note(
    id: json['id'],
    userId: json['userId'],
    title: json['title'],
    content: json['content'],
  );

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'userId': userId,
      'title': title,
      'content': content,
    };
    if (id != null) map['id'] = id;
    return map;
  }
}
