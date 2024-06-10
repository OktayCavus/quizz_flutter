import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/test_screen_controller.dart';

class TestScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TestScreenController());
  }
}
