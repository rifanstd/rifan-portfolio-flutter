import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  // TODO @Rifan remove later
  final int selectedMenu = 1;

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  final List<String> titles = [
    "Home",
    "Services",
    "Journey",
    "Projects",
    "Skills"
  ];
  final List<String> icons = [
    AppIcons.home,
    AppIcons.code,
    AppIcons.resume,
    AppIcons.file,
    AppIcons.gallery
  ];
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
          children: List.generate(titles.length, (index) {
            return InkWell(
              onTap: () {
                Get.back();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    icons.elementAt(index),
                    width: 24,
                    colorFilter: widget.selectedMenu == index
                        ? null
                        : ColorFilter.mode(
                            Colors.black.withOpacity(.8),
                            BlendMode.srcIn,
                          ),
                  ),
                  UIUtils.verticalSpace(8),
                  Text(
                    titles.elementAt(index),
                    style: AppText.navItemStyle.copyWith(
                      fontSize: 12,
                      color: widget.selectedMenu == index
                          ? AppColor.primary
                          : Colors.black.withOpacity(.8),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
