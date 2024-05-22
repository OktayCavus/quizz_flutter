import 'package:get_storage/get_storage.dart';

Map<String, String> headers() {
  final box = GetStorage();
  String? accessToken = box.read('accessToken');

  Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessToken',
    'Accept-Charset': 'utf-8'
  };

  return headers;
}
