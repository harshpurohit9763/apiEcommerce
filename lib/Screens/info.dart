import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/productController.dart';

class InfoPage extends StatelessWidget {
  InfoPage({super.key});
  final ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "${productsController.products[Get.arguments]['image']}",
              height: Get.height * 0.5,
              width: Get.width,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              productsController.products[Get.arguments]['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              productsController.products[Get.arguments]['description'],
              style: TextStyle(fontWeight: FontWeight.w300),
              maxLines: 4,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.2)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ ${productsController.products[Get.arguments]['price'].toString()} ",
                    ),
                    Row(
                      children: [
                        Text(
                          "${productsController.products[Get.arguments]['rating']['rate'].toString()} ",
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow[800],
                        ),
                        Text(
                          " / 5",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
