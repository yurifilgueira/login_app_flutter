import 'dart:convert';
import 'dart:ffi';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {

  int? id;
  String? name;
  String? email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"]);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,

  };

  String? getEmail() {
    return email;
  }

}
