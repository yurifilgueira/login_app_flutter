import 'dart:convert';

TokenResponse tokenResponseFromJson(String str) =>
    TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse data) => json.encode(data.toJson());
String tokenResponseListToJson(List<TokenResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TokenResponse {
  String accessToken;
  String refreshToken;
  DateTime expiresIn;
  DateTime refreshTokenExpiresIn;

  TokenResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.refreshTokenExpiresIn,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      expiresIn: DateTime.parse(json["expiresIn"]),
      refreshTokenExpiresIn: DateTime.parse(json["refreshTokenExpiresIn"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "refreshTokenExpiresIn": refreshTokenExpiresIn,
      };
}
