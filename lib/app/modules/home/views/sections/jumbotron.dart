import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:portfolio/app/core/enums/url_enum.dart';
import 'package:portfolio/app/core/styles/app_button.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/core/values/app_images.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class Jumbotron extends GetView<HomeController> {
  const Jumbotron({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtils.isLargeScreen(context)
        ? _largeScreenLayout(context)
        : _smallScreenLayout(context);
  }

  Column _smallScreenLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfilePicture(),
        UIUtils.verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildSocialMedia(isVerticalLayout: false),
        ),
        UIUtils.verticalSpace(24),
        _buildName(context),
        UIUtils.verticalSpace(4),
        _buildProfession(context),
        UIUtils.verticalSpace(16),
        _buildAboutDesc(),
        UIUtils.verticalSpace(32),
        _buildSayHelloBtn(context),
      ],
    );
  }

  Row _largeScreenLayout(BuildContext context) {
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
            children: _buildSocialMedia(isVerticalLayout: true),
          ),
        ),
        UIUtils.horizontalSpace(24),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildName(context),
              UIUtils.verticalSpace(4),
              _buildProfession(context),
              UIUtils.verticalSpace(16),
              _buildAboutDesc(),
              UIUtils.verticalSpace(32),
              _buildSayHelloBtn(context),
            ],
          ),
        ),
        UIUtils.horizontalSpace(24),
        Expanded(
          flex: 3,
          child: _buildProfilePicture(),
        ),
      ],
    );
  }

  FilledButton _buildSayHelloBtn(BuildContext context) {
    return FilledButton.icon(
      onPressed: () async => controller.openSocialMedia(UrlEnum.linkedin),
      label: const Text(
        "Say Hello",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      icon: SvgPicture.asset(
        AppIcons.send,
        colorFilter:
            const ColorFilter.mode(AppColor.background, BlendMode.srcIn),
        width: 24,
      ),
      iconAlignment: IconAlignment.end,
      style: AppButton.filledPrimary(context),
    );
  }

  Text _buildAboutDesc() {
    return const Text(
      "I'm a passionate mobile developer based in Jakarta, Indonesia, specializing in building responsive and user-friendly mobile apps. I strive to deliver seamless experiences and high-performance solutions to meet users' needs.",
    );
  }

  Row _buildProfession(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: ScreenUtils.isLargeScreen(context) ? 50 : 30,
          decoration: BoxDecoration(
            border:
                const Border(top: BorderSide(color: Colors.black, width: 1)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        UIUtils.horizontalSpace(12),
        Text(
          "Mobile Developer",
          style: AppText.regular20,
        ),
      ],
    );
  }

  Wrap _buildName(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          "Rifan Setiadi",
          style: ScreenUtils.isLargeScreen(context)
              ? AppText.jumbotronTitle
              : AppText.jumbotronTitle.copyWith(fontSize: 40),
        ),
        UIUtils.horizontalSpace(8),
        SvgPicture.asset(
          AppIcons.hand,
          width: 40,
        ),
      ],
    );
  }

  LayoutBuilder _buildProfilePicture() {
    return LayoutBuilder(
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
    );
  }

  List<Widget> _buildSocialMedia({required bool isVerticalLayout}) {
    return [
      InkWell(
        onTap: () async => controller.openSocialMedia(UrlEnum.linkedin),
        child: SvgPicture.asset(
          AppIcons.linkedin,
          width: 24,
        ),
      ),
      isVerticalLayout
          ? UIUtils.verticalSpace(32)
          : UIUtils.horizontalSpace(24),
      InkWell(
        onTap: () async => controller.openSocialMedia(UrlEnum.github),
        child: SvgPicture.asset(
          AppIcons.github,
          width: 24,
        ),
      ),
      isVerticalLayout
          ? UIUtils.verticalSpace(32)
          : UIUtils.horizontalSpace(24),
      InkWell(
        onTap: () async => controller.openSocialMedia(UrlEnum.instagram),
        child: SvgPicture.asset(
          AppIcons.instagram,
          width: 24,
        ),
      ),
      isVerticalLayout ? UIUtils.verticalSpace(32) : const SizedBox.shrink(),
    ];
  }
}
