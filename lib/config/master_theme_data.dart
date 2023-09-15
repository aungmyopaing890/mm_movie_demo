import 'package:flutter/material.dart';
import '../core/constant/dimesions.dart';
import 'master_config.dart';

ThemeData themeData(ThemeData baseTheme) {
  return baseTheme.copyWith(
      textTheme: TextTheme(
          displayLarge: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family),
          displayMedium: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family),
          displaySmall: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family),
          headlineMedium: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: MasterConfig.default_font_family,
              fontWeight: FontWeight.w600),
          headlineSmall: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: MasterConfig.default_font_family,
              fontWeight: FontWeight.w600),
          titleLarge: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: MasterConfig.default_font_family),
          titleMedium: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family,
              fontWeight: FontWeight.bold),
          titleSmall: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family,
              fontWeight: FontWeight.normal),
          bodyLarge: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family,
              fontWeight: FontWeight.w400),
          bodyMedium: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family,
              fontWeight: FontWeight.bold),
          labelLarge: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family),
          bodySmall: const TextStyle(
              color: Colors.black,
              fontFamily: MasterConfig.default_font_family),
          labelSmall: TextStyle(
              fontSize: Dimesion.font12,
              fontWeight: FontWeight.w400,
              color: Colors.black)),
      iconTheme: const IconThemeData(color: Colors.black),
      appBarTheme:
          const AppBarTheme(color: Colors.black)); //coreBackgroundColor));
}
