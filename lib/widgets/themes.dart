import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),);
      static ThemeData darkTheme(BuildContext context) => ThemeData(
         brightness: Brightness.dark
      );
      //Colors
      static Color Creamcolor =Color(0xfff5f5f5);
      static Color Bluishcolor =Color(0xff403b58);
}