import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_app/app/data/models/user.dart';

class LoginAppApi {
  Future<User?> getUserById(int id) async {
    var client = http.Client();
    var uri = Uri.parse('path-to-method');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return userFromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }
}