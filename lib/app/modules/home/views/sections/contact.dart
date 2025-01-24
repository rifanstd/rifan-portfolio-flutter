import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class ConcactMe extends GetView<HomeController> {
  const ConcactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...UIUtils.createSectionHeader(
            title: "Contact Me", subtitle: "Get in touch with me!"),
        UIUtils.verticalSpace(40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Talk to me",
                      style: AppText.bold18,
                    ),
                    UIUtils.verticalSpace(12),
                    Container(
                      width: constraints.maxWidth * 0.6,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColor.black.withOpacity(.2),
                          width: .4,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                    ),
                  ],
                );
              }),
            ),
            Expanded(
              child: Column(),
            ),
          ],
        ),
      ],
    );
  }
}
