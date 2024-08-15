import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();
  static final lightTheme = ThemeData(
    fontFamily: 'Glory',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.black),
    ),
  );
  static final darkTheme = ThemeData();
}
