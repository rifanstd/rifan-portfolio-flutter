import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/core/styles/app_color.dart';

class AppText {
  AppText._();

  static TextTheme get defaultTextTheme {
    TextStyle textStyle = GoogleFonts.nunito(color: AppColor.primary);

    return GoogleFonts.nunitoTextTheme().copyWith(
      bodyLarge: textStyle,
      bodyMedium: textStyle,
      bodySmall: textStyle,
      displayLarge: textStyle,
      displayMedium: textStyle,
      displaySmall: textStyle,
      headlineLarge: textStyle,
      headlineMedium: textStyle,
      headlineSmall: textStyle,
      labelLarge: textStyle,
      labelMedium: textStyle,
      labelSmall: textStyle,
      titleLarge: textStyle,
      titleMedium: textStyle,
      titleSmall: textStyle,
    );
  }

  static TextStyle get navItemStyle {
    return const TextStyle(fontWeight: FontWeight.bold);
  }

  static TextStyle get jumbotronTitle {
    return const TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.w900,
      color: AppColor.primary,
    );
  }

  static TextStyle get regular20 {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle get bold20 {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get bold18 {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get bold16 {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get bold14 {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get bold12 {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get bold12Grey {
    return const TextStyle(
      color: Colors.grey,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get sectionTitle {
    return const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get sectionSubtitle {
    return const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
  }
}
