import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/enums/url_enum.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class Footer extends GetView<HomeController> {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border(
          top: BorderSide(
            color: AppColor.black.withOpacity(.2),
            width: .4,
          ),
        ),
      ),
      child: Column(
        children: [
          ...UIUtils.createSectionHeader(
            title: "Rifan Setiadi",
            subtitle: "Mobile Developer",
          ),
          UIUtils.verticalSpace(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async => controller.openSocialMedia(UrlEnum.linkedin),
                child: SvgPicture.asset(
                  AppIcons.linkedin,
                  width: 24,
                ),
              ),
              UIUtils.horizontalSpace(24),
              InkWell(
                onTap: () async => controller.openSocialMedia(UrlEnum.github),
                child: SvgPicture.asset(
                  AppIcons.github,
                  width: 24,
                ),
              ),
              UIUtils.horizontalSpace(24),
              InkWell(
                onTap: () async =>
                    controller.openSocialMedia(UrlEnum.instagram),
                child: SvgPicture.asset(
                  AppIcons.instagram,
                  width: 24,
                ),
              ),
            ],
          ),
          UIUtils.verticalSpace(40),
          const Text(
            "Copyright © 2025 Rifan Setiadi. All rights reserved.",
            textAlign: TextAlign.center,
          ),
          const Text(
            "Made with Flutter.",
            textAlign: TextAlign.center,
          ),
          //
          ScreenUtils.isSmallScreen(context)
              ? UIUtils.verticalSpace(80)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
