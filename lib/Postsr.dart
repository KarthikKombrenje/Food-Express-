import 'dart:convert';
List<Post> userFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String userToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Post{
  Post({
    required this.Rid,
    required this.Rname,
    required this.Location,
  });
  String Rid;
  String Rname;
  String Location;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    Rid: json["Rid"],
    Rname: json["Rname"],
   Location: json["Location"],
  );
  Map<String, dynamic> toJson() => {
    "Rid": Rid,
    "Rname": Rname,
    "Location": Location,
  };
}