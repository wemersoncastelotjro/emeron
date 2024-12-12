import 'package:emeron/features/auth/domain/entities/token.entity.dart';

abstract class IAuthenticateUserUseCase {
  Future<TokenEntity> call(String login, String password);
}
