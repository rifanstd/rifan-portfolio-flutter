import 'package:get/get.dart';
import 'package:portfolio/app/data/repositories/local_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(() => LocalRepository());
  }
}
