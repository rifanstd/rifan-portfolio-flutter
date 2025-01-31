import 'package:flutter/material.dart';

class ScreenUtils {
  ScreenUtils._();

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isLargeScreen(BuildContext context) {
    return getScreenWidth(context) > 1024;
  }

  static bool isMediumScreen(BuildContext context) {
    final width = getScreenWidth(context);
    return width > 600 && width <= 800;
  }

  static bool isSmallScreen(BuildContext context) {
    return getScreenWidth(context) <= 600;
  }

  static double getHorizontalPadding(BuildContext context) {
    if (isLargeScreen(context)) {
      return 200.0;
    } else if (isMediumScreen(context)) {
      return 50.0;
    } else {
      return 24.0;
    }
  }
}
