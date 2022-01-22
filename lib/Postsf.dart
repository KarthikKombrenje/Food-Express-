import 'dart:convert';
List<Post> userFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String userToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Post{
  Post({
    required this.Rid,
    required this.Fid,
    required this.FoodName,
    required this.Cost,
  });
  String Rid;
  String Fid;
  String FoodName;
  String Cost;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    Rid: json["Rid"],
    Fid: json["Fid"],
    FoodName: json["FoodName"],
    Cost:json["Cost"],
  );
  Map<String, dynamic> toJson() => {
    "Rid": Rid,
    "Fid": Fid,
    "FoodName": FoodName,
    "Cost":Cost,
  };
}