import 'dart:convert';

import 'package:login_app/app/data/models/login_response.dart';
import 'package:login_app/app/data/models/user.dart';
import 'package:login_app/app/data/providers/login_app_api.dart';
import 'package:http/http.dart' as http;

class LoginAppApiServices {
  final _api = LoginAppApi();
  Future<User?> getUserById(int id) async {
    return _api.getUserById(id);
  }

  Future<LoginResponse> signin(String email, String passowrd) async {
    final response = await _api.signin(email, passowrd);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return LoginResponse.fromJson(data);
    }
    else if (response.statusCode == 401) {
      throw Exception('Invalid email or password.');
    }
    else {
      throw Exception('A error has ocurred.');
    }
  }

  Future<http.Response> register(
      String username, String email, String passowrd) async {
    return _api.register(username, email, passowrd);
  }

  Future<LoginResponse> updateUserInfo(int id, String username, String email,
      String newPassowrd, String confirmNewPassowrd) async {
    return _api.updateUserInfo(
        id, username, email, newPassowrd, confirmNewPassowrd);
  }
}
