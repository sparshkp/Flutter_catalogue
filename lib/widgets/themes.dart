import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamcolor,
        buttonTheme: ButtonThemeData(
          buttonColor: bluishcolor,
        ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ),);
      static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcolor,
        appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ), 
      );
      //Colors
      static Color creamcolor =Color(0xfff5f5f5);
      static Color darkcolor =Vx.gray800;
      static Color bluishcolor =Color(0xff403b58);
      static Color lightBluishcolor = Vx.indigo500;

}