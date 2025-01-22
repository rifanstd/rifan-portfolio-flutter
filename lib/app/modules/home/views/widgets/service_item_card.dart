import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/data/models/service_model.dart';

class ServiceItemCard extends StatelessWidget {
  final ServiceModel service;
  final void Function(ServiceModel service) onClick;

  const ServiceItemCard({
    super.key,
    required this.service,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(service),
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: ScreenUtils.isLargeScreen(context) ? 250 : double.infinity,
        height: ScreenUtils.isLargeScreen(context) ? 250 : null,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.black.withOpacity(.2),
            width: .4,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ScreenUtils.isLargeScreen(context)) ...[
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SvgPicture.asset(
                    service.iconPath,
                    width: 30,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "View more",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      UIUtils.horizontalSpace(8),
                      SvgPicture.asset(
                        AppIcons.arrowRight,
                        width: 12,
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ] else ...[
              SvgPicture.asset(
                service.iconPath,
                width: 30,
              ),
              UIUtils.verticalSpace(8),
              Text(
                service.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              UIUtils.verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "View more",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  UIUtils.horizontalSpace(8),
                  SvgPicture.asset(
                    AppIcons.arrowRight,
                    width: 12,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
