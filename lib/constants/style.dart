import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const headline1 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Color(0xff14213d),
);

const headline2 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Color(0xff14213d),
);

const mediumMargin = SizedBox(
  height: 12,
);

final themeData = ThemeData(
  primarySwatch: Colors.indigo,
  fontFamily: GoogleFonts.openSans().fontFamily,
  scaffoldBackgroundColor: const Color(0xffBDC3C7),
  cardTheme: const CardTheme(
    color: Color(0xffB2DFDB),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xff14213d),
    ),
  ),
);
