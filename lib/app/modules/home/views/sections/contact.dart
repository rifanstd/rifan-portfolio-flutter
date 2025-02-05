import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/app/core/enums/url_enum.dart';
import 'package:portfolio/app/core/styles/app_button.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/screen_utils.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/core/values/app_icons.dart';
import 'package:portfolio/app/core/values/app_lottie.dart';
import 'package:portfolio/app/modules/home/controllers/home_controller.dart';

class ContactMe extends GetView<HomeController> {
  const ContactMe({super.key});

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
    return Form(
      key: controller.sendEmailKey,
      child: Column(
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
            textController: controller.nameController,
            boxWidth: double.infinity,
          ),
          UIUtils.verticalSpace(32),
          _buildFormField(
            hint: "Insert your email",
            label: "Email",
            textController: controller.emailController,
            boxWidth: double.infinity,
          ),
          UIUtils.verticalSpace(32),
          _buildFormField(
            hint: "Write your project",
            label: "Project",
            textController: controller.messageController,
            boxWidth: double.infinity,
            maxLines: 5,
          ),
          UIUtils.verticalSpace(16),
          if (controller.sendEmailState.value != SendEmailState.initial) ...[
            _buildSendEmailInfoBox(boxWidth: double.infinity),
            UIUtils.verticalSpace(16),
          ],
          SizedBox(
            width: double.infinity,
            child: _buildSendMsgBtn(context),
          ),
        ],
      ),
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
          child: Form(
            key: controller.sendEmailKey,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double boxWidth = constraints.maxWidth * 0.7;
                return Obx(
                  () => Align(
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
                          textController: controller.nameController,
                          boxWidth: boxWidth,
                        ),
                        UIUtils.verticalSpace(32),
                        _buildFormField(
                          hint: "Insert your email",
                          label: "Email",
                          textController: controller.emailController,
                          boxWidth: boxWidth,
                        ),
                        UIUtils.verticalSpace(32),
                        _buildFormField(
                          hint: "Write your project",
                          label: "Project",
                          textController: controller.messageController,
                          boxWidth: boxWidth,
                          maxLines: 5,
                        ),
                        UIUtils.verticalSpace(16),
                        if (controller.sendEmailState.value !=
                            SendEmailState.initial) ...[
                          _buildSendEmailInfoBox(boxWidth: boxWidth),
                          UIUtils.verticalSpace(16),
                        ],
                        SizedBox(
                          width: boxWidth,
                          child: _buildSendMsgBtn(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String hint,
    required String label,
    required TextEditingController textController,
    required double boxWidth,
    int? maxLines,
  }) {
    return SizedBox(
      width: boxWidth,
      child: TextFormField(
        controller: textController,
        maxLines: maxLines ?? 1,
        onChanged: (value) =>
            controller.sendEmailState.value = SendEmailState.initial,
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
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4),
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
      onPressed: controller.sendEmailState.value == SendEmailState.loading
          ? null
          : () async => await controller.sendEmailMessage(),
      label: controller.sendEmailState.value == SendEmailState.loading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: AppColor.white,
              ),
            )
          : const Text(
              "Send Message",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
      icon: controller.sendEmailState.value == SendEmailState.loading
          ? const SizedBox.shrink()
          : SvgPicture.asset(
              AppIcons.send,
              colorFilter:
                  const ColorFilter.mode(AppColor.background, BlendMode.srcIn),
              width: 24,
            ),
      iconAlignment: IconAlignment.end,
      style: AppButton.filledPrimary(context),
    );
  }

  Widget _buildSendEmailInfoBox({required double boxWidth}) {
    return Container(
      width: boxWidth,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        border: Border.all(
          color: AppColor.black.withOpacity(.2),
          width: .4,
        ),
      ),
      child: Row(
        children: [
          if (controller.sendEmailState.value == SendEmailState.loading)
            LottieBuilder.asset(
              AppLottie.rabbit,
              width: 50,
            )
          else
            SvgPicture.asset(
              controller.sendEmailState.value == SendEmailState.prevented
                  ? AppIcons.warning
                  : controller.sendEmailState.value == SendEmailState.success
                      ? AppIcons.success
                      : AppIcons.failed,
              width: 24,
            ),
          UIUtils.horizontalSpace(8),
          Flexible(
            child: Text(
              controller.sendEmailState.value == SendEmailState.loading
                  ? "Mengirim pesan..."
                  : controller.sendEmailState.value == SendEmailState.prevented
                      ? "Lengkapi dulu data dan pesanmu yaa :)"
                      : controller.sendEmailState.value ==
                              SendEmailState.success
                          ? "Yeay, pesanmu berhasil terkirim!"
                          : "Oops, terjadi kesalahan saat mengirim pesan.",
              style: AppText.regular12Bold,
            ),
          ),
        ],
      ),
    );
  }
}
