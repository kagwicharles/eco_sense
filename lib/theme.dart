import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static var theme = ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: Colors.yellow[50],
      navigationBarTheme: const NavigationBarThemeData(
          labelTextStyle:
              WidgetStatePropertyAll(TextStyle(color: Colors.white))));
}
