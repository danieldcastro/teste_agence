import 'package:get/get.dart';

import '../pages/product_details/controllers/product_details_controller.dart';

class ProductDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
  }
}
