import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/user_service.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passowrdController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passowrdController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          try {
          final loginAppApiServices = LoginAppApiServices();
        
          final email = emailController.text;
          final password = passowrdController.text.toLowerCase();

          loginAppApiServices.signin(email, password).then((token) {

            if (token != null) {
              final username = token.username;
        
              if (username != null) {
                final snackBar = SnackBar(
                  content: Text(username,
                      style: getTextStyle(
                          Theme.of(context)
                              .colorScheme
                              .primaryContainer,
                          20)),
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withAlpha(200),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0)),
                );
                ScaffoldMessenger.of(context)
                    .showSnackBar(snackBar);
              }
            }
             else {
              throw('Invalid email or password');
            }
          }).catchError((error) {
            throw('Request error: $error');
          });
          }
          catch(error) {
            throw('Error: $error');
          }
        },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer)),
        child: Text(
          "LogIn",
          style: getTextStyle(
              Theme.of(context).colorScheme.primaryContainer, 20),
        ));
  }
}

TextStyle getTextStyle(Color color, double fontSize) {
  return textFont(
      textStyle: TextStyle(color: color, fontSize: fontSize));
}