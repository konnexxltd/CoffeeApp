import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xFF4064d0);
  static String primaryString = "#4064d0";
  static Color accent = const Color (0xFF423121);
  static const MaterialColor primaryMaterial = MaterialColor(
    0xFF4064d0,
    <int, Color>{
      50: Color(0xFFe6e6ff),
      100: Color(0xFFb3b3ff),
      200: Color(0xFF8080ff),
      300: Color(0xFF4d4dff),
      400: Color(0xFF1a1aff),
      500: Color(0xFF0000ff),
      600: Color(0xFF0000e6),
      700: Color(0xFF0000cc),
      800: Color(0xFF0000b3),
      900: Color(0xFF000099),
    },
  );
  static Color white = Colors.white;
  static Color green = CupertinoColors.systemGreen;
  static Color grey = CupertinoColors.inactiveGray;
  static var red = CupertinoColors.destructiveRed;
}
