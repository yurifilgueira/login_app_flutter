import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/app/data/models/login_response.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/app_local_storage_services.dart';
import 'package:login_app/app/data/services/login_app_api_services.dart';

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
          final dataIsValid = await verifyData(
              emailController,
              usernameController,
              newPasswordController,
              confirmNewPasswordController,
              context);

          if (dataIsValid) {
            saveChanges(emailController, usernameController,
                newPasswordController, confirmNewPasswordController);

            if (context.mounted) {
              showAlertDialog(context, 'Changes made successfully');
            }
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

void clearStorage() async {
  final localStorage = await AppLocalStorageServices.getInstance();
  const flutterSecureStorage = FlutterSecureStorage();
  flutterSecureStorage.delete(key: 'accessToken');
  flutterSecureStorage.delete(key: 'refreshToken');
  localStorage.clear();
}

void saveChanges(
    TextEditingController emailController,
    TextEditingController usernameController,
    TextEditingController newPasswordController,
    TextEditingController confirmNewPasswordController) async {
  final localStorage = await AppLocalStorageServices.getInstance();
  const flutterSecureStorage = FlutterSecureStorage();
  final loginServies = LoginAppApiServices();

  final id =
      int.tryParse(await flutterSecureStorage.read(key: 'userId') ?? '-1');

  if (id == -1 || id == null) {
    throw Exception('Invalid id');
  }

  final username = usernameController.text;
  final email = emailController.text;
  final newPassowrd = newPasswordController.text;
  final confirmNewPassowrd = confirmNewPasswordController.text;

  final loginResponse = await loginServies.updateUserInfo(
      id, username, email, newPassowrd, confirmNewPassowrd);

  saveUserData(loginResponse, flutterSecureStorage, localStorage);
  clearPasswordFields(newPasswordController, confirmNewPasswordController);
}

void saveUserData(
    LoginResponse loginResponse,
    FlutterSecureStorage flutterSecureStorage,
    AppLocalStorageServices localStorage) {
  clearStorage();

  final accessToken = loginResponse.tokenResponse.accessToken;
  final refreshToken = loginResponse.tokenResponse.refreshToken;
  final userId = loginResponse.user.id.toString();

  flutterSecureStorage.write(key: 'accessToken', value: accessToken);
  flutterSecureStorage.write(key: 'refreshToken', value: refreshToken);
  flutterSecureStorage.write(key: 'userId', value: userId);

  localStorage.setUsername(loginResponse.user.name);
  localStorage.setEmail(loginResponse.user.email);
}

void clearPasswordFields(TextEditingController newPasswordController,
    TextEditingController confirmNewPasswordController) {
  newPasswordController.clear();
  confirmNewPasswordController.clear();
}

Future<bool> verifyData(
    TextEditingController emailController,
    TextEditingController usernameController,
    TextEditingController newPasswordController,
    TextEditingController confirmNewPasswordController,
    BuildContext context) async {
  final localStorage = await AppLocalStorageServices.getInstance();

  final newPassowrd = newPasswordController.text;
  final confirmNewPassword = confirmNewPasswordController.text;

  if (newPassowrd != confirmNewPassword) {
    if (context.mounted) {
      showAlertDialog(context, "The passwords must correspond");
    }
    return false;
  }

  final email = emailController.text;
  final username = usernameController.text;

  if (email == localStorage.getEmail() &&
      username == localStorage.getUsername() && newPassowrd.isEmpty) {
    if (context.mounted) {
      showAlertDialog(context, "There are no changes to save");
    }
    return false;
  }

  return true;
}
