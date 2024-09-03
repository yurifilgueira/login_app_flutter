import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/login_app_api_services.dart';
import 'package:login_app/app/pages/register_page.dart';

class RegisterButton extends StatelessWidget {
  final bool isRegisterPage;
  final TextEditingController? usernameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
    final TextEditingController? confirmPasswordController;


  const RegisterButton.login({
    super.key,
  })  : isRegisterPage = false,
        usernameController = null,
        emailController = null,
        passwordController = null,
        confirmPasswordController = null;

  const RegisterButton.register({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
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
        confirmPasswordController: confirmPasswordController!,
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
  final TextEditingController confirmPasswordController;

  const RegisterActionButton(
      {super.key,
      required this.textTheme,
      required this.usernameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final loginAppApiServices = LoginAppApiServices();

          final username = usernameController.text.toLowerCase();
          final email = emailController.text.toLowerCase();
          final password = passwordController.text.toLowerCase();
          final confirmPassword = confirmPasswordController.text.toLowerCase();

          final dataIsValid = verifyData(email, username, password, confirmPassword, context);

          if (dataIsValid) {
            final response =
                await loginAppApiServices.register(username, email, password);

            if (context.mounted) {
              if (response.statusCode == 201) {
                showRegisterSuccessDialog(context, response.body);
                usernameController.clear();
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
              }
              else {
                showAlertDialog(context, response.body);
              }
            }
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


bool verifyData(String email,
    String username,
    String passowrd,
    String confirmPassword,
    BuildContext context) {


  if (email == "" &&
      username == "") {
    if (context.mounted) {
      showAlertDialog(context, "All fields must be filled in");
    }
    return false;
  }

  if (passowrd == "" && confirmPassword == "") {
    if (context.mounted) {
      showAlertDialog(context, "All fields must be filled in");
    }
    return false;
  }

  if (passowrd != confirmPassword) {
    if (context.mounted) {
      showAlertDialog(context, "The passwords must correspond");
    }
    return false;
  }

  return true;

}