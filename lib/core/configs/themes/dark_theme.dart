import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorUtils.primary,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorUtils.primary,
      elevation: 0.0,
    ),
  );
}
