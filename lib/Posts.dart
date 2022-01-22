import 'dart:convert';
List<Post> userFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String userToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Post{
  Post({
    required this.Did,
    required this.Dname,
    required this.Age,
  });
  String Did;
  String Dname;
  String Age;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    Did: json["Did"],
    Dname: json["Dname"],
    Age: json["Age"],
  );
  Map<String, dynamic> toJson() => {
    "Did": Did,
    "Dname": Dname,
    "Age": Age,
  };
}