import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseurl;

  late Map<String, String> mainHeaders;
  ApiClient({required this.appBaseurl}) {
    baseUrl = appBaseurl;
    timeout = const Duration(seconds: 30);
    mainHeaders = {
      'Content-type ': 'application/json; Charset = UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(dynamic uri) async {
    try {
      Response response = await (uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
