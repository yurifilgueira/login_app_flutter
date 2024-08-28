import 'package:flutter/material.dart';
import 'package:login_app/app/widgets/forms/register_widgets/register_card.dart';
import 'package:login_app/app/widgets/title_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: const Align(
                  alignment: Alignment.center,
                  child: TitleWidget(title: "Register"),
                )),
            const RegisterCard(),
          ],
        ),
      ),
    );
  }
}