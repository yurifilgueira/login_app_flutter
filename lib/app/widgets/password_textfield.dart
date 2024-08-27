import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  State<PasswordTextField> createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  var obscureText = true;
  var passwordIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    var colorOnPrimaryContainer =
        Theme.of(context).colorScheme.onPrimaryContainer;

    changePasswordVisbility() {
      setState(() {
        obscureText = !obscureText;

        if (obscureText) {
          passwordIcon = Icons.visibility_off;
        } else {
          passwordIcon = Icons.visibility;
        }
      });
    }

    return SizedBox(
      width: 300,
      height: 50,
      child: TextFormField(
        obscureText: obscureText,
        decoration: getPasswordInputDecoration(
            colorOnPrimaryContainer, passwordIcon, changePasswordVisbility),
        style: textFont(
            textStyle: TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
        controller: widget.controller,
      ),
    );
  }
}
