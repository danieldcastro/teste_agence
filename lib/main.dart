import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'presentation/routes/app_pages.dart';
import 'presentation/routes/routes.dart';
import 'presentation/theme/app_colors.dart';
import 'presentation/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors().lightPinkColor));
    return GetMaterialApp(
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      title: 'Teste Agence',
      defaultTransition: Transition.fadeIn,
      theme: AppTheme.theme,
    );
  }
}
