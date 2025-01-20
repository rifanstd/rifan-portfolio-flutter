import 'package:flutter/material.dart';
import 'package:portfolio/app/core/styles/app_color.dart';

class AppText {
  AppText._();

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
}
