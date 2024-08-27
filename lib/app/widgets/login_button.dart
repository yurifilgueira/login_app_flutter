import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/back_to_login_screen_button.dart';
import 'package:login_app/app/widgets/login_action_button.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isRegisterPage;

  const LoginButton(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.isRegisterPage,
      usernameController});

  @override
  Widget build(BuildContext context) {
    if (!isRegisterPage) {
      return LoginActionButton(emailController: emailController, passwordController: passwordController);
    } else {
      return const BackToLoginScreenButton();
    }
  }
}