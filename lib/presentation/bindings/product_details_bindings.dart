import 'package:get/get.dart';

import '../../domain/usecases/get_user_location_usecase/get_user_location_usecase_.dart';
import '../../domain/usecases/get_user_location_usecase/get_user_location_usecase_impl.dart';
import '../pages/product_details/controllers/product_details_controller.dart';

class ProductDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GetUserLocationUsecase>(GetUserLocationUsecaseImpl());

    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(
        getUserLocationUsecase: Get.find<GetUserLocationUsecase>()));
  }
}
