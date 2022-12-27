import 'package:flutter/material.dart';

class CustomTheme {
  static const Color grey = Color(0xFFDFDFDF);
  static const Color yellow = Color(0xFFFFDB47);

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
