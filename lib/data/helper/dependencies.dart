import 'package:get/get.dart';
import 'package:mustah_bakery/data/api/api_client.dart';
import 'package:mustah_bakery/data/controller/controller.dart';
import 'package:mustah_bakery/data/repository/recommended_items_repo.dart';

Future<void> init() async {
  //this is for the api
  Get.lazyPut(() => ApiClient(appBaseurl: 'https://okashashaibu.com'));

  //This one for the repository
  Get.lazyPut(() => RecommendedItems(apiClient: Get.find()));
  //This one for the controller
  Get.lazyPut(() => RecommendedItemsController(recommendedItems: Get.find()));
}
