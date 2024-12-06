import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: Colors.blue,
      hintColor: Colors.green,
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 16, color: Colors.black),  // Remplacé bodyText1 par bodyLarge
        bodyMedium: TextStyle(fontSize: 14, color: Colors.grey[600]),  // Remplacé bodyText2 par bodyMedium
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  // Remplacé headline1 par titleLarge
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,
        ),
      ),
      cardColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
