import 'package:get/get.dart';
import 'package:emeron/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAndToNamed(AppRoutes.home),
    );
  }
}
