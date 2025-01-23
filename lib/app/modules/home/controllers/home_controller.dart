import 'package:get/get.dart';
import 'package:portfolio/app/core/constants/journey_constant.dart';
import 'package:portfolio/app/core/enums/journey_enum.dart';
import 'package:portfolio/app/core/enums/url_enum.dart';
import 'package:portfolio/app/core/values/urls.dart';
import 'package:portfolio/app/data/models/journey_model.dart';
import 'package:portfolio/app/data/models/service_model.dart';
import 'package:portfolio/app/data/repositories/service_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController with StateMixin {
  // state
  final selectedJourneyTab = JourneyEnum.experience.obs;

  RxList<ServiceModel> services = <ServiceModel>[].obs;
  RxList<JourneyModel> educations = <JourneyModel>[].obs;
  RxList<JourneyModel> experiences = <JourneyModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
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

  Future<void> initData() async {
    change(null, status: RxStatus.loading());

    try {
      await Future.delayed(const Duration(seconds: 3));
      await Future.wait([
        fetchServiceData(),
        fetchJourneyData(),
      ]);

      change(null, status: RxStatus.success());
    } catch (e) {
      Get.log(e.toString());
      change(null, status: RxStatus.error());
      throw Exception(e);
    }
  }

  Future<void> fetchServiceData() async {
    await Get.find<ServiceRepository>().getLocalServices().then((value) {
      services.clear();
      services.assignAll(value);
    });
  }

  Future<void> fetchJourneyData() async {
    await Get.find<ServiceRepository>().getLocalJourneys().then((value) {
      educations.clear();
      experiences.clear();

      for (var item in value) {
        if (item.type == JourneyConstant.education) {
          educations.add(item);
        } else if (item.type == JourneyConstant.experience) {
          experiences.add(item);
        }
      }
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
      }
    } catch (e) {
      Get.log("Cannot open the url");
      Get.log(e.toString());
      throw Exception(e);
    }
  }

  void setSelectedJourneyTab(JourneyEnum tab) {
    if (selectedJourneyTab.value != tab) {
      selectedJourneyTab.value = tab;
    }
  }
}
