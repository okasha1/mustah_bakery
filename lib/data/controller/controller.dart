import 'package:get/get.dart';
import 'package:mustah_bakery/models/cart_model.dart';

class ItemsController extends GetxController {
  //the products selected the user will be added to the list
  final List<CartModel> _productslist = [];

  get productsList => _productslist;
  final int _quantity = 0;
  int get quantity => _quantity;
  void addProduct(CartModel product) {
    if (_productslist.contains(product)) {
      Get.snackbar(
          product.name.toString(), '${product.name} already exist in cart');
    } else {
      _productslist.add(product);

      update();
    }
  }

  void deleteProduct(CartModel product) {
    _productslist.remove(product);
    update();
  }
}
