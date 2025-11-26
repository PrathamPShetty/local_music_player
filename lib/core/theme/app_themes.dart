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


    'green': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green.shade50,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.green.shade900),
        bodyMedium: TextStyle(color: Colors.green.shade800),
        titleLarge: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
      ),
    ),


    'blue': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.blue.shade50,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.blue.shade900),
        bodyMedium: TextStyle(color: Colors.blue.shade800),
        titleLarge: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
    ),


    'yellow': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.yellow.shade700,
      scaffoldBackgroundColor: Colors.yellow.shade50,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.yellow.shade700,
        foregroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.yellow.shade900),
        bodyMedium: TextStyle(color: Colors.yellow.shade800),
        titleLarge: TextStyle(color: Colors.yellow.shade900, fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.yellow.shade700,
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


    'black': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.grey.shade300),
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey.shade900,
      ),
    ),


    'white': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.black54),
        titleLarge: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
    ),

    'orange': ThemeData(
      useMaterial3: true,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.orange.shade50,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.orange.shade900),
        bodyMedium: TextStyle(color: Colors.orange.shade800),
        titleLarge: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.bold),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.orange,
      ),
    ),
  };
}
