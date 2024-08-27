import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/login_button.dart';
import 'package:login_app/app/widgets/register_button.dart';

class AuthActions extends StatelessWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final formKey;

  const AuthActions({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginButton(emailController: emailController, passowrdController: passwordController),
        const SizedBox(width: 20),
        const RegisterButton(),
      ],
    );
  }
}