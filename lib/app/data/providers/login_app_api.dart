import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/app/data/models/login_response.dart';
import 'package:login_app/app/data/models/token_response.dart';
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

  Future<http.Response> signin(String email, String password) async {
    var client = http.Client();
    var uri = Uri.parse('$path/auth/signin');
    var body = {'email': email, 'password': password};
    var contentType = {'Content-Type': 'application/json'};
    var response =
        await client.post(uri, headers: contentType, body: jsonEncode(body));

    return response;
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
    final client = http.Client();
    final uri = Uri.parse('$path/users');
    final body = {
      'id': id,
      'name': username,
      'email': email,
      'newPassword': newPassword,
      'confirmNewPassword': confirmNewPassword
    };
    final accessToken = await _getAccessToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': ('Bearer $accessToken')
    };

    var response =
        await client.put(uri, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('Login failed with status code: ${response.statusCode}');
    }
  }

  Future<TokenResponse> refreshToken() async {
    final client = http.Client();
    final uri = Uri.parse('$path/auth/refresh');
    final refreshToken = await _getRefreshToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': ('Bearer $refreshToken')
    };

    final response = await client.post(uri, headers: headers);

    if (response.statusCode == 200) {
      return tokenResponseFromJson(response.body);
    } else {
      throw Exception('Error while refreshing token: ${response.body}');
    }
  }
}

Future<String> _getAccessToken() async {
  const flutterSecureStorage = FlutterSecureStorage();

  final accessToken = await flutterSecureStorage.read(key: 'accessToken');

  if (accessToken == null) {
    throw Exception('Error');
  } else {
    return accessToken;
  }
}

Future<String> _getRefreshToken() async {
  const flutterSecureStorage = FlutterSecureStorage();

  final refreshToken = await flutterSecureStorage.read(key: 'refreshToken');

  if (refreshToken == null) {
    throw Exception('Error');
  } else {
    return refreshToken;
  }
}
