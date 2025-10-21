import 'package:flutter/material.dart';
import 'package:maya_flutter_exam/config/constants.dart' as color_constants;

class AppTheme {
  // constuctor
  const AppTheme({required this.context});

  final BuildContext context;

  // Theme Data
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    textTheme: _textTheme,
    colorSchemeSeed: color_constants.primary,
  );

  // ================= Costumize Text Style ================= //
  TextTheme get _textTheme => const TextTheme(
    // ================= Headings ================= //
    headlineLarge: TextStyle(fontFamily: 'Poppins-Regular'),

    headlineMedium: TextStyle(fontFamily: 'Poppins-Regular'),

    headlineSmall: TextStyle(fontFamily: 'Poppins-Regular'),

    // ================= Titles ================= //
    titleLarge: TextStyle(fontFamily: 'Poppins-SemiBold'),

    titleMedium: TextStyle(fontFamily: 'Poppins-SemiBold'),

    titleSmall: TextStyle(fontFamily: 'Poppins-SemiBold'),

    // ================= Bodies ================= //
    bodyLarge: TextStyle(fontFamily: 'Poppins-SemiBold'),

    bodyMedium: TextStyle(fontFamily: 'Poppins-SemiBold'),

    bodySmall: TextStyle(fontFamily: 'Poppins-SemiBold'),

    // ================= Labels ================= //
    labelLarge: TextStyle(fontFamily: 'Poppins-Regular'),

    labelMedium: TextStyle(fontFamily: 'Poppins-Regular'),

    labelSmall: TextStyle(fontFamily: 'Poppins-Regular'),
  );
}
