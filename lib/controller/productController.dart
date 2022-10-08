import 'package:ecommerce/controller/product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductsController extends GetxController {
  ProductRepository productsRepository = ProductRepository();
  RxBool loading = false.obs;
  List products = [].obs;

  loadProductsFromRepo() async {
    loading(true);
    products = await productsRepository.loadProductsFromApi();
    print(products);
    loading(false);
  }

  var count = 0.obs;
  increment() {
    count++;
    update();
  }
}
