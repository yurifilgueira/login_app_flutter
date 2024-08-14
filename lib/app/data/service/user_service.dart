import 'package:login_app/app/data/models/user.dart';
import 'package:login_app/app/data/provider/login_app_api.dart';

class UserService {
  final _api = LoginAppApi();
  Future<User?> getUserById(int id) async {
    return _api.getUserById(id);
  }
}