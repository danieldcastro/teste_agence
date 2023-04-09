// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:teste_agence/core/util/mixins/loader_mixin.dart';
import 'package:teste_agence/core/util/ui/global_confirmation_alert_dialog.dart';
import 'package:teste_agence/domain/dto/product_entity.dart';
import 'package:teste_agence/domain/usecases/get_user_location_usecase/get_user_location_usecase_.dart';

import '../../../../core/util/ui/global_snackbar.dart';
import '../../../theme/app_colors.dart';

class ProductDetailsController extends GetxController with LoaderMixin {
  final GetUserLocationUsecase _getUserLocationUsecase;
  ProductDetailsController({
    required GetUserLocationUsecase getUserLocationUsecase,
  }) : _getUserLocationUsecase = getUserLocationUsecase;

  ProductDto product = Get.arguments;

  RxDouble userLatitude = 0.0.obs;
  RxDouble userLongitude = 0.0.obs;

  RxBool isLocated = false.obs;

  RxBool isLoading = false.obs;

  Future<void> getUserLocation() async {
    isLoading.value = true;
    final result = await _getUserLocationUsecase.call();
    isLoading.value = false;

    if (result.isLeft) {
      GlobalSnackbar.show(result.left.message,
          color: AppColors().normalRedColor);
      isLocated.value = false;
      Get.back();
    } else {
      userLatitude.value = result.right.latitude ?? 0;
      userLongitude.value = result.right.longitude ?? 0;
      isLocated.value = true;
    }
  }

  onTapBuy() {
    GlobalConfirmationAlertDialog.showDialog(
        messageText: 'Você tem certeza que deseja comprar?',
        onTapYes: () {
          Get.back();
          GlobalSnackbar.show('a compra foi realizada com sucesso!',
              color: AppColors().normalGreenColor);
        });
  }

  @override
  void onInit() {
    loaderListener(isLoading);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getUserLocation();
    super.onReady();
  }
}
