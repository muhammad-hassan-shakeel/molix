import 'package:flutter/material.dart';
import 'package:molix/config/theme/molix_theme.dart';

final _primaryColor = Colors.red.shade400;

class LightTheme extends MolixTheme {
  const LightTheme();

  @override
  CardTheme get cardTheme => CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  @override
  ColorScheme get colorScheme => ColorScheme.light(primary: _primaryColor);

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
  Color get scaffoldBackgroundColor => Colors.white;

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );
}
