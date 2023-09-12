import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorUtils.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorUtils.primary,
      elevation: 0.0,
    ),
  );
}
