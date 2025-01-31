import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/enums/url_enum.dart';
import 'package:portfolio/app/core/styles/app_button.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class ConcactMe extends GetView<HomeController> {
  const ConcactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...UIUtils.createSectionHeader(
            title: "Contact Me", subtitle: "Get in touch with me!"),
        UIUtils.verticalSpace(40),
        ScreenUtils.isLargeScreen(context)
            ? _largeScreen()
            : _smallScreenWidgets(context),
      ],
    );
  }

  Widget _smallScreenWidgets(BuildContext context) {
    return Column(
      children: [
        Text(
          "Talk to me",
          style: AppText.bold18,
        ),
        UIUtils.verticalSpace(24),
        _buildContactOptionCard(
          boxWidth: double.infinity,
          imagePath: AppIcons.sendEmail,
          title: "Email",
          value: "rfan2442@gmail.com",
          onClick: () async {
            await controller.openSocialMedia(UrlEnum.email);
          },
        ),
        UIUtils.verticalSpace(16),
        _buildContactOptionCard(
          boxWidth: double.infinity,
          imagePath: AppIcons.whatsapp,
          title: "Whatsapp",
          value: "+62 896-3009-8684",
          onClick: () async {
            await controller.openSocialMedia(UrlEnum.whatsapp);
          },
        ),
        UIUtils.verticalSpace(24),
        Text(
          "Write me your project",
          style: AppText.bold18,
        ),
        UIUtils.verticalSpace(24),
        _buildFormField(
          hint: "Insert your name",
          label: "Name",
          controller: TextEditingController(),
          boxWidth: double.infinity,
        ),
        UIUtils.verticalSpace(32),
        _buildFormField(
          hint: "Insert your email",
          label: "Email",
          controller: TextEditingController(),
          boxWidth: double.infinity,
        ),
        UIUtils.verticalSpace(32),
        _buildFormField(
          hint: "Write your project",
          label: "Project",
          controller: TextEditingController(),
          boxWidth: double.infinity,
          maxLines: 5,
        ),
        UIUtils.verticalSpace(16),
        SizedBox(
          width: double.infinity,
          child: _buildSendMsgBtn(context),
        ),
      ],
    );
  }

  Row _largeScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Talk to me",
                      style: AppText.bold18,
                    ),
                    UIUtils.verticalSpace(24),
                    _buildContactOptionCard(
                      boxWidth: constraints.maxWidth * 0.7,
                      imagePath: AppIcons.sendEmail,
                      title: "Email",
                      value: "rfan2442@gmail.com",
                      onClick: () async {
                        await controller.openSocialMedia(UrlEnum.email);
                      },
                    ),
                    UIUtils.verticalSpace(16),
                    _buildContactOptionCard(
                      boxWidth: constraints.maxWidth * 0.7,
                      imagePath: AppIcons.whatsapp,
                      title: "Whatsapp",
                      value: "+62 896-3009-8684",
                      onClick: () async {
                        await controller.openSocialMedia(UrlEnum.whatsapp);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        UIUtils.horizontalSpace(64),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double boxWidth = constraints.maxWidth * 0.7;
              return Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Write me your project",
                      style: AppText.bold18,
                    ),
                    UIUtils.verticalSpace(24),
                    _buildFormField(
                      hint: "Insert your name",
                      label: "Name",
                      controller: TextEditingController(),
                      boxWidth: boxWidth,
                    ),
                    UIUtils.verticalSpace(32),
                    _buildFormField(
                      hint: "Insert your email",
                      label: "Email",
                      controller: TextEditingController(),
                      boxWidth: boxWidth,
                    ),
                    UIUtils.verticalSpace(32),
                    _buildFormField(
                      hint: "Write your project",
                      label: "Project",
                      controller: TextEditingController(),
                      boxWidth: boxWidth,
                      maxLines: 5,
                    ),
                    UIUtils.verticalSpace(16),
                    SizedBox(
                      width: boxWidth,
                      child: _buildSendMsgBtn(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String hint,
    required String label,
    required TextEditingController controller,
    required double boxWidth,
    int? maxLines,
  }) {
    return SizedBox(
      width: boxWidth,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          label: Text(label),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildContactOptionCard({
    required double boxWidth,
    required String imagePath,
    required String title,
    required String value,
    required void Function() onClick,
  }) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: boxWidth,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
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
              imagePath,
              width: 40,
            ),
            Text(
              title,
              style: AppText.bold14,
            ),
            UIUtils.verticalSpace(4),
            Text(
              value,
              style: AppText.bold12Grey,
            ),
            UIUtils.verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Write me",
                  style: AppText.bold12Grey,
                ),
                UIUtils.horizontalSpace(4),
                SvgPicture.asset(
                  AppIcons.arrowRight,
                  width: 12,
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSendMsgBtn(BuildContext context) {
    return FilledButton.icon(
      // TODO send email
      onPressed: () async => controller.openSocialMedia(UrlEnum.linkedin),

      label: const Text(
        "Send Message",
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
}
