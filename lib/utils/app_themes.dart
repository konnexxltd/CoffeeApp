import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: GoogleFonts.dmSans().fontFamily,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      primarySwatch: AppColors.primaryMaterial,
      indicatorColor: Colors.black12,
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 24,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      visualDensity: VisualDensity.standard,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        splashFactory: NoSplash.splashFactory,
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 15)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      )));

  static var darkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      cardColor: Colors.grey[900]!.withOpacity(0.5),
      dialogBackgroundColor: Colors.grey[900]!.withOpacity(0.5),
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: AppColors.primaryMaterial,
      indicatorColor: Colors.white,
      canvasColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 24,
        ),
      ),
      visualDensity: VisualDensity.standard,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.grey[800]!.withOpacity(0.2),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        splashFactory: NoSplash.splashFactory,
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 15)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      )));
}
