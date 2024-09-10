import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/app_local_storage_services.dart';
import 'package:login_app/app/pages/login_page.dart';

class BackToLoginScreenButton extends StatelessWidget {
  const BackToLoginScreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final localStorage = await AppLocalStorageServices.getInstance();
          const flutterSecureStorage = FlutterSecureStorage();

          localStorage.clear();
          flutterSecureStorage.deleteAll();

          if (context.mounted) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          }
        },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onPrimaryContainer)),
        child: Text(
          "Back",
          style:
              getTextStyle(Theme.of(context).colorScheme.primaryContainer, 20),
        ));
  }
}
