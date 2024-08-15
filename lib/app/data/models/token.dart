import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());
String tokenListToJson(List<Token> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Token {
  int? userId;
  String? username;
  bool?  authenticated;
  DateTime? created;
  DateTime? expiration;
  String? accessToken;
  String? refreshToken;

 Token({
    required this.userId,
    required this.username,
    required this.authenticated,
    required this.created,
    required this.expiration,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      userId: json["userId"] ?? json["userId"],
      username: json["username"] ?? json["username"],
      authenticated: json["authenticated"] ?? json["authenticated"],
      created: json["created"] != null ? DateTime.parse(json["created"]) : null,
      expiration: json["expiration"] != null ? DateTime.parse(json["expiration"]) : null,
      accessToken: json["accessToken"] ?? json["accessToken"],
      refreshToken: json["refreshToken"] ?? json["refreshToken"],

    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "authenticated" : authenticated,
    "created" : created,
    "expiration" : expiration,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };

}