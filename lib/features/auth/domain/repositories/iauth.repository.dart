import 'package:emeron/features/auth/domain/entities/token.entity.dart';

abstract class IAuthRepository {
  Future<TokenEntity> signIn(String login, String password);
  Future<void> signOut();
}
