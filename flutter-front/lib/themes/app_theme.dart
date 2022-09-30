import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get basic => ThemeData(
    fontFamily: Font.poppins,
  );
  static const Color primary = Colors.deepPurple;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.deepPurple,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.grey[300],
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo, elevation: 0),
      iconTheme: const IconThemeData());

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
      
}

class Font {
  static var poppins;
}
