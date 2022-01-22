import 'dart:convert';
List<Post> userFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String userToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Post{
  Post({
    required this.Cid,
    required this.Cname,
    required this.Cadd,
    required this.Ctype,
  });
  String Cid;
  String Cname;
  String Cadd;
  String Ctype;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    Cid: json["Cid"],
    Cname: json["Cname"],
    Cadd: json["Cadd"],
    Ctype:json["Ctype"],
  );
  Map<String, dynamic> toJson() => {
    "Cid": Cid,
    "Cname": Cname,
    "Cadd": Cadd,
    "Ctype":Ctype,
  };
}