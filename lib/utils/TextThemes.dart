import 'package:flutter/material.dart';

class FontFamilies {
  final String? displayFont;
  final String? textFont;

  FontFamilies(this.displayFont, this.textFont);
}

FontFamilies fontfamilies = FontFamilies("SF Pro Display", "SF Pro Text");

TextTheme sfProTextTheme = TextTheme(
  displayMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: fontfamilies.displayFont,
    height: 1.33,
  ),
  bodyMedium: TextStyle(
    fontFamily: fontfamilies.textFont,
    height: 1.25,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.4,
  ),
  titleLarge: TextStyle(
    fontFamily: fontfamilies.textFont,
    letterSpacing: -0.7,
    height: 1.2,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  labelLarge: TextStyle(
    fontFamily: fontfamilies.textFont,
    letterSpacing: -0.42,
    height: 1.28571,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: const Color.fromRGBO(0, 0, 0, 0.55),
  ),
  labelMedium: TextStyle(
    fontFamily: fontfamilies.textFont,
    fontSize: 14,
    letterSpacing: -0.41,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    height: 1.28571,
  ),
  labelSmall: TextStyle(
    fontFamily: fontfamilies.textFont,
    fontSize: 14,
    letterSpacing: -0.41,
    fontWeight: FontWeight.normal,
    color: const Color.fromRGBO(0, 0, 0, 0.55),
    height: 1.28571,
  ),
);
