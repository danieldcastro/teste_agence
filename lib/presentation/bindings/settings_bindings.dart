import 'package:get/get.dart';

import '../pages/settings/controllers/settings_controller.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
