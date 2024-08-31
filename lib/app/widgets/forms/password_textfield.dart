import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final labelText;

  const PasswordTextField({super.key, required this.controller, required this.labelText});

  @override
  State<PasswordTextField> createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  var obscureText = true;
  var passwordIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    var labelText = widget.labelText;
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
            colorOnPrimaryContainer, labelText, passwordIcon, changePasswordVisbility),
        style: textFont(
            textStyle: TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
        controller: widget.controller,
      ),
    );
  }
}
