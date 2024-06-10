import 'package:get/get.dart';
import 'package:quizz_flutter/controllers/check_code_controller.dart';
import 'package:quizz_flutter/controllers/my_profile_controller.dart';

class CheckCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyProfileController());
    Get.put(CheckCodeController());
  }
}
