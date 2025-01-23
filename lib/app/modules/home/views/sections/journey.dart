import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/enums/journey_enum.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio/app/modules/home/views/widgets/timeline_journey_item.dart';

class Journey extends GetView<HomeController> {
  const Journey({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...UIUtils.createSectionHeader(
            title: "Journey",
            subtitle: "A glimpse into my path as a Mobile Developer.",
          ),
          UIUtils.verticalSpace(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTabTitle(
                title: "Experience",
                context: context,
                onClick: () =>
                    controller.setSelectedJourneyTab(JourneyEnum.experience),
                isSelected: controller.selectedJourneyTab.value ==
                    JourneyEnum.experience,
              ),
              _buildTabTitle(
                title: "Education",
                context: context,
                onClick: () =>
                    controller.setSelectedJourneyTab(JourneyEnum.education),
                isSelected: controller.selectedJourneyTab.value ==
                    JourneyEnum.education,
              ),
            ],
          ),
          UIUtils.verticalSpace(20),
          if (controller.selectedJourneyTab.value == JourneyEnum.education)
            TimelineJourneyItem(journeys: controller.educations)
          else
            TimelineJourneyItem(journeys: controller.experiences),
        ],
      ),
    );
  }

  InkWell _buildTabTitle({
    required String title,
    required BuildContext context,
    required void Function() onClick,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: isSelected
              ? const Border(
                  bottom: BorderSide(
                    color: AppColor.primary,
                    width: 4,
                  ),
                )
              : null,
        ),
        child: Text(
          title,
          style: isSelected
              ? AppText.bold20
              : AppText.bold20.copyWith(
                  color: AppColor.primary.withOpacity(.5),
                ),
        ),
      ),
    );
  }
}
