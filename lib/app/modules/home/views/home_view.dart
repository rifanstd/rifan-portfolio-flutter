import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/modules/home/views/sections/bottom_menu.dart';
import 'package:portfolio/app/modules/home/views/sections/jumbotron.dart';
import 'package:portfolio/app/modules/home/views/sections/navbar.dart';
import 'package:portfolio/app/modules/home/views/sections/service_section.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = ScreenUtils.getHorizontalPadding(context);

    return Scaffold(
      body: SelectionArea(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: Get.width, minHeight: Get.height),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                      UIUtils.verticalSpace(
                          ScreenUtils.isLargeScreen(context) ? 200 : 100),
                      const Jumbotron(),
                      UIUtils.verticalSpace(100),
                      const ServiceSection(),
                      UIUtils.verticalSpace(100),
                    ],
                  ),
                ),
              ),

              // Harus paling bawah
              // TODO @Rifan : handle scroll and navigation to each section
              if (ScreenUtils.isLargeScreen(context))
                const Navbar()
              else
                const BottomMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
