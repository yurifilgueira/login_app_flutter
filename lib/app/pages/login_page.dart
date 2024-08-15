import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/widgets/auth_actions_widget.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passowrdController = TextEditingController();

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
        width: double.infinity,
        child: Container(
          decoration: _getDecorationLoginContainer(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginTextField(labelText: "Email", controller: emailController),
              const SizedBox(height: 30),
              LoginTextField(labelText: "Password", obscureText: true, controller: passowrdController),
              const SizedBox(height: 50),
              AuthActions(emailController: emailController, passowrdController: passowrdController,),
            ],
          ),
        ),
      ),
    );
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
}

class LoginTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  const LoginTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    required this.controller
  });

  @override
  LoginTextFieldState createState() => LoginTextFieldState();
}

class LoginTextFieldState extends State<LoginTextField> {
  
  @override
  Widget build(BuildContext context) {
    final labelText = widget.labelText;
    final obscureText = widget.obscureText;

    var coloOnPrimaryContainer =
        Theme.of(context).colorScheme.onPrimaryContainer;
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: coloOnPrimaryContainer),
          ),
          focusColor: coloOnPrimaryContainer,
          fillColor: coloOnPrimaryContainer,
          labelText: labelText,
          labelStyle: textFont(
              textStyle:
                  TextStyle(color: coloOnPrimaryContainer, fontSize: 20)),
        ),
        style: textFont(
            textStyle: TextStyle(color: coloOnPrimaryContainer, fontSize: 20)),
        controller: widget.controller,
      ),
    );
  }
}

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