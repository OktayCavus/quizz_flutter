import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
