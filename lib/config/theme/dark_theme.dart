import 'package:flutter/material.dart';

import 'molix_theme.dart';

final _primaryColor = Colors.red.shade400;

class DarkTheme extends MolixTheme {
  const DarkTheme();

  @override
  CardTheme get cardTheme => CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  @override
  ColorScheme get colorScheme => ColorScheme.dark(primary: _primaryColor);

  @override
  FilledButtonThemeData get filledButtonTheme => FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );

  @override
  Color get primaryColor => _primaryColor;

  @override
  Color get scaffoldBackgroundColor => Colors.black;

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );
}
