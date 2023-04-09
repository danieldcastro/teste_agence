import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/my_products_controller.dart';

class MyProductsPage extends GetView<MyProductsController> {
  const MyProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Produtos'),
      ),
      body: Container(),
    );
  }
}
