import 'package:get/get.dart';
import 'package:emeron/features/certificates/presentation/controllers/home.controller.dart';

class CertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CertificateController());
  }
}
