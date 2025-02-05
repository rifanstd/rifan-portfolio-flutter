import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/core/constants/journey_constant.dart';
import 'package:portfolio/app/core/enums/journey_enum.dart';
import 'package:portfolio/app/core/enums/url_enum.dart';
import 'package:portfolio/app/core/utils/string_utils.dart';
import 'package:portfolio/app/core/values/urls.dart';
import 'package:portfolio/app/data/models/contact_model.dart';
import 'package:portfolio/app/data/models/journey_model.dart';
import 'package:portfolio/app/data/models/project_model.dart';
import 'package:portfolio/app/data/models/service_model.dart';
import 'package:portfolio/app/data/models/skill_model.dart';
import 'package:portfolio/app/data/repositories/contact_repository.dart';
import 'package:portfolio/app/data/repositories/local_repository.dart';
import 'package:url_launcher/url_launcher.dart';

enum SendEmailState { initial, loading, success, failed, prevented }

class HomeController extends GetxController with StateMixin {
  // Scroll controller
  final scrollController = ScrollController();

  // key
  final GlobalKey jumbotronKey = GlobalKey();
  final GlobalKey serviceKey = GlobalKey();
  final GlobalKey journeyKey = GlobalKey();
  final GlobalKey skillKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // state
  final selectedJourneyTab = JourneyEnum.experience.obs;
  final isScrolled = false.obs;

  RxList<ServiceModel> services = <ServiceModel>[].obs;
  RxList<JourneyModel> educations = <JourneyModel>[].obs;
  RxList<JourneyModel> experiences = <JourneyModel>[].obs;
  RxList<SkillModel> skills = <SkillModel>[].obs;
  RxList<ProjectModel> projects = <ProjectModel>[].obs;

  // send email message
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> sendEmailKey = GlobalKey<FormState>();
  final sendEmailState = SendEmailState.initial.obs;

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(scrollListener);
    await initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void scrollListener() {
    if (scrollController.hasClients) {
      isScrolled.value = scrollController.offset > 50;
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      RenderBox box = context.findRenderObject() as RenderBox;
      double position = box.localToGlobal(Offset.zero).dy;

      scrollController.animateTo(
        position + scrollController.offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> initData() async {
    change(null, status: RxStatus.loading());

    try {
      await Future.delayed(const Duration(seconds: 3));
      await Future.wait([
        fetchServiceData(),
        fetchJourneyData(),
        fetchSkillData(),
        fetchProjectData(),
      ]);

      change(null, status: RxStatus.success());
    } catch (e) {
      Get.log(e.toString());
      change(null, status: RxStatus.error());
      throw Exception(e);
    }
  }

  Future<void> fetchServiceData() async {
    await Get.find<LocalRepository>().getLocalServices().then((value) {
      services.clear();
      services.assignAll(value);
    });
  }

  Future<void> fetchSkillData() async {
    await Get.find<LocalRepository>().getLocalSkills().then((value) {
      skills.clear();
      skills.assignAll(value);
    });
  }

  Future<void> fetchJourneyData() async {
    await Get.find<LocalRepository>().getLocalJourneys().then((value) {
      educations.clear();
      experiences.clear();

      for (var item in value) {
        if (item.category == JourneyConstant.education) {
          educations.add(item);
        } else if (item.category == JourneyConstant.experience) {
          experiences.add(item);
        }
      }
      educations.assignAll(educations.reversed.toList());
      experiences.assignAll(experiences.reversed.toList());
    });
  }

  Future<void> fetchProjectData() async {
    await Get.find<LocalRepository>().getLocalProjects().then((value) {
      projects.clear();
      projects.assignAll(value);
    });
  }

  Future<void> openSocialMedia(UrlEnum type) async {
    try {
      switch (type) {
        case UrlEnum.linkedin:
          await launchUrl(Uri.parse(Urls.linkedin));
          break;
        case UrlEnum.github:
          await launchUrl(Uri.parse(Urls.github));
          break;
        case UrlEnum.instagram:
          await launchUrl(Uri.parse(Urls.instagram));
          break;
        case UrlEnum.whatsapp:
          await launchUrl(Uri.parse(Urls.whatsapp));
          break;
        case UrlEnum.email:
          await sendEmail();
          break;
      }
    } catch (e) {
      Get.log("Cannot open the url");
      Get.log(e.toString());
      throw Exception(e);
    }
  }

  Future<void> sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: Urls.email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Let\'s work together!',
      }),
    );

    await launchUrl(emailLaunchUri);
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> downloadApps(String url) async {
    Get.log(url);
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      Get.log(e.toString());
      throw Exception(e);
    }
  }

  void setSelectedJourneyTab(JourneyEnum tab) {
    if (selectedJourneyTab.value != tab) {
      selectedJourneyTab.value = tab;
    }
  }

  Future<void> sendEmailMessage() async {
    sendEmailState.value = SendEmailState.initial;

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        messageController.text.isEmpty) {
      sendEmailState.value = SendEmailState.prevented;

      Get.log("Lengkapi dulu data dan pesanmu yaa :)");
      return;
    }

    sendEmailState.value = SendEmailState.loading;

    List<String> recipients = [
      'rfan2442@gmail.com',
      'rifansetiadi.pro@gmail.com'
    ];

    Map<String, dynamic> emailContent = {
      "subject": "New Message from Your Portfolio Contact Form",
      "html": """
        <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <h2 style="color: #4CAF50;">📩 New Message Received</h2>
            <p><strong>From:</strong> ${nameController.text} (${emailController.text})</p>
            <p><strong>Message:</strong></p>
            <p>
              ${messageController.text}
            </p>
            <hr>
            <p style="font-size: 14px; color: #777;">This message was sent via your portfolio contact form.</p>
          </body>
        </html>
      """,
    };

    try {
      await ContactRepository().add(
        StringUtils.getRandomUID(),
        ContactModel(
          recipients: recipients,
          emailContent: emailContent,
        ).toJson(),
      );
      nameController.text = "";
      emailController.text = "";
      messageController.text = "";
      sendEmailState.value = SendEmailState.success;
    } catch (e) {
      Get.log(e.toString());
      sendEmailState.value = SendEmailState.failed;
    }
  }
}
