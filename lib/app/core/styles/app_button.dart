import 'package:flutter/material.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';

class AppButton {
  AppButton._();

  static ButtonStyle filledPrimary(BuildContext context) => FilledButton.styleFrom(
        backgroundColor: AppColor.primary,
        padding: EdgeInsets.symmetric(vertical: ScreenUtils.isLargeScreen(context) ? 24 : 16, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      );

  static ButtonStyle smallFilledPrimary(BuildContext context) => FilledButton.styleFrom(
        backgroundColor: AppColor.primary,
        padding: EdgeInsets.symmetric(vertical: ScreenUtils.isLargeScreen(context) ? 16 : 18, horizontal: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      );
}
