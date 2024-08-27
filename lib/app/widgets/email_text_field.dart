import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController controller;

  const EmailTextField(
      {super.key,
      required this.controller});

  @override
  State<EmailTextField> createState() => EmailTextFieldState();
}

class EmailTextFieldState extends State<EmailTextField> {
  var passwordIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {

    var colorOnPrimaryContainer =
        Theme.of(context).colorScheme.onPrimaryContainer;

    return SizedBox(
      width: 300,
      height: 50,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: getEmailInputDecoration(colorOnPrimaryContainer),
        style: textFont(
            textStyle: TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
        controller: widget.controller,
      ),
    );
  }
}
