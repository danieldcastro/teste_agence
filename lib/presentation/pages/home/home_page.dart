import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/home_controller.dart';
import 'widgets/home_drawer_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawer: HomeDrawerWidget(signOut: controller.signOut),
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'Olá, ${controller.userName.split(' ').first} ',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1),
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () => Visibility(
                            visible:
                                controller.product.value.imageUrl.isNotEmpty,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.network(
                                controller.product.value.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Obx(() => Text(controller.product.value.title)),
                      )
                    ],
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: controller.goToProductDetailsPage,
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
