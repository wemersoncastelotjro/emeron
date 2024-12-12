import 'package:get/get.dart';
import 'package:emeron/core/services/http/http.service.dart';
import 'package:emeron/core/services/http/http_impl.service.dart';
import 'package:emeron/core/services/storage/storage.service.dart';
import 'package:emeron/core/services/storage/storage_impl.service.dart';
import 'package:emeron/features/auth/infra/repositories/auth.repository.dart';
import 'package:emeron/features/auth/domain/repositories/iauth.repository.dart';
import 'package:emeron/features/auth/infra/datasource/auth/iauth.datasource.dart';
import 'package:emeron/features/auth/presentation/controllers/auth.controller.dart';
import 'package:emeron/features/auth/domain/usecases/authenticate_user.usecase.dart';
import 'package:emeron/features/auth/infra/datasource/auth/auth.datasource.impl.dart';
import 'package:emeron/features/auth/infra/datasource/auth/local_auth.datasource.dart';
import 'package:emeron/features/auth/domain/usecases/authenticate_user.usecase.impl.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    final IHttpService httpService = HttpServiceImpl();
    final IStorageService storageService = StorageServiceImpl();

    final IAuthDatasource authRemoteDatasource = AuthDataSourceImpl(httpService);
    final LocalAuthDatasource localAuthDatasource = LocalAuthDatasource(storageService);

    final IAuthRepository authRepository = AuthRepositoryImpl(
      remoteDatasource: authRemoteDatasource,
      localDatasource: localAuthDatasource,
    );

    final IAuthenticateUserUseCase authenticateUserUseCase = AuthenticateUserUsecaseImpl(authRepository);


    Get.put(AuthController(authenticateUserUseCase));
  }
}
