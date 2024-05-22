import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/forget_password_controller.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ForgetPasswordController());
  }
}
