import 'package:get/get.dart';
import 'package:emeron/routes/app_routes.dart';
import 'package:emeron/features/auth/domain/usecases/authenticate_user.usecase.dart';

class AuthController extends GetxController {
  IAuthenticateUserUseCase _authenticateUserUseCase;

  AuthController(this._authenticateUserUseCase);

  // generate Signin method
  Future<void> signIn(String login, String password) async {
    try {
      await _authenticateUserUseCase(login, password);
      Get.offAndToNamed(AppRoutes.home);
    } catch (e) {
      // Handle login error, e.g., show an error message
    }
  }
}
