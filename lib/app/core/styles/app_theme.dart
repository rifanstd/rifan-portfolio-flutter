import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/core/styles/app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeMode get light => ThemeMode.light;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.primary,
      ),
      scaffoldBackgroundColor: AppColor.background,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: AppColor.background,
        backgroundColor: AppColor.background,
        centerTitle: false,
      ),
      textTheme: GoogleFonts.nunitoTextTheme(),
    );
  }
}
