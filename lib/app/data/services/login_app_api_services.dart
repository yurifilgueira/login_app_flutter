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
    return _api.signin(email, passowrd);
  }

  Future<http.Response> register(String username, String email, String passowrd) async {
    return _api.register(username, email, passowrd);
  }
}
