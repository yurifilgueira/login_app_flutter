import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/widgets/buttons/auth_actions_widget.dart';
import 'package:login_app/app/widgets/forms/email_text_field.dart';
import 'package:login_app/app/widgets/forms/password_textfield.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();

    final Color colorOnPrimaryContainer =
        Theme.of(context).colorScheme.onPrimaryContainer;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.80,
        width: double.infinity,
        child: Container(
          decoration: _getDecorationLoginContainer(context),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getUsernameTextField(
                colorOnPrimaryContainer,
                usernameController,
              ),
              const SizedBox(height: 30),
              EmailTextField(controller: emailController),
              const SizedBox(height: 30),
              PasswordTextField(controller: passwordController,labelText: 'Password'),
              const SizedBox(height: 50),
              AuthActions.register(
                usernameController: usernameController,
                emailController: emailController,
                passwordController: passwordController,
              ),
            ],
          )),
        ),
      ),
    );
  }

  SizedBox getUsernameTextField(
      Color colorOnPrimaryContainer, TextEditingController usernameController) {
    return SizedBox(
        width: 300,
        height: 50,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorOnPrimaryContainer),
            ),
            focusColor: colorOnPrimaryContainer,
            fillColor: colorOnPrimaryContainer,
            hoverColor: colorOnPrimaryContainer,
            labelText: 'Username',
            labelStyle: textFont(
                textStyle:
                    TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
          ),
          style: textFont(
              textStyle:
                  TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
          controller: usernameController,
        ));
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
