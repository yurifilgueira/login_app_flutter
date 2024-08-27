import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/login_app_api_services.dart';

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
        onPressed: () {
          try {
            final loginAppApiServices = LoginAppApiServices();
    
            final email = emailController.text;
            final password = passwordController.text.toLowerCase();
    
            const flutterSecureStorage = FlutterSecureStorage();
            loginAppApiServices.signin(email, password).then((token) {
              if (token != null) {
                final accessToken = token.accessToken;
                final refreshToken = token.refreshToken;
    
                if (accessToken != null && refreshToken != null) {
                  flutterSecureStorage.write(
                      key: "accessToken", value: accessToken);
                  flutterSecureStorage.write(
                      key: "refreshToken", value: refreshToken);
    
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Placeholder()));
                }
              } else {
                throw ('Invalid email or password');
              }
            }).catchError((error) {
              throw ('Request error: $error');
            });
          } catch (error) {
            throw ('Error: $error');
          }
        },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onPrimaryContainer)),
        child: Text(
          "LogIn",
          style: getTextStyle(
              Theme.of(context).colorScheme.primaryContainer, 20),
        ));
  }
}