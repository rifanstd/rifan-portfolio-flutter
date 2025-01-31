import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class Navbar extends GetView<HomeController> {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth(context);
    final horizontalPadding = ScreenUtils.getHorizontalPadding(context);

    return Obx(
      () => Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColor.background,
          border: controller.isScrolled.isTrue
              ? Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(.2),
                  ),
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SvgPicture.asset(
                  AppIcons.logo,
                  width: 120,
                ),
              ),
              const Spacer(),
              if (!ScreenUtils.isSmallScreen(context)) ...[
                _buildNavItem(
                  name: "Hello!",
                  onClick: () {
                    controller.scrollToSection(controller.jumbotronKey);
                  },
                ),
                UIUtils.horizontalSpace(40),
                _buildNavItem(
                  name: "Services",
                  onClick: () {
                    controller.scrollToSection(controller.serviceKey);
                  },
                ),
                UIUtils.horizontalSpace(40),
                _buildNavItem(
                  name: "Journey",
                  onClick: () {
                    controller.scrollToSection(controller.journeyKey);
                  },
                ),
                UIUtils.horizontalSpace(40),
                _buildNavItem(
                  name: "Projects",
                  onClick: () {
                    controller.scrollToSection(controller.projectKey);
                  },
                ),
                UIUtils.horizontalSpace(40),
                _buildNavItem(
                  name: "Skills",
                  onClick: () {
                    controller.scrollToSection(controller.skillKey);
                  },
                ),
                UIUtils.horizontalSpace(40),
                _buildNavItem(
                  name: "Contact",
                  onClick: () {
                    controller.scrollToSection(controller.contactKey);
                  },
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      {required String name, required void Function() onClick}) {
    RxBool isHovered = false.obs;

    return Obx(
      () => MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: InkWell(
          onTap: onClick,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: Text(
            name,
            style: TextStyle(
              color: isHovered.isTrue ? AppColor.primary : null,
            ),
          ),
        ),
      ),
    );
  }
}
