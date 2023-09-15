import 'package:get/get.dart';
import 'package:mustah_bakery/data/repository/recommended_items_repo.dart';
import 'package:mustah_bakery/models/product_model.dart';

class RecommendedItemsController extends GetxController {
  final RecommendedItems recommendedItems;
  RecommendedItemsController({required this.recommendedItems});
  List<dynamic> _productslist = [];
  List<dynamic> get productsList => _productslist;

  Future<void> getProductsList() async {
    Response response = await recommendedItems.getItemsList();
    if (response.statusCode == 200) {
      _productslist = [];
      // _productslist.addAll(Product.fromJson(response.body)[]);
      update();
    }
  }
}
