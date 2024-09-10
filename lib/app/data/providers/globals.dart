import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/app/pages/login_page.dart';

const textFont = GoogleFonts.bebasNeue;

TextStyle getTextStyle(Color color, double fontSize) {
  return textFont(textStyle: TextStyle(color: color, fontSize: fontSize));
}

getColorScheme() {
  const primary = Color.fromRGBO(116, 114, 116, 1);
  const onPrimary = Color.fromRGBO(253, 236, 239, 1);
  const primaryContainer = Color.fromRGBO(240, 247, 238, 1);
  const onPrimaryContainer = Color.fromRGBO(93, 115, 126, 1);
  const secondary = Color.fromRGBO(220, 168, 182, 1);
  const errorColor = Colors.red;
  const onErrorColor = Colors.white;

  return const ColorScheme(
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onPrimary,
    brightness: Brightness.dark,
    error: errorColor,
    onError: onErrorColor,
    surface: Colors.black,
    onSurface: onPrimary,
  );
}

getEmailInputDecoration(color) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color),
    ),
    focusColor: color,
    fillColor: color,
    hoverColor: color,
    labelText: 'Email',
    labelStyle: textFont(textStyle: TextStyle(color: color, fontSize: 20)),
  );
}

getPasswordInputDecoration(
    color, labelText, passwordIcon, changePasswordVisbility) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color),
    ),
    focusColor: color,
    fillColor: color,
    hoverColor: color,
    labelText: labelText,
    labelStyle: textFont(textStyle: TextStyle(color: color, fontSize: 20)),
    suffixIcon: IconButton(
      icon: Icon(passwordIcon, color: color),
      onPressed: () {
        changePasswordVisbility();
      },
    ),
  );
}

void showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        content: Text(
          message,
          style: getTextStyle(
              Theme.of(context).colorScheme.onPrimaryContainer, 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Ok',
              style: getTextStyle(
                  Theme.of(context).colorScheme.onPrimaryContainer, 15),
            ),
          ),
        ],
      );
    },
  );
}

void showRegisterSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        content: Text(
          message,
          style: getTextStyle(
              Theme.of(context).colorScheme.onPrimaryContainer, 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text(
              'Ok',
              style: getTextStyle(
                  Theme.of(context).colorScheme.onPrimaryContainer, 15),
            ),
          ),
        ],
      );
    },
  );
}

void showSessionExpiredAlertDialog(BuildContext context, clearStorage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        content: Text(
          'Session expired',
          style: getTextStyle(
              Theme.of(context).colorScheme.onPrimaryContainer, 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              clearStorage();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Text(
              'Ok',
              style: getTextStyle(
                  Theme.of(context).colorScheme.onPrimaryContainer, 15),
            ),
          ),
        ],
      );
    },
  );
}
