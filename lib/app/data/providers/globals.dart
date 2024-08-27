import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
