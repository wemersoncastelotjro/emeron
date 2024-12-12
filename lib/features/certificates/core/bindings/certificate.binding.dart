import 'package:get/get.dart';
import 'package:emeron/features/certificates/presentation/controllers/certificates.controller.dart';

class CertificatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CertificatesController());
  }
}
