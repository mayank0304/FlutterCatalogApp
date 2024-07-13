import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mytheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: darkBluishColor,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: creamColor,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        accentColor: darkBluishColor,
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.white,
        elevation: 0.0,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primaryColor: bluishColor,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
        accentColor: creamColor,
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        color: Colors.white,
        elevation: 0.0,
      ));

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color bluishColor = Vx.indigo500;
}
