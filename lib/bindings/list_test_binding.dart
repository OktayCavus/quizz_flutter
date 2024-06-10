import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/list_test_controller.dart';

class ListTestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListTestController());
  }
}
