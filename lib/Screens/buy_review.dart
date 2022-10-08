import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/productController.dart';

class RiviewOrder extends StatelessWidget {
  const RiviewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsController productsController = Get.put(ProductsController());

    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed('/BuyReview', arguments: Get.arguments);
            },
            child: Container(
              height: 50,
              width: Get.width - 50,
              decoration: BoxDecoration(color: Colors.amber),
              child: Center(child: Text("Buy Now")),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
                height: 160,
                width: Get.width,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        height: 120,
                        width: 120,
                        child: Image.network(productsController
                            .products[Get.arguments]['image']),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: Get.width - 193,
                          child: Text(productsController.products[Get.arguments]
                              ['title']),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            "₹ ${productsController.products[Get.arguments]['price'].toString()}"),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text("Quantity "),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Obx(
                                  () => Text(
                                      "${ProductsController().count.value.obs}"),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  ProductsController().increment;
                                  print(productsController.count.value);
                                },
                                icon: Icon(
                                  Icons.add,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Sum Total ",
                            ),
                            Container(
                              width: Get.width * 0.2,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Obx(() => Text(
                                    ProductsController().count.toString())),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
