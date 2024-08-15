import 'package:login_app/app/data/models/token.dart';
import 'package:login_app/app/data/models/user.dart';
import 'package:login_app/app/data/providers/login_app_api.dart';

class LoginAppApiServices {
  final _api = LoginAppApi();
  Future<User?> getUserById(int id) async {
    return _api.getUserById(id);
  }

  Future<Token?> signin(String email, String passowrd) async {
    return _api.signin(email, passowrd);
  }
}