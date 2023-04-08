// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_agence/core/util/global_show_snackbar_function.dart';
import 'package:teste_agence/core/util/mixins/loader_mixin.dart';
import 'package:teste_agence/domain/usecases/facebook_login_usecase/facebook_login_usecase.dart';
import 'package:teste_agence/domain/usecases/google_login_usecase/google_login_usecase.dart';
import 'package:teste_agence/presentation/theme/app_colors.dart';

import '../../../routes/routes.dart';

class LoginController extends GetxController with LoaderMixin {
  final GoogleLoginUsecase _googleLoginUsecase;
  final FacebookLoginUsecase _facebookLoginUsecase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString userName = ''.obs;

  RxBool showPassword = false.obs;

  RxBool isLoading = false.obs;

  LoginController({
    required GoogleLoginUsecase googleLoginUsecase,
    required FacebookLoginUsecase facebookLoginUsecase,
  })  : _googleLoginUsecase = googleLoginUsecase,
        _facebookLoginUsecase = facebookLoginUsecase;

  void submitLogin() {
    Get.offAllNamed(Routes.HOME);
  }

  void switchShowPassword() {
    showPassword.value = !showPassword.value;
  }

  Future<void> submitGoogleLogin() async {
    isLoading.value = true;
    final result = await _googleLoginUsecase.signIn();
    isLoading.value = false;

    if (result.isLeft) {
      GlobalShowSnackbarFunction()
          .show(result.left.message, color: AppColors().normalRedColor);
    } else {
      userName.value = result.right.user!.displayName ?? 'Usuário';
      Get.offAllNamed(Routes.HOME, arguments: userName);
    }
  }

  Future<void> submitFacebookLogin() async {
    isLoading.value = true;
    final result = await _facebookLoginUsecase.signIn();
    isLoading.value = false;

    if (result.isLeft) {
      GlobalShowSnackbarFunction()
          .show(result.left.message, color: AppColors().normalRedColor);
    } else {
      userName.value = result.right.displayName ?? 'Usuário';
      Get.offAllNamed(Routes.HOME, arguments: userName);
    }
  }

  @override
  void onInit() {
    loaderListener(isLoading);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
