import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:teste_agence/domain/usecases/facebook_login_usecase/facebook_login_usecase.dart';

import '../../../../core/util/global_show_snackbar_function.dart';
import '../../../../core/util/mixins/loader_mixin.dart';
import '../../../../domain/usecases/google_login_usecase/google_login_usecase.dart';
import '../../../../infrastructure/errors/auth_exception.dart';
import '../../../routes/routes.dart';
import '../../../theme/app_colors.dart';

class HomeController extends GetxController with LoaderMixin {
  final GoogleLoginUsecase _googleLoginUsecase;
  final FacebookLoginUsecase _facebookLoginUsecase;

  RxBool isLoading = false.obs;

  HomeController({
    required GoogleLoginUsecase googleLoginUsecase,
    required FacebookLoginUsecase facebookLoginUsecase,
  })  : _googleLoginUsecase = googleLoginUsecase,
        _facebookLoginUsecase = facebookLoginUsecase;

  Future<void> signOut() async {
    isLoading.value = true;
    Either<AuthException, void>? result;
    if (_googleLoginUsecase.isGoogleLoggedIn()) {
      result = await _googleLoginUsecase.signOut();
    } else if (_facebookLoginUsecase.isFacebookLoggedIn()) {
      result = await _facebookLoginUsecase.signOut();
    }
    isLoading.value = false;

    if (result!.isLeft) {
      GlobalShowSnackbarFunction()
          .show(result.left.message, color: AppColors().normalRedColor);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onInit() {
    loaderListener(isLoading);
    super.onInit();
  }
}
