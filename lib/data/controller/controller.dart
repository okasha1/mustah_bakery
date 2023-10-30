import 'package:get/get.dart';
import 'package:mustah_bakery/data/repository/recommended_items_repo.dart';

class RecommendedItemsController extends GetxController {
  final RecommendedItems recommendedItems;
  RecommendedItemsController({required this.recommendedItems});
  List<dynamic> _productslist = [];
  List<dynamic> get productsList => _productslist;
}
