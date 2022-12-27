import 'package:flutter/material.dart';

class CustomTheme {
  static const Color grey = Color(0xFFDFDFDF);
  static const Color yellow = Color(0xFFFFDB47);
  static const cardShadow = [BoxShadow(color: grey, blurRadius: 6, spreadRadius: 4, offset: Offset(0, 2))];

  static ThemeData getTheme() {
    Map<String, double> fontSize = {
      "sm": 14,
      "md": 18,
      "lg": 24,
    };

    return ThemeData(
      primaryColor: yellow,

      // Define the default theme font family
      fontFamily: "DMSans",

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        toolbarHeight: 70,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: "DMSans",
          fontSize: fontSize["lg"],
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
        ),
      ),

      tabBarTheme: const TabBarTheme(
        labelColor: yellow,
        unselectedLabelColor: Colors.black,
      ),

      textTheme: TextTheme(
        headlineLarge: TextStyle(color: Colors.black, fontSize: fontSize["lg"], fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: Colors.black, fontSize: fontSize["md"], fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: Colors.black, fontSize: fontSize["sm"], fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontSize: fontSize["sm"], fontWeight: FontWeight.normal),
        titleSmall: TextStyle(fontSize: fontSize["sm"], fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }
}
