import 'package:flutter/material.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal();
  // Light Mode Text Theme
  static TextTheme lightTextTheme = ThemeData.light().textTheme.copyWith(
        displayLarge:
            const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        displaySmall:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        headlineMedium:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        headlineSmall:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        titleLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        titleMedium: const TextStyle(fontSize: 14),
        titleSmall: const TextStyle(fontSize: 12),
        bodyLarge: const TextStyle(fontSize: 16),
        bodyMedium: const TextStyle(fontSize: 14),
        bodySmall: const TextStyle(fontSize: 12),
        labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        labelSmall: const TextStyle(fontSize: 10),
      );

// Dark Mode Text Theme
  static TextTheme darkTextTheme = ThemeData.dark().textTheme.copyWith(
        displayLarge: const TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        displaySmall: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        headlineSmall: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        titleLarge: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: const TextStyle(fontSize: 14, color: Colors.white),
        titleSmall: const TextStyle(fontSize: 12, color: Colors.white),
        bodyLarge: const TextStyle(fontSize: 16, color: Colors.white),
        bodyMedium: const TextStyle(fontSize: 14, color: Colors.white),
        bodySmall: const TextStyle(fontSize: 12, color: Colors.white),
        labelLarge: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        labelSmall: const TextStyle(fontSize: 10, color: Colors.white),
      );
  // Light Mode Theme
  ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF2196F3),
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: lightTextTheme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
    ),
  );

// Dark Mode Theme
  ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(),
      primaryColor: Colors.indigo,
      scaffoldBackgroundColor: Colors.grey[900],
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.indigo,
      ),
      textTheme: darkTextTheme);
}
