import 'package:ecommerce/Screens/home.dart';
import 'package:ecommerce/Screens/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'Screens/buy_review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => Home()),
          GetPage(name: '/info', page: () => InfoPage()),
          GetPage(name: '/BuyReview', page: () => RiviewOrder()),
        ]);
  }
}
