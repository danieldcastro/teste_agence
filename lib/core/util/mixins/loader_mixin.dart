import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../presentation/theme/app_colors.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool isLoading) {
    ever<bool>(isLoading, (loading) async {
      if (loading) {
        await Get.dialog(
          barrierColor: AppColors().normalBlackColor.withOpacity(0.7),
          WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: CircularProgressIndicator(
                color: Get.theme.primaryColor,
              ),
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
