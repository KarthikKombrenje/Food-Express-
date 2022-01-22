import 'dart:convert';

List<Welcome> welcomeFromMap(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromMap(x)));

String welcomeToMap(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Welcome {
  Welcome({
    required this.userId,
    required this.id,
    required this.title,
  });

  String userId;
  String id;
  String title;

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
