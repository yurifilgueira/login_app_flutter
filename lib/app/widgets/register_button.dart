import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class RegisterButton extends StatelessWidget {
  final bool isRegisterPage;
  final TextEditingController? username;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const RegisterButton.login({
    super.key,
  })  : isRegisterPage = false,
        username = null,
        emailController = null,
        passwordController = null;

  const RegisterButton.register({
    super.key,
    required this.username,
    required this.emailController,
    required this.passwordController,
  }) : isRegisterPage = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).colorScheme;

    if (!isRegisterPage) {
      return ElevatedButton(
          onPressed: () {
            if (ModalRoute.of(context)?.settings.name != '/register') {
              Navigator.pushNamed(context, '/register');
            }
          },
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(textTheme.onPrimaryContainer)),
          child: Text(
            "Register",
            style: getTextStyle(textTheme.primaryContainer, 18),
          ));
    } else {
      return ElevatedButton(
          onPressed: () {
            if (ModalRoute.of(context)?.settings.name != '/register') {
              Navigator.pushNamed(context, '/register');
            }
          },
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(textTheme.onPrimaryContainer)),
          child: Text(
            "Register",
            style: getTextStyle(textTheme.primaryContainer, 18),
          ));
    }
  }
}
