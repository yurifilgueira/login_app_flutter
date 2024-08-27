import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Login",
        style: textFont(
            textStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 100)));
  }
}