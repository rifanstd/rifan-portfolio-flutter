import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/modules/home/views/widgets/bottom_menu.dart';
import 'package:portfolio/app/modules/home/views/widgets/jumbotron.dart';
import 'package:portfolio/app/modules/home/views/widgets/navbar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = ScreenUtils.getHorizontalPadding(context);

    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(minWidth: Get.width, minHeight: Get.height),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    UIUtils.verticalSpace(ScreenUtils.isLargeScreen(context) ? 200 : 100),
                    const Jumbotron(),
                    if (ScreenUtils.isLargeScreen(context)) ...[
                      UIUtils.verticalSpace(100),
                      SvgPicture.asset(AppIcons.mouse),
                    ],
                    UIUtils.verticalSpace(100),
                  ],
                ),
              ),
            ),

            // Harus paling bawah
            if (ScreenUtils.isLargeScreen(context)) const Navbar() else const BottomMenu(),
          ],
        ),
      ),
    );
  }
}
