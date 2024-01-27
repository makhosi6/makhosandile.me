import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final baseTheme = ThemeData(brightness: Brightness.light);

// App theme
ThemeData theme = ThemeData.light(
  useMaterial3: true,
).copyWith(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: textColor,
  colorScheme: const ColorScheme.light().copyWith(
    primary: textColor,
  ),
  popupMenuTheme:
      PopupMenuThemeData(color: storyBgColor, surfaceTintColor: storyBgColor),
  textTheme: GoogleFonts.epilogueTextTheme(
    baseTheme.textTheme,
  ).apply(
    decorationColor: textColor,
    bodyColor: const Color(0xFF2D2D2D),
    displayColor: const Color(0xFF2D2D2D),
  ),
);

Color textColor = const Color(0xFF2D2D2D);
Color storyColor = const Color(0xFFF6DCE9);
Color storyBgColor = const Color(0xFF009379);
