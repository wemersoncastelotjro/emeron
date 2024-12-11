import 'package:get/get.dart';
import 'package:emeron/features/home/presentation/controllers/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
