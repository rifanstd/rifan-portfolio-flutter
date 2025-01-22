import 'package:flutter/material.dart';
import 'package:portfolio/app/core/styles/app_text.dart';

class UIUtils {
  UIUtils._();

  static Widget verticalSpace(double height) => SizedBox(height: height);
  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static List<Widget> createSectionHeader({
    required String title,
    required String subtitle,
  }) {
    return <Widget>[
      Center(
        child: Text(
          title,
          style: AppText.sectionTitle,
        ),
      ),
      Center(
        child: Text(
          subtitle,
          style: AppText.sectionSubtitle,
        ),
      )
    ];
  }
}
