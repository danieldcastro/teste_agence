import 'package:get/get.dart';

import '../../domain/contracts/repositories/google_login_repository.dart';
import '../../domain/usecases/google_login_usecase/google_login_usecase.dart';
import '../../domain/usecases/google_login_usecase/google_login_usecase_impl.dart';
import '../../infrastructure/contracts/repositories/google_login_repository_impl.dart';
import '../pages/home/controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GoogleLoginRepository>(GoogleLoginRepositoryImpl());

    Get.put<GoogleLoginUsecase>(
      GoogleLoginUsecaseImpl(
        repository: Get.find<GoogleLoginRepository>(),
      ),
    );

    Get.lazyPut<HomeController>(() => HomeController(
          googleLoginUsecase: Get.find<GoogleLoginUsecase>(),
        ));
  }
}
