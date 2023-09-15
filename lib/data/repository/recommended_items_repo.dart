import 'package:get/get.dart';
import 'package:mustah_bakery/data/api/api_client.dart';

class RecommendedItems extends GetxService {
  final ApiClient apiClient;

  RecommendedItems({required this.apiClient});
  Future<Response> getItemsList() async {
    return await apiClient.getData('endpoint url');
  }
}
