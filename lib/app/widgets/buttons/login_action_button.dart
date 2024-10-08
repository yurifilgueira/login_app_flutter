import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/app_local_storage_services.dart';
import 'package:login_app/app/data/services/login_app_api_services.dart';
import 'package:login_app/app/pages/profile_page.dart';

class LoginActionButton extends StatelessWidget {
  const LoginActionButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
              if (_verifyData(context)) {_login(context)}
            },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onPrimaryContainer)),
        child: Text(
          "LogIn",
          style:
              getTextStyle(Theme.of(context).colorScheme.primaryContainer, 20),
        ));
  }

  bool _verifyData(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showAlertDialog(context, 'All fields must be filled in');

      return false;
    }

    return true;
  }

  void _login(BuildContext context) async {
    try {
      final loginAppApiServices = LoginAppApiServices();

      final email = emailController.text.toLowerCase();
      final password = passwordController.text.toLowerCase();
        final loginResponse = await loginAppApiServices.signin(email, password);

        _saveData(email, password, loginResponse);
      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
      }
    } catch (error) {
      if (context.mounted) {
        final message = error.toString().replaceAll("Exception: ", "");
        showAlertDialog(context, message);
      }
    }
  }

  void _saveData(email, password, loginResponse) async {
    const flutterSecureStorage = FlutterSecureStorage();
    final localStorage = await AppLocalStorageServices.getInstance();

    final username = loginResponse.user.name;

    await localStorage.setUsername(username);
    await localStorage.setEmail(email);

    await flutterSecureStorage.write(
        key: 'accessToken', value: loginResponse.tokenResponse.accessToken);
    await flutterSecureStorage.write(
        key: 'refreshToken', value: loginResponse.tokenResponse.refreshToken);
    await flutterSecureStorage.write(
        key: 'userId', value: loginResponse.user.id.toString());
    await flutterSecureStorage.write(
        key: 'expiresIn',
        value: loginResponse.tokenResponse.expiresIn.toString());
    await flutterSecureStorage.write(
        key: 'refreshTokenExpiresIn',
        value: loginResponse.tokenResponse.refreshTokenExpiresIn.toString());
  }
}
