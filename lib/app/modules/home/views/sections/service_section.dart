import 'package:flutter/material.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/modules/home/views/widgets/service_item_card.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...UIUtils.createSectionHeader(
          title: "Services",
          subtitle: "What I offer",
        ),
        UIUtils.verticalSpace(40),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 24,
          children: List.generate(
            5,
            (index) {
              return const ServiceItemCard(
                title: "Mobile App Development",
                iconPath: AppIcons.tinyCode,
              );
            },
          ),
        )
      ],
    );
  }
}
