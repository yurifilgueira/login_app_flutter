import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/app_local_storage_services.dart';
import 'package:login_app/app/pages/login_page.dart';

class SaveChangesButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPasswordController;

  const SaveChangesButton({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.newPasswordController,
    required this.confirmNewPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final localStorage = await AppLocalStorageServices.getInstance();
          localStorage.clear();

          if (context.mounted) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          }
        },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onPrimaryContainer)),
        child: Text(
          'Save Changes',
          style:
              getTextStyle(Theme.of(context).colorScheme.primaryContainer, 20),
        ));
  }
}
