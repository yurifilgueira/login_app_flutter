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
          final snackBar = _getRegisterSnackBar(textTheme, context);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(textTheme.onPrimaryContainer)),
        child: Text(
          "Register",
          style: getTextStyle(textTheme.primaryContainer, 18),
        ));
  }

  SnackBar _getRegisterSnackBar(ColorScheme textTheme, BuildContext context) {
    return SnackBar(
      content: Text("Registered successfully.",
          style: getTextStyle(textTheme.primaryContainer, 20)),
      backgroundColor:
          textTheme.onPrimaryContainer.withAlpha(200),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
    );
  }
}
