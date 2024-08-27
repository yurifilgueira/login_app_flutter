import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Register",
        style: textFont(
            textStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 100)));
  }
}