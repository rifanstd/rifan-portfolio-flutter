import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class BottomMenu extends GetView<HomeController> {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: AppColor.background,
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(.2),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: SvgPicture.asset(
                AppIcons.logo,
                width: 80,
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  _showMenu(context);
                },
                child: SvgPicture.asset(
                  AppIcons.dashboard,
                  width: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showMenu(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      constraints: BoxConstraints(
        minWidth: Get.width,
      ),
      backgroundColor: AppColor.background,
      shape: const BeveledRectangleBorder(),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColor.background,
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
        ),
        width: double.infinity,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 32,
          runSpacing: 32,
          // children: List.generate(titles.length, (index) {
          //   return _buildBottomMenuItem(index);
          // }),
          children: [
            _buildBottomMenuItem(
              iconPath: AppIcons.home,
              title: "Home",
              onClick: () {
                Get.back();
                controller.scrollToSection(controller.jumbotronKey);
              },
            ),
            _buildBottomMenuItem(
              iconPath: AppIcons.code,
              title: "Services",
              onClick: () {
                Get.back();
                controller.scrollToSection(controller.serviceKey);
              },
            ),
            _buildBottomMenuItem(
              iconPath: AppIcons.resume,
              title: "Journey",
              onClick: () {
                Get.back();
                controller.scrollToSection(controller.journeyKey);
              },
            ),
            _buildBottomMenuItem(
              iconPath: AppIcons.gallery,
              title: "Projects",
              onClick: () {
                Get.back();
                controller.scrollToSection(controller.projectKey);
              },
            ),
            _buildBottomMenuItem(
              iconPath: AppIcons.file,
              title: "Skills",
              onClick: () {
                Get.back();
                controller.scrollToSection(controller.skillKey);
              },
            ),
            _buildBottomMenuItem(
              iconPath: AppIcons.send,
              title: "Contact",
              onClick: () {
                Get.back();
                controller.scrollToSection(controller.contactKey);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMenuItem({
    required String iconPath,
    required String title,
    required void Function() onClick,
  }) {
    return InkWell(
      onTap: onClick,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
          ),
          UIUtils.verticalSpace(8),
          Text(
            title,
            style: AppText.navItemStyle.copyWith(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
