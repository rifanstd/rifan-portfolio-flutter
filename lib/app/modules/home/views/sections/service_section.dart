import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
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
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColor.background,
          surfaceTintColor: AppColor.background,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.close_rounded),
                  color: AppColor.primary,
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
