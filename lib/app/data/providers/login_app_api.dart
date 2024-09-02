import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/app/data/models/login_response.dart';
import 'package:login_app/app/data/models/user.dart';

final path = dotenv.env['LOGIN_APP_API_BASE_URL'];

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

  Future<LoginResponse> signin(String email, String password) async {
    var client = http.Client();
    var uri = Uri.parse('$path/auth/signin');
    var body = {'email': email, 'password': password};
    var contentType = {'Content-Type': 'application/json'};
    var response =
        await client.post(uri, headers: contentType, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Login failed with status code: ${response.statusCode}');
    }
  }

  Future<http.Response> register(
      String name, String email, String password) async {
    var client = http.Client();
    var uri = Uri.parse('$path/users/register');
    var body = {
      'name': name,
      'email': email,
      'password': password,
      'roles': ['ROLE_CUSTOMER']
    };
    var contentType = {'Content-Type': 'application/json'};

    return await client.post(uri, headers: contentType, body: jsonEncode(body));
  }

  Future<LoginResponse> updateUserInfo(int id, String username, String email,
      String newPassword, String confirmNewPassword) async {
    var client = http.Client();
    var uri = Uri.parse('$path/users');
    var body = {
      'id': id,
      'name': username,
      'email': email,
      'newPassword': newPassword,
      'confirmNewPassword': confirmNewPassword
    };
    var contentType = {'Content-Type': 'application/json'};
    var response =
        await client.put(uri, headers: contentType, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Login failed with status code: ${response.statusCode}');
    }
  }
}
