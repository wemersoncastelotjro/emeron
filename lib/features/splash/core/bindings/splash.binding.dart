import 'package:get/get.dart';
import 'package:emeron/features/splash/presentation/controllers/splash.controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
