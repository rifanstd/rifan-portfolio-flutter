import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/styles/app_button.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/data/models/project_model.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class Projects extends GetView<HomeController> {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...UIUtils.createSectionHeader(
          title: "Projects",
          subtitle: "What I have done so far.",
        ),
        UIUtils.verticalSpace(40),
        if (ScreenUtils.isLargeScreen(context))
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
          )
        else
          ExpandableCarousel.builder(
            itemCount: controller.projects.length,
            itemBuilder: (context, index, realIndex) => _buildCardProjectItem(
              context: context,
              project: controller.projects.elementAt(index),
            ),
            options: ExpandableCarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
              showIndicator: false,
              floatingIndicator: false,
              enlargeCenterPage: true,
              clipBehavior: Clip.none,
              autoPlayAnimationDuration: const Duration(seconds: 2),
            ),
          ),
      ],
    );
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
            Image.asset(
              project.imageUrl ?? "",
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
              project.targetPlatform ?? "",
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
          contentPadding: const EdgeInsets.only(bottom: 0, top: 16, left: 16, right: 16),
          content: Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          project.imageUrl ?? "",
                          width: 50,
                        ),
                        UIUtils.horizontalSpace(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.abreviation ?? "",
                                style: AppText.bold16,
                              ),
                              Text(
                                project.name ?? "",
                                style: AppText.bold14,
                              ),
                              UIUtils.verticalSpace(8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.download,
                                    width: 16,
                                  ),
                                  UIUtils.horizontalSpace(4),
                                  Text(
                                    project.downloadCount ?? "",
                                    style: AppText.bold12,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.platform,
                                    width: 16,
                                  ),
                                  UIUtils.horizontalSpace(4),
                                  Text(
                                    project.targetPlatform ?? "",
                                    style: AppText.bold12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (project.iosUrlDownload != null || project.androidUrlDownload != null) ...[
                      UIUtils.verticalSpace(16),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (project.androidUrlDownload != null)
                            TextButton.icon(
                              onPressed: () async => await controller.downloadApps(
                                project.androidUrlDownload ?? "",
                              ),
                              icon: SvgPicture.asset(
                                AppIcons.playstore,
                                width: 20,
                              ),
                              label: const Text(
                                "Get on Playstore",
                                style: TextStyle(
                                  color: AppColor.white,
                                ),
                              ),
                              style: AppButton.smallFilledPrimary(context).copyWith(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          if (project.iosUrlDownload != null)
                            TextButton.icon(
                              onPressed: () async => await controller.downloadApps(
                                project.iosUrlDownload ?? "",
                              ),
                              icon: SvgPicture.asset(
                                AppIcons.appstore,
                                width: 20,
                              ),
                              label: const Text(
                                "Get on Appstore",
                                style: TextStyle(
                                  color: AppColor.white,
                                ),
                              ),
                              style: AppButton.smallFilledPrimary(context).copyWith(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                    UIUtils.verticalSpace(16),
                    Text("Description", style: AppText.bold12),
                    UIUtils.verticalSpace(8),
                    Text(project.description ?? "No description"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
