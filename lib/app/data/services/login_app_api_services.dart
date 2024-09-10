import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/app/data/models/login_response.dart';
import 'package:login_app/app/data/models/token_response.dart';
import 'package:login_app/app/data/models/user.dart';
import 'package:login_app/app/data/providers/login_app_api.dart';
import 'package:http/http.dart' as http;

class LoginAppApiServices {
  final _flutterSecureStorage = const FlutterSecureStorage();

  final _api = LoginAppApi();
  Future<User?> getUserById(int id) async {
    return _api.getUserById(id);
  }

  Future<LoginResponse> signin(String email, String passowrd) async {
    final response = await _api.signin(email, passowrd);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return LoginResponse.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Invalid email or password.');
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<http.Response> register(
      String username, String email, String passowrd) async {
    return _api.register(username, email, passowrd);
  }

  Future<LoginResponse> updateUserInfo(int id, String username, String email,
      String newPassowrd, String confirmNewPassowrd) async {
    final isUserAccessValid = await _verifyUserAccess();

    if (!isUserAccessValid) {
      throw Exception('Session expired');
    }

    return _api.updateUserInfo(
        id, username, email, newPassowrd, confirmNewPassowrd);
  }

  Future<bool> _verifyUserAccess() async {
    try {
      final expiration = await _flutterSecureStorage.read(key: 'expiresIn');
      if (expiration == null) {
        throw Exception('\'expiresIn\' field is null');
      }

      final expiresIn = DateTime.parse(expiration);
      final now = DateTime.now().toUtc();

      if (now.isAfter(expiresIn)) {
        final refreshTokenIsValid = await _verifyRefreshToken();

        if (refreshTokenIsValid) {
          _refreshToken();

          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> _verifyRefreshToken() async {
    try {
      final expiration =
          await _flutterSecureStorage.read(key: 'refreshTokenExpiresIn');
      if (expiration == null) {
        throw Exception('\'expiresIn\' field is null');
      }

      final refreshTokenExpiresIn = DateTime.parse(expiration);
      final now = DateTime.now().toUtc();

      if (now.isAfter(refreshTokenExpiresIn)) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void _refreshToken() async {
    final TokenResponse tokenResponse = await _api.refreshToken();

    final accessToken = tokenResponse.accessToken;
    final refreshToken = tokenResponse.refreshToken;
    final expiresIn = tokenResponse.expiresIn.toString();
    final refreshTokenExpiresIn =
        tokenResponse.refreshTokenExpiresIn.toString();

    _flutterSecureStorage.write(key: 'accessToken', value: accessToken);
    _flutterSecureStorage.write(key: 'refreshToken', value: refreshToken);
    _flutterSecureStorage.write(key: 'expiresIn', value: expiresIn);
    _flutterSecureStorage.write(
        key: 'refreshTokenExpiresIn', value: refreshTokenExpiresIn);
  }
}
