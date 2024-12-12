import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:emeron/core/services/storage/storage.service.dart';

class StorageServiceImpl extends GetxService implements IStorageService {
  final _storage = GetStorage();

  @override
  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  @override
  Future<dynamic> read(String key) async {
    return await _storage.read(key);
  }

  @override
  Future<void> delete(String key) async {
    await _storage.remove(key);
  }

  @override
  Future<void> clear() async {
    await _storage.erase();
  }
}
