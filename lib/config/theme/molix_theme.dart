import 'package:flutter/material.dart';

abstract class MolixTheme {
  const MolixTheme();

  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        primaryColor: primaryColor,
        colorScheme: colorScheme,
        cardTheme: cardTheme,
        filledButtonTheme: filledButtonTheme,
        inputDecorationTheme: inputDecorationTheme,
      );

  Color get scaffoldBackgroundColor;
  Color get primaryColor;
  ColorScheme get colorScheme;
  CardTheme get cardTheme;
  FilledButtonThemeData get filledButtonTheme;
  InputDecorationTheme get inputDecorationTheme;
}
