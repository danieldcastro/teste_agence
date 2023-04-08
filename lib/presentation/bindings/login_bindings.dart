import 'package:get/get.dart';

import '../../domain/contracts/repositories/facebook_login_repository.dart';
import '../../domain/contracts/repositories/google_login_repository.dart';
import '../../domain/usecases/facebook_login_usecase/facebook_login_usecase.dart';
import '../../domain/usecases/facebook_login_usecase/facebook_login_usecase_impl.dart';
import '../../domain/usecases/google_login_usecase/google_login_usecase.dart';
import '../../domain/usecases/google_login_usecase/google_login_usecase_impl.dart';
import '../../infrastructure/contracts/repositories/facebook_login_repository_impl.dart';
import '../../infrastructure/contracts/repositories/google_login_repository_impl.dart';
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

    Get.put<FacebookLoginRepository>(FacebookLoginRepositoryImpl());

    Get.put<FacebookLoginUsecase>(
      FacebookLoginUsecaseImpl(
        repository: Get.find<FacebookLoginRepository>(),
      ),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(
          googleLoginUsecase: Get.find<GoogleLoginUsecase>(),
          facebookLoginUsecase: Get.find<FacebookLoginUsecase>()),
    );
  }
}
