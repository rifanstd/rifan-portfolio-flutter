import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class Skills extends GetView<HomeController> {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...UIUtils.createSectionHeader(
          title: "Skills",
          subtitle: "What I use to do my job.",
        ),
        UIUtils.verticalSpace(40),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 24,
          children: [
            ...List.generate(controller.skills.length, (index) {
              return Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.black.withOpacity(.2),
                    width: .4,
                  ),
                ),
                child: SvgPicture.asset(
                  controller.skills.elementAt(index).imageUrl,
                ),
              );
            }),
          ],
        )
      ],
    );
  }
}
