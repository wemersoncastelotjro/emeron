import 'package:emeron/core/services/storage/storage.service.dart';
import 'package:emeron/features/auth/infra/dto/responses/user_response.dto.dart';

class LocalAuthDatasource {
  final IStorageService _storageService;

  LocalAuthDatasource(this._storageService);

  Future<void> saveAuthData(UserResponseDTO dto) async {
    await _storageService.write('auth_token', dto.token);
    await _storageService.write('token_expiration', dto.expiresAt);
  }

  Future<void> clearAuthData() async {
    await _storageService.delete('auth_token');
    await _storageService.delete('token_expiration');
  }

  Future<String?> getAuthToken() async {
    return await _storageService.read('auth_token');
  }

  Future<String?> getTokenExpiration() async {
    return await _storageService.read('token_expiration');
  }
}
