import 'package:ecommerce/controller/productController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProductsController productsController = Get.put(ProductsController());

  List category = [
    "popular",
    "T-shirt",
    "Pants",
    "Formals",
    "Trousers",
    "Summer Wear",
    "Winter Wear",
  ];

  @override
  void initState() {
    super.initState();
    productsController.loadProductsFromRepo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shop X',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('clothes'),
                          IconButton(
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            onPressed: (() {}),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.filter_list))
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              index == 0 ? Colors.black : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "${category[index]}",
                            style: TextStyle(
                                color:
                                    index == 0 ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Obx(() {
                if (productsController.loading.value == true) {
                  print(productsController.products.length);
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                }
                if (productsController.products.isEmpty) {
                  return const Center(
                    child: Text('Loading....'),
                  );
                }
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: ListView.builder(
                        itemCount: productsController.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  '/info',
                                  arguments: index,
                                );
                              },
                              child: Container(
                                height: 150,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        productsController.products[index]
                                            ['image'],
                                        height: 140,
                                        width: 140,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        width: Get.width - 180,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productsController.products[index]
                                                  ['title'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              productsController.products[index]
                                                  ['description'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w300),
                                              maxLines: 3,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "₹ ${productsController.products[index]['price'].toString()} ",
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${productsController.products[index]['rating']['rate'].toString()} ",
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      size: 20,
                                                      color: Colors.yellow[800],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }));
              }),
            )
          ],
        ),
      ),
    );
  }
}
