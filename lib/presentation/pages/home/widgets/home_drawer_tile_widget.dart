import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDrawerTileWidget extends StatelessWidget {
  final String title;
  final String? pageRoute;
  final IconData icon;
  final VoidCallback? signOut;
  const HomeDrawerTileWidget(
      {super.key,
      required this.title,
      this.pageRoute,
      required this.icon,
      this.signOut});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: Get.theme.primaryColor),
      onTap: () {
        Get.back();
        pageRoute != null ? Get.toNamed(pageRoute!) : signOut!();
      },
    );
  }
}
