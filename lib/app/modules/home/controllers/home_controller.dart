import 'package:get/get.dart';
import 'package:portfolio/app/core/enums/url_enum.dart';
import 'package:portfolio/app/core/values/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
}
