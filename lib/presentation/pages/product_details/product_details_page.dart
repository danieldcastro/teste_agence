import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../global_widgets/global_gradient_button_widget.dart';
import 'controllers/product_details_controller.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Obx(
              () => SizedBox(
                height: Get.height / 3,
                child: Visibility(
                  visible: controller.isLocated.value,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(controller.userLatitude.value,
                          controller.userLongitude.value),
                      zoom: 16.0,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.network(
                      controller.product.imageUrl,
                      fit: BoxFit.cover,
                      width: Get.width / 2.5,
                      height: Get.height / 6,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: Get.height / 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            controller.product.title,
                            style: Get.textTheme.labelMedium,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(
                          controller.product.description,
                          style: Get.textTheme.bodySmall,
                          maxLines: 4,
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GlobalGradientButtonWidget(
                  buttonText: 'COMPRAR', onTapButton: controller.onTapBuy),
            )
          ],
        ));
  }
}
