import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  var url = "https://fakestoreapi.com/products";

  loadProductsFromApi() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body).toString());

    return json.decode(response.body);
  }
}
