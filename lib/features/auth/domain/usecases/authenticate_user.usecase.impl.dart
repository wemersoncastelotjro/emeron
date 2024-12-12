import 'package:get/get.dart';
import 'package:emeron/core/services/exceptions/api.exceptions.dart';
import 'package:emeron/features/auth/domain/entities/token.entity.dart';
import 'package:emeron/features/auth/domain/repositories/iauth.repository.dart';
import 'package:emeron/features/auth/domain/usecases/authenticate_user.usecase.dart';

class AuthenticateUserUsecaseImpl implements IAuthenticateUserUseCase {
  final IAuthRepository repository;

  AuthenticateUserUsecaseImpl(this.repository);

  @override
  Future<TokenEntity> call(String login, String password) async {
    try {
      TokenEntity token = await repository.signIn(login, password);
      return token;
    } catch (e) {
      throw ApiException(message: 'login_failed_message'.tr);
    }
  }
}
