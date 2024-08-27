import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/login_button.dart';
import 'package:login_app/app/widgets/register_button.dart';

class AuthActions extends StatelessWidget {
  final TextEditingController? usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isRegisterPage;

  const AuthActions.login({
    super.key,
    required this.emailController,
    required this.passwordController,
  })  : isRegisterPage = false,
        usernameController = null;

  const AuthActions.register({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  }) : isRegisterPage = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginButton(
          emailController: emailController,
          passwordController: passwordController,
          isRegisterPage: isRegisterPage,
        ),
        const SizedBox(width: 20),
        const RegisterButton.login(),
      ],
    );
  }
}
