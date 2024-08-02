import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xff411900);
  static const secondaryColor = Colors.yellow;

  static var theme = ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      scaffoldBackgroundColor: Colors.yellow[50],
      navigationBarTheme: const NavigationBarThemeData(
          labelTextStyle:
              WidgetStatePropertyAll(TextStyle(color: Colors.white))));
}
