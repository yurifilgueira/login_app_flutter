import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/app_local_storage_services.dart';
import 'package:login_app/app/data/services/login_app_api_services.dart';

class LoginActionButton extends StatelessWidget {
  const LoginActionButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => login(context),
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onPrimaryContainer)),
        child: Text(
          "LogIn",
          style:
              getTextStyle(Theme.of(context).colorScheme.primaryContainer, 20),
        ));
  }

  void login(BuildContext context) async {
    try {
      final loginAppApiServices = LoginAppApiServices();

      final email = emailController.text.toLowerCase();
      final password = passwordController.text.toLowerCase();

      // Aguarda o resultado da autenticação
      final loginResponse = await loginAppApiServices.signin(email, password);

      final localStorage = await AppLocalStorageServices.getInstance();

      final username = loginResponse.user.name;

      await localStorage.setUsername(username);
      await localStorage.setEmail(email);

      // Navega para a próxima tela
      Navigator.pushReplacementNamed(context, '/profile');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ocorreu um erro: $error'),
        ),
      );
    }
  }
}
