import 'package:get/get.dart';

import '../../../../core/util/global_show_snackbar_function.dart';
import '../../../../core/util/mixins/loader_mixin.dart';
import '../../../../domain/usecases/google_login_usecase/google_login_usecase.dart';
import '../../../routes/routes.dart';
import '../../../theme/app_colors.dart';

class HomeController extends GetxController with LoaderMixin {
  final GoogleLoginUsecase _googleLoginUsecase;

  RxBool isLoading = false.obs;

  HomeController({required GoogleLoginUsecase googleLoginUsecase})
      : _googleLoginUsecase = googleLoginUsecase;

  Future<void> signOut() async {
    isLoading.value = true;
    final result = await _googleLoginUsecase.signOut();
    isLoading.value = false;

    if (result.isLeft) {
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
