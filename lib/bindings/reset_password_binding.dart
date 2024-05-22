import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/reset_password_controller.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController());
  }
}
