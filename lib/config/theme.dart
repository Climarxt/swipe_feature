import 'package:new_feature/config/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    useMaterial3: false,
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: white),
    scaffoldBackgroundColor: Colors.white,
    primaryIconTheme: const IconThemeData(color: Colors.black),
    iconTheme: const IconThemeData(color: Colors.black),
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: const Color(0xFFE84545))
        .copyWith(background: const Color(0xFFF4F4F4))
        .copyWith(background: Colors.white),
  );
}
