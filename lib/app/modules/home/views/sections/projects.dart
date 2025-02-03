import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:portfolio/app/core/styles/app_button.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/core/values/app_images.dart';
import 'package:portfolio/app/data/models/project_model.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class Projects extends GetView<HomeController> {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      ...UIUtils.createSectionHeader(
        title: "Projects",
        subtitle: "What I have done so far.",
      ),
      UIUtils.verticalSpace(40),
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 24,
        runSpacing: 24,
        children: [
          ...List.generate(
            controller.projects.length,
            (index) => _buildCardProjectItem(
              context: context,
              project: controller.projects.elementAt(index),
            ),
          ),
        ],
      ),
    ]);
  }

  Container _buildCardProjectItem({
    required BuildContext context,
    required ProjectModel project,
  }) {
    return Container(
      width: ScreenUtils.isLargeScreen(context) ? 300 : double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.black.withOpacity(.2),
          width: .4,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColor.black.withOpacity(.2),
            width: .4,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.sipuma,
              width: 70,
            ),
            UIUtils.verticalSpace(16),
            Text(
              project.abreviation ?? "",
              style: AppText.bold16,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              project.name ?? "",
              style: AppText.bold12Grey.copyWith(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            UIUtils.verticalSpace(16),
            Text(
              "${project.androidUrlDownload != null ? "Android" : ""} | ${project.iosUrlDownload != null ? "iOS" : ""}",
              style: AppText.bold12.copyWith(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              project.downloadCount ?? "",
              style: AppText.bold12.copyWith(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            UIUtils.verticalSpace(16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  _showDetailProject(context: context, project: project);
                },
                style: AppButton.smallFilledPrimary(context),
                child: const Text("Detail"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailProject({required BuildContext context, required ProjectModel project}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
              maxWidth: 500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        project.imageUrl ?? AppIcons.logo,
                        width: 50,
                      ),
                      UIUtils.horizontalSpace(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.abreviation ?? "",
                            style: AppText.bold16,
                          ),
                          Text(
                            project.name ?? "",
                            style: AppText.bold12,
                          ),
                        ],
                      ),
                    ],
                  ),
                  UIUtils.verticalSpace(8),
                  // Text(
                  //   "${project.institution}, ${project.location}",
                  //   style: AppText.bold12Grey,
                  // ),
                  UIUtils.verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_month_rounded,
                        size: 16,
                        color: Colors.grey,
                      ),
                      UIUtils.horizontalSpace(4),
                      // Text(
                      //   "${project.startDate} - ${project.endDate}",
                      //   style: AppText.bold12Grey,
                      // ),
                    ],
                  ),
                  UIUtils.verticalSpace(16),
                  Text(
                    "Description",
                    style: AppText.bold12,
                  ),
                  UIUtils.verticalSpace(8),
                  // Text(project.description.isNotEmpty ? project.description : "-"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
