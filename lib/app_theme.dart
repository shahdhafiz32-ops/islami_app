import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarTheme(
      backgroundColor: black,
      titleTextStyle: TextStyle(fontSize: 20,fontWeight: .bold, color: primaryColor),
      foregroundColor: primaryColor ,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: black,
      showUnselectedLabels: false,
      backgroundColor: primaryColor,
      type: .fixed
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: .w500,
        color: white.withValues(alpha: 0.6),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryColor)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor)
      ),
      filled: true,
      fillColor: black.withValues(alpha: 0.7),
    ),
    textTheme: TextTheme(
       headlineSmall: TextStyle(
         fontSize: 24,
         fontWeight: .bold,
         color: black
       ),
        titleMedium: TextStyle(
         fontSize: 16,
         fontWeight: .bold,
         color: white
       ),
        titleSmall: TextStyle(
         fontSize: 14,
         fontWeight: .bold,
         color: white
       )
    )
  );
}