import 'package:emeron/features/auth/domain/entities/token.entity.dart';
import 'package:emeron/features/auth/infra/dto/responses/user_response.dto.dart';

class TokenMapper {
  static TokenEntity fromDTO(UserResponseDTO dto) {
    return TokenEntity(
      dto.token,
      dto.expiresAt,
    );
  }
}
