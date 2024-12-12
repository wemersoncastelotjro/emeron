import 'package:get/get.dart';
import 'package:emeron/core/services/http/http.service.dart';
import 'package:emeron/core/services/exceptions/api.exceptions.dart';
import 'package:emeron/features/auth/infra/dto/requests/signin_request.dto.dart';
import 'package:emeron/features/auth/infra/dto/responses/user_response.dto.dart';
import 'package:emeron/features/auth/infra/datasource/auth/iauth.datasource.dart';

class AuthDataSourceImpl implements IAuthDatasource {
  final IHttpService _httpService;

  AuthDataSourceImpl(this._httpService);

  @override
  Future<UserResponseDTO> signIn(SignInRequestDTO dto) async {
    try {
      final response = await _httpService.post(
        '/login',
        body: dto.toJson(),
      );

      return UserResponseDTO.fromJson(response.data);
    } catch (e) {
      throw ApiException(message: 'login_failed_message'.tr);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _httpService.post('/auth/logout');
    } catch (e) {
      throw ApiException(message: 'Falha ao realizar logout: ${e.toString()}');
    }
  }
}
