import 'package:get/get.dart';
import 'package:teste_agence/domain/contracts/repositories/google_login_repository.dart';
import 'package:teste_agence/domain/usecases/google_login_usecase/google_login_usecase.dart';
import 'package:teste_agence/infrastructure/contracts/repositories/google_login_repository_impl.dart';

import '../../domain/usecases/google_login_usecase/google_login_usecase_impl.dart';
import '../pages/login/controllers/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GoogleLoginRepository>(GoogleLoginRepositoryImpl());

    Get.put<GoogleLoginUsecase>(
      GoogleLoginUsecaseImpl(
        repository: Get.find<GoogleLoginRepository>(),
      ),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(
        googleLoginUsecase: Get.find<GoogleLoginUsecase>(),
      ),
    );
  }
}
