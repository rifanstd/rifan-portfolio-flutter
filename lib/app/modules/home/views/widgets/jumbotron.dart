import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/core/values/app_images.dart';

class Jumbotron extends StatelessWidget {
  const Jumbotron({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtils.isLargeScreen(context) ? _largeScreenLayout() : _smallScreenLayout();
  }

  Column _smallScreenLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (_, constraints) {
            return Center(
              child: Container(
                width: constraints.maxWidth * 0.7,
                height: constraints.maxWidth * 0.7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.primary, width: 10),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.profilePhoto),
                  ),
                ),
              ),
            );
          },
        ),
        UIUtils.verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppIcons.linkedin,
              width: 24,
            ),
            UIUtils.horizontalSpace(24),
            SvgPicture.asset(
              AppIcons.github,
              width: 24,
            ),
            UIUtils.horizontalSpace(24),
            SvgPicture.asset(
              AppIcons.instagram,
              width: 24,
            ),
          ],
        ),
        UIUtils.verticalSpace(24),
        Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "Rifan Setiadi",
              style: AppText.jumbotronTitle.copyWith(fontSize: 40),
            ),
            UIUtils.horizontalSpace(8),
            SvgPicture.asset(
              AppIcons.hand,
              width: 40,
            ),
          ],
        ),
        UIUtils.verticalSpace(4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              decoration: BoxDecoration(
                border: const Border(top: BorderSide(color: Colors.black, width: 1)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            UIUtils.horizontalSpace(12),
            Text(
              "Mobile Developer",
              style: AppText.regular20,
            ),
          ],
        ),
        UIUtils.verticalSpace(16),
        const Text(
          "I'm a passionate mobile developer based in Jakarta, Indonesia, specializing in building responsive and user-friendly mobile apps. I strive to deliver seamless experiences and high-performance solutions to meet users' needs.",
        ),
        UIUtils.verticalSpace(32),
        FilledButton.icon(
          onPressed: () {},
          label: const Text(
            "Say Hello",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: SvgPicture.asset(
            AppIcons.send,
            colorFilter: const ColorFilter.mode(AppColor.background, BlendMode.srcIn),
            width: 24,
          ),
          iconAlignment: IconAlignment.end,
          style: FilledButton.styleFrom(
            backgroundColor: AppColor.primary,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  Row _largeScreenLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppIcons.linkedin,
                width: 24,
              ),
              UIUtils.verticalSpace(32),
              SvgPicture.asset(
                AppIcons.github,
                width: 24,
              ),
              UIUtils.verticalSpace(32),
              SvgPicture.asset(
                AppIcons.instagram,
                width: 24,
              ),
              UIUtils.verticalSpace(32),
            ],
          ),
        ),
        UIUtils.horizontalSpace(24),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Rifan Setiadi",
                    style: AppText.jumbotronTitle,
                  ),
                  UIUtils.horizontalSpace(8),
                  SvgPicture.asset(
                    AppIcons.hand,
                    width: 40,
                  ),
                ],
              ),
              UIUtils.verticalSpace(4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      border: const Border(top: BorderSide(color: Colors.black, width: 1)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  UIUtils.horizontalSpace(12),
                  Text(
                    "Mobile Developer",
                    style: AppText.regular20,
                  ),
                ],
              ),
              UIUtils.verticalSpace(16),
              const Text(
                  "I'm a passionate mobile developer based in Jakarta, Indonesia, specializing in building responsive and user-friendly mobile apps. I strive to deliver seamless experiences and high-performance solutions to meet users' needs."),
              UIUtils.verticalSpace(32),
              FilledButton.icon(
                onPressed: () {},
                label: const Text(
                  "Say Hello",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: SvgPicture.asset(
                  AppIcons.send,
                  colorFilter: const ColorFilter.mode(AppColor.background, BlendMode.srcIn),
                  width: 24,
                ),
                iconAlignment: IconAlignment.end,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
        UIUtils.horizontalSpace(24),
        Expanded(
          flex: 3,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: constraints.maxWidth * 0.7,
                    height: constraints.maxWidth * 0.7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.primary, width: 10),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.profilePhoto),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
