import 'dart:convert';
List<Post> userFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String userToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Post{
  Post({
    required this.Rid,
    required this.Cid,
    required this.Rating,
  });
  String Rid;
  String Cid;
  String Rating;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    Rid: json["Rid"],
    Cid: json["Cid"],
    Rating: json["Rating"],
  );
  Map<String, dynamic> toJson() => {
    "Rid": Rid,
    "Cid": Cid,
    "Rating": Rating,
  };
}