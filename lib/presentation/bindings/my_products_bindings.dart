import 'package:get/get.dart';

import '../pages/my_products/controllers/my_products_controller.dart';

class MyProductsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProductsController>(() => MyProductsController());
  }
}
