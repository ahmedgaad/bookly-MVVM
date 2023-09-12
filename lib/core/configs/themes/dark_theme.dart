import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorUtils.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorUtils.primary,
      elevation: 0.0,
    ),
  );
}
