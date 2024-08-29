import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/login_app_api_services.dart';
import 'package:login_app/app/pages/register_page.dart';

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterPage()));
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
    final primaryContainerColor =
        Theme.of(context).colorScheme.primaryContainer;
    final onPrimaryContainerColor =
        Theme.of(context).colorScheme.onPrimaryContainer;

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return ElevatedButton(
        onPressed: () async {
          final loginAppApiServices = LoginAppApiServices();

          final username = usernameController.text.toLowerCase();
          final email = emailController.text.toLowerCase();
          final password = passwordController.text.toLowerCase();

          final response =
              await loginAppApiServices.register(username, email, password);

          final snackBar = SnackBar(
            content: Text(response.body,
                style: getTextStyle(primaryContainerColor, 20)),
            backgroundColor: onPrimaryContainerColor.withAlpha(200),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0)),
          );

          scaffoldMessenger.showSnackBar(snackBar);
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
