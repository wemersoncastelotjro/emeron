import 'package:emeron/features/auth/infra/dto/requests/signin_request.dto.dart';
import 'package:emeron/features/auth/infra/dto/responses/user_response.dto.dart';

abstract class IAuthDatasource {
  Future<UserResponseDTO> signIn(SignInRequestDTO dto);
  Future<void> signOut();
}
