import 'package:flutter/material.dart';

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue, // Example primary color
    // Customize other properties for light theme
    // e.g., scaffoldBackgroundColor, appBarTheme, textTheme, etc.
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.teal, // Example primary color for dark theme
    // Customize other properties for dark theme
    // e.g., scaffoldBackgroundColor, appBarTheme, textTheme, etc.
    // Ensure good contrast for readability
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade800),
    // You might want to define text styles that work well in dark mode
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white70),
      bodyMedium: TextStyle(color: Colors.white60),
      // ... other text styles
    ),
    // Customize card themes, button themes, etc.
    cardTheme: CardThemeData(color: Colors.grey.shade800),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
    ),
    // ... and so on
  );
}
