import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../../../core/util/global_show_snackbar_function.dart';
import '../../../../core/util/mixins/loader_mixin.dart';
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
      GlobalShowSnackbarFunction()
          .show(result.left.message, color: AppColors().normalRedColor);
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
              'O Renault 5 Turbo foi um hatchback de alta performance lançado pelo fabricante francês no Salão do Automóvel de Bruxelas em janeiro de 1980. Sete anos após ganhar o Campeonato Mundial de Rali em 1973, a Renault introduziu o novo R5 Turbo como uma edição especial de homologação pura para competir nas corridas dos Grupos 3 e 4 e em competições internacionais de rali. Em resposta ao sucesso da Lancia em rally com o Stratos de motor central, Jean Terramorsi, vice-presidente de produção da Renault, pediu a Marc Deschamps da Bertone que projetasse uma nova versão esportiva do supermini Renault 5 Alpine. A distintiva nova carroceria traseira foi projetada por Marcello Gandini da Bertone. Embora o Renault 5 padrão tivesse um motor dianteiro, o 5 Turbo apresentava um motor turbo Cléon-Fonte de 1397cc montado no meio do carro, atrás do motorista, em um chassi modificado do Renault 5. Na forma padrão, o motor desenvolvia 158 cavalos de potência e 163 libras-pé de torque.');
    });
    isLoading.value = false;
  }

  void goToProductDetailsPage() {
    Get.toNamed(Routes.PRODUCTS_DETAILS);
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
