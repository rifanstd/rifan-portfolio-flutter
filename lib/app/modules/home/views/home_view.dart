import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/core/values/app_lottie.dart';
import 'package:portfolio/app/modules/home/views/sections/bottom_menu.dart';
import 'package:portfolio/app/modules/home/views/sections/contact.dart';
import 'package:portfolio/app/modules/home/views/sections/journey.dart';
import 'package:portfolio/app/modules/home/views/sections/jumbotron.dart';
import 'package:portfolio/app/modules/home/views/sections/navbar.dart';
import 'package:portfolio/app/modules/home/views/sections/service_section.dart';
import 'package:portfolio/app/modules/home/views/sections/skills.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = ScreenUtils.getHorizontalPadding(context);

    return Scaffold(
      body: SelectionArea(
        child: controller.obx(
          (state) {
            return ConstrainedBox(
              constraints:
                  BoxConstraints(minWidth: Get.width, minHeight: Get.height),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          children: [
                            UIUtils.verticalSpace(
                                ScreenUtils.isLargeScreen(context) ? 200 : 100),
                            const Jumbotron(),
                            UIUtils.verticalSpace(
                                ScreenUtils.isLargeScreen(context) ? 80 : 40),
                            const ServiceSection(),
                            UIUtils.verticalSpace(
                                ScreenUtils.isLargeScreen(context) ? 80 : 40),
                            const Journey(),
                            // UIUtils.verticalSpace(
                            //     ScreenUtils.isLargeScreen(context) ? 80 : 40),
                            // Projects
                            UIUtils.verticalSpace(
                                ScreenUtils.isLargeScreen(context) ? 80 : 40),
                            const Skills(),
                            UIUtils.verticalSpace(
                                ScreenUtils.isLargeScreen(context) ? 80 : 40),
                            const ConcactMe(),
                            UIUtils.verticalSpace(
                                ScreenUtils.isLargeScreen(context) ? 80 : 40),
                            UIUtils.verticalSpace(80),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Harus paling bawah
                  // TODO @Rifan : handle scroll and navigation to each section
                  if (ScreenUtils.isLargeScreen(context))
                    const Navbar()
                  else
                    const BottomMenu(),
                ],
              ),
            );
          },
          onLoading: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: Get.height, minWidth: Get.width),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeInDown(child: SvgPicture.asset(AppIcons.logo)),
                  UIUtils.verticalSpace(16),
                  FadeInDown(child: const Text("Tunggu yaa😊")),
                  UIUtils.verticalSpace(16),
                  FadeInLeft(
                    duration: const Duration(seconds: 1),
                    child: LottieBuilder.asset(
                      AppLottie.rabbit,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
