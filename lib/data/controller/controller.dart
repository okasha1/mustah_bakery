import 'package:get/get.dart';
import 'package:mustah_bakery/models/cart_model.dart';

class ItemsController extends GetxController {
  final List<CartModel> _productslist = [];
  List<CartModel> get productsList => _productslist;
  final int _quantity = 0;
  int get quantity => _quantity;
}
