import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/buttons/login_button.dart';
import 'package:login_app/app/widgets/buttons/register_button.dart';

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
      children: getButtons(isRegisterPage),
    );
  }

  List<Widget> getButtons(bool isRegisterPage) {
    if (isRegisterPage) {
      return [
        getRegisterButton(
            usernameController, emailController, passwordController),
        const SizedBox(width: 20),
        LoginButton(
          emailController: emailController,
          passwordController: passwordController,
          isRegisterPage: isRegisterPage,
        ),
      ];
    } else {
      return [
        LoginButton(
          emailController: emailController,
          passwordController: passwordController,
          isRegisterPage: isRegisterPage,
        ),
        const SizedBox(width: 20),
        getRegisterButton(
            usernameController, emailController, passwordController),
      ];
    }
  }

  RegisterButton getRegisterButton(
      usernameController, emailController, passwordController) {
    return isRegisterPage
        ? RegisterButton.register(
            usernameController: usernameController,
            emailController: emailController,
            passwordController: passwordController)
        : const RegisterButton.login();
  }
}
