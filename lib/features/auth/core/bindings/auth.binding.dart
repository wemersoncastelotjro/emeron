import 'package:get/get.dart';
import 'package:emeron/features/auth/presentation/controllers/auth.controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
