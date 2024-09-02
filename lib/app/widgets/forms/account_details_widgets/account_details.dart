import 'package:flutter/material.dart';
import 'package:login_app/app/data/providers/globals.dart';
import 'package:login_app/app/data/services/app_local_storage_services.dart';
import 'package:login_app/app/widgets/buttons/back_to_login_screen_button.dart';
import 'package:login_app/app/widgets/buttons/save_changes_button.dart';
import 'package:login_app/app/widgets/forms/email_text_field.dart';
import 'package:login_app/app/widgets/forms/password_textfield.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmNewPasswordController =
        TextEditingController();

    final appLocalStorageServices = AppLocalStorageServices.getInstance();
    appLocalStorageServices.then((localStorage) async {
      usernameController.text = localStorage.getUsername();
      emailController.text = localStorage.getEmail();
    });

    final Color colorOnPrimaryContainer =
        Theme.of(context).colorScheme.onPrimaryContainer;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.80,
        width: double.infinity,
        child: Container(
          decoration: _getDecorationLoginContainer(context),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getUsernameTextField(
                colorOnPrimaryContainer,
                usernameController,
              ),
              const SizedBox(height: 30),
              EmailTextField(controller: emailController),
              const SizedBox(height: 30),
              PasswordTextField(
                  controller: newPasswordController, labelText: 'New Password'),
              const SizedBox(height: 30),
              PasswordTextField(
                  controller: confirmNewPasswordController,
                  labelText: 'Confirm Password'),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SaveChangesButton(
                  emailController: emailController,
                  usernameController: usernameController,
                  newPasswordController: newPasswordController,
                  confirmNewPasswordController: confirmNewPasswordController,
                ),
                const SizedBox(width: 20),
                const BackToLoginScreenButton(),
              ]),
            ],
          )),
        ),
      ),
    );
  }

  SizedBox getUsernameTextField(
      Color colorOnPrimaryContainer, TextEditingController usernameController) {
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
            labelText: 'Username',
            labelStyle: textFont(
                textStyle:
                    TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
          ),
          style: textFont(
              textStyle:
                  TextStyle(color: colorOnPrimaryContainer, fontSize: 20)),
          controller: usernameController,
        ));
  }
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
