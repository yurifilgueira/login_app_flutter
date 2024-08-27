import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/auth_actions_widget.dart';
import 'package:login_app/app/widgets/email_text_field.dart';
import 'package:login_app/app/widgets/password_textfield.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
        width: double.infinity,
        child: Container(
          decoration: _getDecorationLoginContainer(context),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailTextField(controller: emailController),
                const SizedBox(height: 30),
                PasswordTextField(controller: passwordController),
                const SizedBox(height: 50),
                AuthActions.login(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration _getDecorationLoginContainer(BuildContext context) {
  return const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40),
      topRight: Radius.circular(40),
    ),
    color: Color.fromRGBO(240, 247, 238, 1),
  );
}
