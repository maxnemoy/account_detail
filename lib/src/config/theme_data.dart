import 'package:flutter/material.dart';

class BrandTheme {
  static const ColorScheme defaultColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 0, 0, 0),
      secondary: Color.fromARGB(255, 14, 14, 16),
      surface: Color.fromARGB(255, 204, 204, 204),
      background: Color.fromARGB(255, 255, 255, 255),
      error: Color.fromARGB(255, 196, 43, 28),
      onBackground: Color.fromARGB(255, 0, 0, 0),
      onError: Color.fromARGB(255, 255, 255, 255),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      onSecondary: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 0, 0, 0),
    );

  

  static ThemeData defaultTheme = ThemeData(
    colorScheme: defaultColorScheme,
    textTheme:  TextTheme(
      bodyLarge: TextStyle(
        color: defaultColorScheme.onBackground,
        fontSize: 20,
        height: 1
      ),
      bodyMedium: TextStyle(
        color: defaultColorScheme.onBackground,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: defaultColorScheme.surface 
      ),
    )
  );
}
