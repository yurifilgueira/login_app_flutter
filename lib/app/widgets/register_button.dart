import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).colorScheme;

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
