import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../../../core/util/mixins/loader_mixin.dart';
import '../../../../core/util/ui/global_snackbar.dart';
import '../../../../domain/dto/product_entity.dart';
import '../../../../domain/usecases/facebook_login_usecase/facebook_login_usecase.dart';
import '../../../../domain/usecases/google_login_usecase/google_login_usecase.dart';
import '../../../../infrastructure/errors/auth_exception.dart';
import '../../../routes/routes.dart';
import '../../../theme/app_colors.dart';

class HomeController extends GetxController with LoaderMixin {
  final GoogleLoginUsecase _googleLoginUsecase;
  final FacebookLoginUsecase _facebookLoginUsecase;

  Rx<ProductDto> product = ProductDto.empty().obs;

  String userName = Get.arguments.value;

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
      GlobalSnackbar.show(result.left.message,
          color: AppColors().normalRedColor);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> getAllProducts() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600), () {
      product.value = ProductDto(
          imageUrl: 'https://i.imgur.com/2qUE8c2.jpeg',
          title: '1981 RENAULT 5 TURBO',
          description:
              'O Renault 5 Turbo foi um hatchback de alta performance lançado em janeiro de 1980.');
    });
    isLoading.value = false;
  }

  void goToProductDetailsPage() {
    Get.toNamed(Routes.PRODUCTS_DETAILS, arguments: product.value);
  }

  @override
  void onInit() {
    loaderListener(isLoading);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getAllProducts();
  }
}
