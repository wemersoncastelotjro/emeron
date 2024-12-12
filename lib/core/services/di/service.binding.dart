import 'package:get/get.dart';
import 'package:emeron/core/services/http/http.service.dart';
import 'package:emeron/core/services/http/http_impl.service.dart';
import 'package:emeron/core/services/storage/storage.service.dart';
import 'package:emeron/core/services/storage/storage_impl.service.dart';

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    // Http Service
    Get.lazyPut<IHttpService>(
      () => HttpServiceImpl(),
      fenix: true,
    );

    // Storage Service
    Get.lazyPut<IStorageService>(
      () => StorageServiceImpl(),
      fenix: true,
    );
  }
}
