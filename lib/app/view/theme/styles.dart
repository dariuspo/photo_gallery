import 'package:flutter/material.dart';

class Styles {
  static const kColor = Color(0xFFff8db2);

  static ThemeData theme(Brightness brightness, BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: kColor,
        brightness: brightness,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
