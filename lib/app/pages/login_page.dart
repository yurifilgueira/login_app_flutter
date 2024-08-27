import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/login_card.dart';
import 'package:login_app/app/widgets/login_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                child: const Align(
                  alignment: Alignment.center,
                  child: LoginText(),
                )),
            const LoginCard(),
          ],
        ),
      ),
    );
  }
}