
import 'package:flutter/material.dart';

class Themes {
  BuildContext? context;
  Themes({required this.context});

  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.blueAccent,
      backgroundColor: Colors.white,
    ),
    dividerColor: Colors.blue,
    canvasColor: Colors.black,
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.blue.withRed(1),
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.indigo,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.indigo,
    ),
    dividerColor: Colors.white,
    canvasColor: Colors.white,
      popupMenuTheme: const PopupMenuThemeData(
          color: Colors.indigo
      ),
  );
}