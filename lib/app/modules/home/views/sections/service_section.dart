import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/data/models/service_model.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';
import 'package:portfolio/app/modules/home/views/widgets/service_item_card.dart';

class ServiceSection extends GetView<HomeController> {
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
            controller.services.length,
            (index) {
              return ServiceItemCard(
                service: controller.services.elementAt(index),
                onClick: (service) =>
                    _showDetailServiceDialog(context, service),
              );
            },
          ),
        )
      ],
    );
  }

  void _showDetailServiceDialog(BuildContext context, ServiceModel service) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: AppColor.background,
          surfaceTintColor: AppColor.background,
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                "Close",
                style: AppText.bold14,
              ),
            ),
          ],
          content: Container(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      service.title,
                      style: AppText.bold16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  UIUtils.verticalSpace(16),
                  Text(
                    service.description,
                    textAlign: TextAlign.center,
                  ),
                  UIUtils.verticalSpace(20),
                  ...List.generate(service.details.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppIcons.check, width: 20),
                          UIUtils.horizontalSpace(8),
                          Expanded(
                            child: Text(
                              service.details.elementAt(index),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
