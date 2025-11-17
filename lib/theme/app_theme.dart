import 'package:flutter/material.dart';

class AppTheme { //Klass för att hantera tema
  static const Color seedColor = Colors.blueAccent; //grundfärg för temat

  // Ljust tema
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'serif', //std font för light mode
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor), //grundfärg för temat
      useMaterial3: true,
    );
  }

  // (Valfritt) mörkt tema också, om du vill bygga vidare
  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'monospace', //std font för dark mode
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
  }
}