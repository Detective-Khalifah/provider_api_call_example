import 'dart:convert';

// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

List<ToDo> toDoFromJson(String str) =>
    List<ToDo>.from(json.decode(str).map((x) => ToDo.fromJson(x)));

String toDoToJson(List<ToDo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDo {
  ToDo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  final int userId;
  final int id;
  final String title;
  final bool completed;

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
