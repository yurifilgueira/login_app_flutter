import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/login_button.dart';
import 'package:login_app/app/widgets/register_button.dart';

class AuthActions extends StatelessWidget {

  final TextEditingController emailController;
  final TextEditingController passowrdController;

  const AuthActions({
    super.key,
    required this.emailController,
    required this.passowrdController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginButton(emailController: emailController, passowrdController: passowrdController),
        const SizedBox(width: 20),
        const RegisterButton(),
      ],
    );
  }
}