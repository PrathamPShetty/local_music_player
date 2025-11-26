import 'package:flutter/material.dart';

class AppThemes {
  static final Map<String, ThemeData> themes = {

    'red': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.red.shade50,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.red,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.redAccent),
        titleLarge: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    'purple': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.purple.shade50,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.purple,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.purpleAccent),
        titleLarge: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    'green': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green.shade50,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
      ),
    ),



  };
}
