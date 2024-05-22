import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/login_controller.dart';
import 'package:quizz_flutter/controllers/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(LoginController());
  }
}
