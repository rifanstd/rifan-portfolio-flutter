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
import 'package:portfolio/app/modules/home/views/sections/footer.dart';
import 'package:portfolio/app/modules/home/views/sections/journey.dart';
import 'package:portfolio/app/modules/home/views/sections/jumbotron.dart';
import 'package:portfolio/app/modules/home/views/sections/navbar.dart';
import 'package:portfolio/app/modules/home/views/sections/service_section.dart';
import 'package:portfolio/app/modules/home/views/sections/skills.dart';
import 'package:portfolio/app/modules/home/views/widgets/section_anchor.dart';

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
                  RefreshIndicator(
                    onRefresh: () async => await controller.initData(),
                    child: ListView(
                      controller: controller.scrollController,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding),
                          child: Column(
                            children: [
                              // JUMBOTRON
                              SectionAnchor(
                                  sectionKey: controller.jumbotronKey),
                              UIUtils.verticalSpace(
                                  ScreenUtils.isLargeScreen(context)
                                      ? 200
                                      : 100),
                              const Jumbotron(),

                              // SERVICES
                              SectionAnchor(sectionKey: controller.serviceKey),
                              UIUtils.verticalSpace(
                                  ScreenUtils.isLargeScreen(context) ? 80 : 40),
                              const ServiceSection(),

                              // JOURNEY
                              SectionAnchor(sectionKey: controller.journeyKey),
                              UIUtils.verticalSpace(
                                  ScreenUtils.isLargeScreen(context) ? 80 : 40),
                              const Journey(),

                              // PROJECTS
                              // UIUtils.verticalSpace(
                              //     ScreenUtils.isLargeScreen(context) ? 80 : 40),
                              // TODO @Rifan : add project section

                              // SKILLS
                              SectionAnchor(sectionKey: controller.skillKey),
                              UIUtils.verticalSpace(
                                  ScreenUtils.isLargeScreen(context) ? 80 : 40),
                              const Skills(),

                              // CONTACT
                              SectionAnchor(sectionKey: controller.contactKey),
                              UIUtils.verticalSpace(
                                  ScreenUtils.isLargeScreen(context) ? 80 : 40),
                              const ContactMe(),
                            ],
                          ),
                        ),

                        // FOOTER
                        UIUtils.verticalSpace(
                            ScreenUtils.isLargeScreen(context) ? 80 : 40),
                        const Footer(),
                      ],
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
