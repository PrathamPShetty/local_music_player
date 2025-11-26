import 'package:flutter/material.dart';

class AppThemes {
  static final Map<String, ThemeData> themes = {

    'red': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.red.shade50,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.red.shade900),
        bodyMedium: TextStyle(color: Colors.red.shade800),
        titleLarge: TextStyle(color: Colors.red.shade900, fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.red,
      ),
    ),






    'purple': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.purple.shade50,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.purple.shade900),
        bodyMedium: TextStyle(color: Colors.purple.shade800),
        titleLarge: TextStyle(color: Colors.purple.shade900, fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.purple,
      ),
    ),




  };
}
