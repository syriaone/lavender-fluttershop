import 'package:flutter/material.dart';

class LavenderTheme {
  LavenderTheme._();

  static const Color bg = Color(0xFF1E1B2E);
  static const Color card = Color(0xFF2A2545);
  static const Color text = Color(0xFFFFFFFF);
  static const Color muted = Color(0xFFC7C3D9);
  static const Color primary = Color(0xFF6B5CFF);
  static const Color accent = Color(0xFFA78BFA);

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primary,
      surface: Colors.white,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
    ),
    useMaterial3: true,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      surface: card,
      background: bg,
    ),
    scaffoldBackgroundColor: bg,
    appBarTheme: const AppBarTheme(
      backgroundColor: bg,
      foregroundColor: text,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: text),
    ),
    useMaterial3: true,
  );
}


