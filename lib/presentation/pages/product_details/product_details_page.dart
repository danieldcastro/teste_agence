import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/product_details_controller.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailsPage'),
      ),
      body: Container(),
    );
  }
}
