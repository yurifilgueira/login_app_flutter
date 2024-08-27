import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/login_app_api_services.dart';

class RegisterButton extends StatelessWidget {
  final bool isRegisterPage;
  final TextEditingController? usernameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const RegisterButton.login({
    super.key,
  })  : isRegisterPage = false,
        usernameController = null,
        emailController = null,
        passwordController = null;

  const RegisterButton.register({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  }) : isRegisterPage = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).colorScheme;

    if (!isRegisterPage) {
      return GoToRegisterPageButton(textTheme: textTheme);
    } else {
      return RegisterActionButton(
        textTheme: textTheme,
        usernameController: usernameController!,
        emailController: emailController!,
        passwordController: passwordController!,
      );
    }
  }
}

class GoToRegisterPageButton extends StatelessWidget {
  const GoToRegisterPageButton({
    super.key,
    required this.textTheme,
  });

  final ColorScheme textTheme;

  @override
  Widget build(BuildContext context) {
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

class RegisterActionButton extends StatelessWidget {
  final ColorScheme textTheme;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const RegisterActionButton(
      {super.key,
      required this.textTheme,
      required this.usernameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final loginAppApiServices = LoginAppApiServices();

          final username = usernameController.text.toLowerCase();
          final email = emailController.text.toLowerCase();
          final password = passwordController.text.toLowerCase();

          loginAppApiServices
              .register(username, email, password)
              .then((response) {
            final snackBar = SnackBar(
              content: Text(response.body,
                  style: getTextStyle(
                      Theme.of(context).colorScheme.primaryContainer, 20)),
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withAlpha(200),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        },
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(textTheme.onPrimaryContainer)),
        child: Text(
          "Sing Up",
          style: getTextStyle(textTheme.primaryContainer, 18),
        ));
  }
}
