import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class LoginTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const LoginTextField(
      {super.key,
      required this.labelText,
      required this.controller});

  @override
  State<LoginTextField> createState() => LoginTextFieldState();
}

class LoginTextFieldState extends State<LoginTextField> {
  var passwordIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {

    var colorOnPrimaryContainer =
        Theme.of(context).colorScheme.onPrimaryContainer;

    final labelText = widget.labelText;

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
          labelText: labelText,
          labelStyle: textFont(
              textStyle:
                  TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
        ),
        style: textFont(
            textStyle: TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
        controller: widget.controller,
      ),
    );
  }
}
