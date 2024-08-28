import 'dart:convert';
import 'package:login_app/app/data/models/token_response.dart';
import 'package:login_app/app/data/models/user.dart';

LoginResponse tokenResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String tokenResponseToJson(LoginResponse data) => json.encode(data.toJson());
String tokenResponseListToJson(List<LoginResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class LoginResponse {
  User user;
  TokenResponse tokenResponse;

  LoginResponse({required this.user, required this.tokenResponse});


  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    
      final accessToken = json["accessToken"];
      final refreshToken = json["refreshToken"];
      final expiresIn = DateTime.parse(json["expiresIn"]);
      final refreshTokenExpiresIn = DateTime.parse(json["refreshTokenExpiresIn"]);

    return LoginResponse(
      user: User.fromJson(json['user']),
      tokenResponse: TokenResponse(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
        refreshTokenExpiresIn: refreshTokenExpiresIn),
      );
  }

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": tokenResponse.toJson(),
  };

}
