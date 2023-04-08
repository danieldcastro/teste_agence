import 'package:get/get.dart';

import '../bindings/bindings.dart';
import '../pages/pages.dart';
import 'routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBindings()),
    GetPage(
        name: Routes.MY_PRODUCTS,
        page: () => const MyProductsPage(),
        binding: MyProductsBindings()),
    GetPage(
        name: Routes.SETTINGS,
        page: () => const SettingsPage(),
        binding: SettingsBindings()),
    GetPage(
        name: Routes.PRODUCTS_DETAILS,
        page: () => const ProductDetailsPage(),
        binding: ProductDetailsBindings()),
    GetPage(
        name: Routes.PROFILE,
        page: () => const ProfilePage(),
        binding: ProfileBindings()),
  ];
}
