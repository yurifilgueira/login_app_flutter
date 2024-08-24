import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_app/app/data/models/token.dart';
import 'package:login_app/app/data/models/user.dart';
import 'package:login_app/app/util/environment_variables.dart';

final path = environment['baseUrl'].toString();

class LoginAppApi {
  Future<User?> getUserById(int id) async {
    var client = http.Client();
    var uri = Uri.parse('$path/users/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return userFromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }

    Future<Token?> signin(String email, String password) async {
    var client = http.Client();
    var uri = Uri.parse('$path/auth/signin');
    var body = {'email' : email, 'password' : password};
    var contentType = {'Content-Type' : 'application/json'};
    var response = await client.post(uri, headers: contentType,body: jsonEncode(body));

    if (response.statusCode == 200) {
      return tokenFromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }
}
