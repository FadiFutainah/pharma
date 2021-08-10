import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

final ThemeData primaryTheme = ThemeData(
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
    ),
  ),
  accentColor: Colors.grey,
  primaryColor: Color(0xffffb52d),
);
