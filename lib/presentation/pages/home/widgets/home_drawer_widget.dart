import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../theme/app_colors.dart';
import 'home_drawer_tile_widget.dart';

class HomeDrawerWidget extends StatelessWidget {
  final VoidCallback signOut;
  const HomeDrawerWidget({super.key, required this.signOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width / 2,
      backgroundColor: AppColors().normalBlackColor,
      child: Column(
        children: [
          const HomeDrawerTileWidget(
            title: 'Perfil',
            pageRoute: Routes.PROFILE,
            icon: Icons.person_2_rounded,
          ),
          const HomeDrawerTileWidget(
            title: 'Meus Produtos',
            pageRoute: Routes.MY_PRODUCTS,
            icon: Icons.inventory_2_rounded,
          ),
          const HomeDrawerTileWidget(
            title: 'Configurações',
            pageRoute: Routes.SETTINGS,
            icon: Icons.settings_rounded,
          ),
          const Spacer(),
          HomeDrawerTileWidget(
            title: 'Logout',
            signOut: signOut,
            icon: Icons.exit_to_app_rounded,
          ),
        ],
      ),
    );
  }
}
