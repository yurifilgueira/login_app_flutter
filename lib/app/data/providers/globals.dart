import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const textFont = GoogleFonts.bebasNeue;

TextStyle getTextStyle(Color color, double fontSize) {
  return textFont(
      textStyle: TextStyle(color: color, fontSize: fontSize));
}